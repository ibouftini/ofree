# LaTeX Compiler Workflow

Automatic LaTeX compilation on GitHub with intelligent change detection, multi-compiler support, and zero configuration.

## Quick Start

1. **Fork this repository**
2. **Enable GitHub Actions write permissions:**
   - Go to `Settings` → `Actions` → `General`
   - Scroll to "Workflow permissions"
   - Select "Read and write permissions"
   - Click "Save"
3. **Start writing LaTeX:**
   - Edit `main.tex` or create new `.tex` files
   - Commit and push
   - Your PDFs appear automatically in the repository

That's it! No configuration needed.

## Features

### Automatic PDF Generation
Write LaTeX, push to GitHub, get PDFs. The workflow compiles your documents and commits them back to your repository automatically.

### Multi-Document Support
Place multiple `.tex` files in the root directory. Each main document (containing `\documentclass`) compiles independently.

### Smart Change Detection
Only modified documents recompile. Edit one file in a 10-document project, and only that file rebuilds. Saves time and CI minutes.

### Multi-Compiler Support
Use **pdflatex**, **xelatex**, or **lualatex** with a single line:

```latex
% !TeX program = xelatex
\documentclass{article}
...
```

Or let it auto-detect from packages:
- `fontspec` → XeLaTeX
- `luacode` → LuaLaTeX
- Default → pdflatex

### Automatic Package Management
Missing a LaTeX package? The workflow installs it automatically. No manual package lists needed.

### Intelligent Compilation
Simple documents compile in one pass. Documents with bibliographies, cross-references, or table of contents automatically get multiple compilation passes via latexmk.

### Efficient Caching
TeX Live installation cached (~200 MB). Subsequent runs complete in ~30 seconds instead of minutes.

## Usage Examples

### Basic Document (pdflatex)
```latex
\documentclass{article}
\begin{document}
Hello World
\end{document}
```
Compiles with pdflatex automatically.

### Multilingual Document (XeLaTeX)
```latex
% !TeX program = xelatex
\documentclass{article}
\usepackage{fontspec}
\setmainfont{Noto Serif}
\begin{document}
English, Français, 中文, العربية
\end{document}
```
Compiles with XeLaTeX, installs fonts automatically.

### Multiple Documents
```
repository/
├── main.tex          → main.pdf
├── appendix.tex      → appendix.pdf
└── slides.tex        → slides.pdf
```
All compile independently when changed.

## How It Works

### Workflow Architecture

The workflow uses a two-phase compilation strategy:

**Phase 1: Package Installation**
- `texliveonfly` detects missing packages
- Installs them automatically via `tlmgr`
- Generates initial PDF

**Phase 2: Smart Compilation (conditional)**
- Analyzes document for advanced features
- Runs `latexmk` if bibliography, cross-references, or TOC detected
- Skipped for simple documents

### Key Steps

1. **Change Detection**
   - Git diff analysis
   - Checks main files, included files, bibliography files, style files
   - Only compiles affected documents

2. **Compiler Detection**
   - Priority 1: `% !TeX program =` directive
   - Priority 2: Package analysis (fontspec → xelatex, luacode → lualatex)
   - Priority 3: Default to pdflatex

3. **Caching Strategy**
   - TeX Live base installation cached
   - Compilers (XeLaTeX/LuaLaTeX) installed on-demand and cached
   - System fonts cached for XeLaTeX
   - Single cache for all compiler types

4. **Compilation Process**
   ```
   Change detected → Determine compiler → Phase 1 (texliveonfly) 
   → Phase 2 if needed (latexmk) → Commit PDF
   ```

### File Structure

```
.github/workflows/
└── latex-compiler.yml    # Main workflow (single file)

Repository root:
├── *.tex                 # Your LaTeX documents
├── *.bib                 # Bibliography files
├── *.cls, *.sty          # Custom classes/styles
└── *.pdf                 # Generated PDFs (auto-committed)
```

### Modifying the Workflow

**Change default compiler:**
```yaml
env:
  DEFAULT_LATEX_COMPILER: xelatex  # or lualatex
```

**Add custom packages to base installation:**
```yaml
- name: Install TeX Live
  run: |
    $BIN_DIR/tlmgr install \
      latexmk amsmath graphics \
      your-package-here
```

**Adjust cache version (force fresh install):**
```yaml
key: texlive-fonts-2025-v6-${{ runner.os }}  # increment v5 → v6
```

## Comparison with xu-cheng/latex-action

| Feature | xu-cheng/latex-action | This Workflow |
|---------|----------------------|---------------|
| **Approach** | Docker container | Native installation |
| **Setup** | 3 lines in workflow file | Fork + enable permissions |
| **Package Management** | Manual specification | Automatic detection |
| **Multi-document** | Manual loop required | Built-in support |
| **Compiler Detection** | Manual specification | Automatic via directive/packages |
| **Change Detection** | None (compiles all) | Smart (compiles only changed) |
| **Auto-commit PDF** | No (manual setup) | Yes (built-in) |
| **Caching** | Docker layers (4-5 GB) | TeX Live (200-500 MB) |
| **First Run** | ~2-3 min | ~2-3 min |
| **Cached Run** | ~1-2 min | ~30 sec |
| **Storage** | 4-5 GB | 200-500 MB |
| **Customization** | Limited to action inputs | Full workflow editing |
| **Maintenance** | External dependency | Self-contained |

**Use xu-cheng if:** You want a quick 3-line solution and don't need auto-commit or multi-document support.

**Use this workflow if:** You want automatic PDF commits, multi-document compilation, smart change detection, and minimal storage overhead.

## Technical Details

### Cache Strategy
- **Key:** `texlive-fonts-2025-v5-Linux`
- **Paths:** `~/texlive/2025`, `~/.fonts`
- **Size:** ~200 MB (pdflatex only), ~500 MB (with XeLaTeX/fonts)
- **Incremental:** Compilers installed on-demand into same cache

### Compilation Time
- **pdflatex (simple doc):** 30-40s cached, 2 min first run
- **pdflatex (with bib):** 1-2 min cached, 2-3 min first run  
- **xelatex (first run):** 3-4 min (includes font installation)
- **xelatex (cached):** 30-40s

### CI Minutes Usage
For 100 commits/month with cached runs:
- Simple docs: ~50 minutes/month
- Complex docs: ~100 minutes/month

Compare to xu-cheng: ~100-150 minutes/month (no change detection)

## Requirements

- GitHub repository with LaTeX files
- Write permissions enabled for GitHub Actions
- `.tex` files in repository root (not subdirectories)

## Limitations

- Documents must be in repository root
- No support for subdirectory compilation
- Binary output (PDFs) committed to repository (may bloat git history)
- Requires `\documentclass` to detect main documents

## Contributing

Contributions welcome! This workflow is self-contained in a single YAML file, making it easy to fork and modify.

## License

MIT License - Feel free to use and modify for your projects.

## Credits

Built with:
- [TeX Live](https://tug.org/texlive/) - Comprehensive TeX system
- [texliveonfly](https://ctan.org/pkg/texliveonfly) - Automatic package installation
- [latexmk](https://ctan.org/pkg/latexmk) - Smart compilation automation
- [GitHub Actions](https://github.com/features/actions) - CI/CD platform
