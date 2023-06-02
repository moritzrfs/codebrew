#!/bin/sh

get_primary_ip() {
    primary_ip=$(hostname -I | awk '{print $1}')
    echo $primary_ip
}

ip=$(get_primary_ip)

echo $ip

mkdir /etc/ssl/certs && cd /etc/ssl/certs

openssl genrsa -out docker-ca-key.pem 4096
openssl req -new -x509 -days 365 -key docker-ca-key.pem -sha256 -out docker-ca.pem

openssl genrsa -out docker-server-key.pem 4096

openssl req -subj "/CN=$ip" -sha256 -new -key docker-server-key.pem -out docker-server.csr

echo subjectAltName = DNS:$ip,IP:$ip > extfile.cnf
openssl x509 -req -days 365 -sha256 -in docker-server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out docker-server-cert.pem -extfile extfile.cnf

sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376 --tlsverify --tlscacert=/etc/ssl/certs/docker-ca.pem --tlscert=/etc/ssl/certs/server-cert.pem --tlskey=/etc/ssl/certs/docker-server-key.pem|' /lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker

echo "Docker TLS setup complete"
echo "#############################################"
echo "Server IP: $ip"
echo "#############################################"