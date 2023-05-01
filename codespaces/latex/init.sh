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
sudo /usr/local/texlive/$TEXLIVE_VERSION/bin/x86_64-linux/tlmgr install xetex biblatex biber float standalone

echo ""
echo "Setting up environment..."
echo "export PATH=$PATH:/usr/local/texlive/$TEXLIVE_VERSION/bin/x86_64-linux" >> ~/.bashrc
cd ..
sed -i "s/TEXLIVE_VERSION/$TEXLIVE_VERSION/g" .devcontainer/devcontainer.json
wget -O .gitignore https://raw.githubusercontent.com/github/gitignore/main/TeX.gitignore

echo "> Running clean up"

sudo rm -rf tmp/
echo ""
echo "> Done"

echo ""
echo "Runnning tests..."
EXPECTED_XETEX="/usr/local/texlive/$TEXLIVE_VERSION/bin/x86_64-linux/xetex"
EXPECTED_BIBER="/usr/local/texlive/$TEXLIVE_VERSION/bin/x86_64-linux/biber"

ACTUAL_XETEX="$(which xetex)"
ACTUAL_BIBER="$(which biber)"

if [ "$EXPECTED_XETEX" = "$ACTUAL_XETEX" ]; then
    echo "xetex installed correctly"
else
    echo "xetex not installed correctly"
    exit 1
fi

if [ "$EXPECTED_BIBER" = "$ACTUAL_BIBER" ]; then
    echo "biber installed correctly"
else
    echo "biber not installed correctly"
    exit 1
fi
