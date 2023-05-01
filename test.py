import sys
import re
import subprocess

# Dateiname der LaTeX-Datei aus den Kommandozeilenargumenten extrahieren
if len(sys.argv) > 1:
    latex_filename = sys.argv[1]
else:
    print("Bitte geben Sie den Dateinamen der LaTeX-Datei als Parameter an.")
    sys.exit()

# LaTeX-Code aus der Datei lesen
with open(latex_filename, "r") as f:
    latex_code = f.read()

# Regex-Pattern zum Extrahieren der Paketnamen
pattern = r"\\usepackage(?:\[(.*?)\])?\{(.*?)\}"

# Paketnamen extrahieren
packages = [pkg[1] for pkg in re.findall(pattern, latex_code)]

installs = ''
for 

# Shell-Befehl zur Installation der Pakete erstellen
# tlmgr_command = ["sudo", "/usr/local/texlive/2023/bin/x86_64-linux/tlmgr", "install"] + packages

# Shell-Befehl ausführen
# subprocess.run(tlmgr_command)

print(packages)