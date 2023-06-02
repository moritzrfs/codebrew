#!/bin/sh

echo -n "Container name: "
read container_name

mkdir -p /usr/local/terraform-docker/$container_name
cd /usr/local/terraform-docker/$container_name

terraform init