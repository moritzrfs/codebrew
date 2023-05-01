# LaTeX Codespace

This codespace is a pre-configured environment for building LaTeX documents fully in the browser. It includes the following components:

- [TeX Live](https://www.tug.org/texlive/) - A basic LaTeX distribution without src and docs (This drastically reduces the size of the image)
  -  [xetex](https://www.tug.org/xetex/) - A TeX typesetting engine using Unicode and supporting modern font technologies such as OpenType and Apple Advanced Typography (AAT).
  -  [biblatex](https://ctan.org/pkg/biblatex) - A complete reimplementation of the bibliographic facilities provided by LaTeX in conjunction with BibTeX.
  -  [biber](https://ctan.org/pkg/biber) - A BibTeX replacement for users of biblatex.
  -  [float](https://ctan.org/pkg/float) - Improved interface for floating objects.
  -  [standalone](https://ctan.org/pkg/standalone) - Compile TeX pictures stand-alone or as part of a document.


- [Dynamic Configuration for LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
  - Automatically detects the LaTeX distribution and tools.
  - Configures the LaTeX Workshop extension to use the detected tools.
  - Configures the recipe to use `xetex` to build the LaTeX project.

- An easy-to-use script that automatically detects `\usepackage` dependencies and installs them.
- Default TeX `.gitignore` file.

## How to use

1. Copy the contents of this folder into a repository. This includes the `.devcontainer` folder, the `tools` folder and the `init.sh` file.
2. Run the codespace by visiting the repository in GitHub and clicking the green "Code" button. Select "Open with Codespaces" and wait for the codespace to be created.
3. Wait for the Codespace to be created. **This takes about 5 minutes for the first time**. The progress can be seen in the Codespace creation logs or within the belonging Terminal tab.