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
echo "Detecting texlive version..."
TEXLIVE_VERSION=$(ls -1 /usr/local/texlive/ | grep "^[0-9][0-9][0-9][0-9]$")
echo "Detected texlive version: $TEXLIVE_VERSION"


echo ""
echo "Installing packages..."
sudo /usr/local/texlive/$TEXLIVE_VERSION/bin/x86_64-linux/tlmgr install pdflatex biblatex biber float standalone babel-german

echo ""
echo "Setting up environment..."
echo "export PATH=$PATH:/usr/local/texlive/$TEXLIVE_VERSION/bin/x86_64-linux" >> ~/.bashrc
cd ..
sed -i "s/TEXLIVE_VERSION/$TEXLIVE_VERSION/g" .vscode/settings.json
wget -O .gitignore https://raw.githubusercontent.com/github/gitignore/main/TeX.gitignore

echo "> Running clean up"

sudo rm -rf tmp/
echo ""
echo "> Done"
