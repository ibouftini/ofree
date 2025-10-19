# 📄 Ofree : Automatic LaTeX compilation

[![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-2088FF?logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![TeX Live 2025](https://img.shields.io/badge/TeX%20Live-2025-3D6117?logo=latex&logoColor=white)](https://tug.org/texlive/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


## 🚀 Quick Start

Get your LaTeX documents compiling automatically in **3 simple steps**:

### 1️⃣ Fork this repository

Click the **Fork** button at the top right of this page.

### 2️⃣ Enable write permissions

Navigate to your fork's settings:

```
Settings → Actions → General → Workflow permissions
```

Select **"Read and write permissions"** → Click **Save**

### 3️⃣ Start writing LaTeX

Edit `main.tex` or create new `.tex` files, commit, and push. Watch your PDFs appear automatically! ✨

Consider that the first compilation takes ~1mins so that packages can be installed.

Later compilations use cached files from the first one!



## ✨ Features

<table>
<tr>
<td width="50%">

### 🔄 Automatic PDF Generation
Write LaTeX, push to GitHub, get PDFs. Documents compile and commit automatically—no manual builds needed.

### 📚 Multi-Document Support  
Multiple `.tex` files? No problem. Each main document compiles independently, in parallel workflows.

### ⚡ Smart Change Detection
Only modified documents recompile. Edit 1 file in a 10-document project → only that file rebuilds. **Saves time and CI minutes.**

</td>
<td width="50%">

### 🌍 Multi-Compiler Support
Switch between **pdflatex**, **xelatex**, or **lualatex** with one line. Auto-detection from packages included.

### 📦 Automatic Package Management
Missing packages? Installed automatically. No configuration files, no package lists—it just works.

### 🧠 Intelligent Compilation
Simple docs compile once. Complex docs with bibliographies or cross-references get multiple passes automatically via latexmk.

</td>
</tr>
</table>

### 💾 Efficient Caching
TeX Live installation cached (~200 MB). Subsequent runs complete in **~30 seconds** instead of minutes.

---

## 📖 Usage Examples

### Basic Document (pdflatex)
```latex
\documentclass{article}
\begin{document}
Hello World! 🌍
\end{document}
```
> ✅ Compiles with pdflatex automatically

### Multilingual Document (XeLaTeX)
```latex
% !TeX program = xelatex
\documentclass{article}
\usepackage{fontspec}
\setmainfont{Noto Serif}
\begin{document}
English • Français • 中文 • العربية
\end{document}
```
> ✅ Compiles with XeLaTeX, installs fonts automatically

### Multiple Documents
```
📁 repository/
├── 📄 main.tex          → main.pdf
├── 📄 appendix.tex      → appendix.pdf
└── 📄 slides.tex        → slides.pdf
```
> ✅ All compile independently when changed

---

## 🛠️ How It Works

### 🎯 Key Components

#### 1. Change Detection
```yaml
Git diff → Check main files, includes, bib files, styles → Compile affected only
```

#### 2. Compiler Detection  
| Priority | Method | Example |
|----------|--------|---------|
| 1️⃣ | Explicit directive | `% !TeX program = xelatex` |
| 2️⃣ | Package analysis | `fontspec` → xelatex |
| 3️⃣ | Default | pdflatex |

#### 3. Caching Strategy
```
📦 Cache: ~/texlive/2025 + ~/.fonts
🔑 Key: texlive-fonts-2025-v5-Linux
💾 Size: 200 MB (pdflatex) | 500 MB (with XeLaTeX)
⚡ Strategy: Incremental (compilers added on-demand)
```

#### 4. Compilation Flow
```bash
Change detected → Determine compiler → Cache TeX Live → 
Phase 1 (texliveonfly) → Phase 2 (latexmk if needed) → Commit PDF
```

---

## 📊 Comparison with xu-cheng/latex-action

<table>
<thead>
<tr>
<th>Feature</th>
<th align="center">xu-cheng/latex-action</th>
<th align="center">This Workflow</th>
</tr>
</thead>
<tbody>
<tr>
<td><b>Approach</b></td>
<td align="center">🐳 Docker container</td>
<td align="center">⚙️ Native installation</td>
</tr>
<tr>
<td><b>Setup</b></td>
<td align="center">3 lines in workflow</td>
<td align="center">Fork + enable permissions</td>
</tr>
<tr>
<td><b>Package Management</b></td>
<td align="center">❌ Manual specification</td>
<td align="center">✅ Automatic detection</td>
</tr>
<tr>
<td><b>Multi-document</b></td>
<td align="center">⚠️ Manual loop required</td>
<td align="center">✅ Built-in support</td>
</tr>
<tr>
<td><b>Compiler Detection</b></td>
<td align="center">❌ Manual specification</td>
<td align="center">✅ Auto via directive/packages</td>
</tr>
<tr>
<td><b>Change Detection</b></td>
<td align="center">❌ None (compiles all)</td>
<td align="center">✅ Smart (changed files only)</td>
</tr>
<tr>
<td><b>Auto-commit PDF</b></td>
<td align="center">❌ No</td>
<td align="center">✅ Yes (built-in)</td>
</tr>
<tr>
<td><b>Caching</b></td>
<td align="center">4-5 GB (Docker layers)</td>
<td align="center">200-500 MB (TeX Live)</td>
</tr>
<tr>
<td><b>First Run</b></td>
<td align="center">⏱️ 2-3 min</td>
<td align="center">⏱️ 2-3 min</td>
</tr>
<tr>
<td><b>Cached Run</b></td>
<td align="center">⏱️ 1-2 min</td>
<td align="center">⚡ 30 sec</td>
</tr>
<tr>
<td><b>Storage Overhead</b></td>
<td align="center">💾 4-5 GB</td>
<td align="center">💾 200-500 MB</td>
</tr>
<tr>
<td><b>Customization</b></td>
<td align="center">⚠️ Limited to inputs</td>
<td align="center">✅ Full workflow editing</td>
</tr>
<tr>
<td><b>Maintenance</b></td>
<td align="center">✅ External (xu-cheng)</td>
<td align="center">⚙️ Self-contained</td>
</tr>
</tbody>
</table>

## ⚙️ Advanced Configuration

### Add Custom Packages
```yaml
- name: Install TeX Live
  run: |
    $BIN_DIR/tlmgr install \
      latexmk amsmath graphics \
      your-custom-package
```

### Force Fresh Installation
```yaml
key: texlive-fonts-2025-v6-${{ runner.os }}  # increment version
```

---

## 📋 Requirements

| Requirement | Description |
|-------------|-------------|
| 🔐 **Write Permissions** | Enable in Actions settings |
| 📁 **Root Directory** | `.tex` files must be in repository root |
| 📄 **Document Class** | Files must contain `\documentclass` |

---

## ⚠️ Limitations

- 📁 Documents must be in repository root (not subdirectories)
- 📦 Binary PDFs committed to repository (may bloat git history)
- 🔍 Requires `\documentclass` to detect main documents

---

## 🤝 Contributing

Contributions welcome! This workflow is **self-contained in a single YAML file**, making it easy to fork and modify.

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## 📜 License

**MIT License** - Feel free to use and modify for your projects.

---

## 🙏 Credits

Built with amazing open-source tools:

| Tool | Description |
|------|-------------|
| [TeX Live](https://tug.org/texlive/) | Comprehensive TeX system |
| [texliveonfly](https://ctan.org/pkg/texliveonfly) | Automatic package installation |
| [latexmk](https://ctan.org/pkg/latexmk) | Smart compilation automation |
| [GitHub Actions](https://github.com/features/actions) | CI/CD platform |

---

<div align="center">

### ⭐ Star this repository if you find it useful!

**Made with ❤️ for the LaTeX community**

[Report Bug](../../issues) · [Request Feature](../../issues) · [Discussions](../../discussions)

</div>
