#!/usr/bin/sh

echo ""
echo "Downloading texlive..."
mkdir -p tmp
cd tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat install-tl-unx.tar.gz | tar xf -
cd install-tl-*
sudo perl ./install-tl --no-interaction --no-doc-install --no-src-install --scheme=basic
cd ..

echo ""
echo "Installing packages..."
sudo /usr/local/texlive/2023/bin/x86_64-linux/tlmgr install xetex biblatex biber float standalone

echo ""
echo "Setting up environment..."
echo "export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux" >> ~/.bashrc
source ~/.bashrc

echo "> Running clean up"
cd ..
sudo rm -rf tmp/

echo ""
echo "> Done"
