#!/usr/bin/sh

echo ""
echo "> Download texlive"
mkdir -p tmp
cd tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat install-tl-unx.tar.gz | tar xf -
cd install-tl-*
sudo perl ./install-tl --no-interaction --no-doc-install --no-src-install --scheme=basic
cd ..

echo ""
echo "> Install packages"
sudo /usr/local/texlive/2023/bin/x86_64-linux/tlmgr install xetex biblatex biber float standalone xcolor titling booktabs
wget http://cpanmin.us/ -O cpanm
chmod +x cpanm
sudo ./cpanm File::HomeDir YAML::Tiny
sudo apt update
sudo apt install -y pdf2svg fonts-firacode

echo ""
echo "> Setup environment"
echo "export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux" >>~/.bashrc

echo "> Running clean up"
cd ..
sudo rm -rf tmp/

echo ""
echo "> Done"
