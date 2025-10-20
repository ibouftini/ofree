%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{insea}[2021/04/21 Example class]

%%Preliminary definitions, needed by the options
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage[table,xcdraw]{xcolor}

%%This parts handles the options passed to the class.
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[french, 12pt, twoside]{report}

%%Body of the class, most of the declarations appear here.

\RequirePackage{textcomp}
\RequirePackage[T1]{fontenc, url}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}
\RequirePackage{multirow}
\RequirePackage{minted} % Code highlighting
\RequirePackage{adjustbox}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amssymb, amsthm} % Mathematical packages
\RequirePackage{pdfpages}  % For inserting PDF pages
\RequirePackage{indentfirst}
%\RequirePackage{parskip} % Removing indenting in new paragraphs
\urlstyle{sf}
\RequirePackage{color}
\RequirePackage{subcaption} 
\RequirePackage{appendix}

\RequirePackage{chngcntr} % needed for correct table numbering
\counterwithin{table}{section} % numbering of tables 
\counterwithin{figure}{section} % numbering of figures
\numberwithin{equation}{section} % numbering of equations
\hyphenpenalty=100000 % preventing splitting of words
\sloppy 
\raggedbottom 

\RequirePackage{xparse,nameref}
\RequirePackage[bottom]{footmisc} % Fotnotes are fixed to bottom of page
\RequirePackage{lipsum} % For genereating dummy text


\RequirePackage{tikz}
\usetikzlibrary{calc, backgrounds}

\RequirePackage{shorttoc}
\RequirePackage{hyperref}
% ----- Appearance and language ----- 
\RequirePackage[english]{babel} % document language

\RequirePackage[margin=2.5cm]{geometry} % sets margins for the document
\RequirePackage{setspace}
\linespread{1.5} % line spread for the document
\RequirePackage{microtype}

% -------- tikz libs -----------
\usetikzlibrary{calc,trees,positioning,arrows,chains,shapes.geometric,decorations.pathreplacing,decorations.pathmorphing,shapes,matrix,shapes.symbols, shapes.multipart}


% ----- Sections -----
\titleformat*{\section}{\LARGE\bfseries} % \section heading
\titleformat*{\subsection}{\Large\bfseries} % \subsection heading
\titleformat*{\subsubsection}{\large\bfseries} % \subsubsection heading
% next three lines creates the \paragraph command with correct heading 
\titleformat{\paragraph}
{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

% ----- Figures and tables ----- 
\RequirePackage{fancyhdr}
\RequirePackage{subfiles}
\RequirePackage{array}
\RequirePackage[rightcaption]{sidecap}
\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage[labelfont=bf]{caption} % bold text for captions
\RequirePackage[para]{threeparttable} % fancy tables, check these before you use them
\RequirePackage{url}
\RequirePackage{makecell}
\RequirePackage{hhline}


% ----- Sources -----

% \RequirePackage{natbib}
\RequirePackage[numbers, sort&compress]{natbib}

\bibliographystyle{unsrtnat} % citation and reference list style

\newcommand{\setbib}[1]{\def\biblio{\clearpage\bibliographystyle{unsrtnat}\bibliography{#1.bib}} }
% defines the \biblio command used for referencing in subfiles - DO NOT CHANGE
\renewcommand\refname{References}
% ----- Header and footer -----
\pagestyle{fancy}
\fancyhead{}
% \fancyhead[R]{\thepage} % page number on right for odd pages and left for even pages in the header
\fancyhead[L]{\nouppercase{\rightmark}} % chapter name and number on the right for even pages and left for odd pages in the header
%\renewcommand{\headrulewidth}{0pt} % sets thickness of header line
\fancyfoot{} % removes page number on bottom of page
\fancyfoot[R]{\thepage} % Page number in the bottom-right corner



% ----- Custom commands ----- 

\renewcommand{\appendixpagename}{Annexes} % Heading of appendix
\renewcommand{\appendixtocname}{Annexes} 


\newcommand{\@supervisor}{\relax}
\newcommand\supervisor[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\@acknowledgement}{Acknowledgement}
\newcommand{\@dedicace}{Dedication}
% ----- Custom envs ----- 
\newenvironment{acknowledgement}
    {
    \chapter*{\@acknowledgement}
    \addcontentsline{toc}{chapter}{\@acknowledgement} % Adds this page to the Table of Contents
    \markboth{\@acknowledgement}{\@acknowledgement}
    }
    { 
    
        \vspace*{3\baselineskip}
        
        \center Institut National de Statistique et Économie Appliquée\\
        
        \center Rabat, \@date
        \vspace*{3\baselineskip}
        
    }
\newenvironment{dedicace}
    {
    \chapter*{\@dedicace}
    \addcontentsline{toc}{chapter}{\@dedicace} % Adds this page to the Table of Contents
    \markboth{\@dedicace}{\@dedicace}
    \itshape\centering\Huge\vfill

    }
    { 
    \vfill
    }



% ----- Header of the frontpage ----- 
\fancypagestyle{frontpage}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\vspace*{1\baselineskip}
	
	%\fancyhead[R]{École Nationale de Commerce et de Gestion
	%\linebreak       Casablanca, 2020\vspace*{.5\baselineskip}}
	%\fancyhead[L]{ \includegraphics[width=1.8in]{Logoencg.png}} % change to nhhlogo1.png for golden NHH logo
}

\definecolor{dg}{HTML}{018754}
\definecolor{lg}{HTML}{79b695}
\definecolor{wg}{HTML}{c4dcce}
\tikzstyle{background rectangle}=[thin,draw=lg,fill=wg, rounded corners=1ex]



\renewcommand{\maketitle}{%
\begin{titlepage}%
\includepdf[pages=1]{cover-page.pdf}
\end{titlepage}
}

% \renewcommand{\maketitle}{%
% \begin{titlepage}%
% \newgeometry{left=0pt, right=0pt, top=20pt, bottom=0pt}%
% \begin{tikzpicture}[remember picture, overlay, yshift=5cm, every path/.style={ dg}]%
%     \draw ([xshift=6.5cm]current page.north west) .. controls ([xshift=6.25cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-8.5cm]current page.north west);
%     \draw ([xshift=7cm]current page.north west) .. controls ([xshift=6.75cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-9cm]current page.north west);
%     \draw ([xshift=7.5cm]current page.north west) .. controls ([xshift=7.25cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-9.5cm]current page.north west);
%     \draw ([xshift=8cm]current page.north west) .. controls ([xshift=7.75cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-10cm]current page.north west);
%     \draw ([xshift=8.5cm]current page.north west) .. controls ([xshift=8.25cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-10.5cm]current page.north west);
%     \draw ([xshift=9cm]current page.north west) .. controls ([xshift=8.75cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-11cm]current page.north west);
%     \draw ([xshift=9.5cm]current page.north west) .. controls ([xshift=9.25cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-11.5cm]current page.north west);
%     \draw  ([xshift=10cm]current page.north west) .. controls ([xshift=9.75cm,yshift=-4cm]current page.north west) and  ([xshift=1cm,yshift=-5cm]current page.north west) .. ([yshift=-12cm]current page.north west);
% \end{tikzpicture}%\vspace*{-1\baselineskip}
% \begin{center}%
%     % \includegraphics[width=100pt, trim={0 0 0 1.5cm}, clip]{img/insea.png}
%     \begin{minipage}{.6\textwidth}
%         \vspace*{-60pt}
%         \centering\scshape Royaume du Maroc\\
%         Haut Commissariat au Plan\\
%         Institut National de Statistique \\et d’Économie Appliquée\\[1.5ex]
%         {\Huge \color{lg} INSEA}
%     \end{minipage}
%     \vspace*{2\baselineskip}
%     \includegraphics[width=70pt, angle=1, origin=c]{img/logo/insea.png}
    
%     \vfill
    
%     \begin{minipage}{.6\textwidth}\centering
%         \begin{tikzpicture}[show background rectangle]
%             \node[align=center, text width=11cm, inner sep=1em]{
%              \Large \scshape \color{dg} \@title
%             };
%             \node[xshift=3ex, yshift=-0.7ex, overlay, fill=lg, draw=dg, above
%             right, rounded corners=.3ex] at (current bounding box.north west) {
%             \textit{\large \color{white} Sujet:}
%             };
%         \end{tikzpicture} 
%     \end{minipage} 
    
%     \vfill
%     \begin{minipage}{.6\textwidth}\centering
%         \begin{tabular}{l@{ \textbf{:} }r}
%             \textbf{Réalisé par} & \@author\\
%             \textbf{Encadré par} & \@supervisor\\
%             \textbf{Annee universitaire} & \@date
%         \end{tabular}
%     \end{minipage}
%     \vfill
%     %\vspace*{20\baselineskip}
% \end{center}%
% \begin{tikzpicture}[remember picture, overlay, shift={(current page.south west)}, every path/.style={ dg}]%
%     \path [fill=dg] ([xshift=-6cm]current page.south east) .. controls ([xshift=-5.75cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=8cm]current page.south east) -- (current page.south east) -- cycle;
%     \draw ([xshift=-6.5cm]current page.south east) .. controls ([xshift=-6.25cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=8.5cm]current page.south east);
%     \draw ([xshift=-7cm]current page.south east) .. controls ([xshift=-6.75cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=9cm]current page.south east);
%     \draw ([xshift=-7.5cm]current page.south east) .. controls ([xshift=-7.25cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=9.5cm]current page.south east);
%     \draw ([xshift=-8cm]current page.south east) .. controls ([xshift=-7.75cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=10cm]current page.south east);
%     \draw ([xshift=-8.5cm]current page.south east) .. controls ([xshift=-8.25cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=10.5cm]current page.south east);
%     \draw ([xshift=-9cm]current page.south east) .. controls ([xshift=-8.75cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=11cm]current page.south east);
%     \draw ([xshift=-9.5cm]current page.south east) .. controls ([xshift=-9.25cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=11.5cm]current page.south east);
%     \draw  ([xshift=-10cm]current page.south east) .. controls ([xshift=-9.75cm,yshift=4cm]current page.south east) and  ([xshift=-1cm,yshift=5cm]current page.south east) .. ([yshift=12cm]current page.south east);
% \end{tikzpicture}
% \restoregeometry
% \end{titlepage}
% }

\makeatletter
\@addtoreset{chapter}{part}
\makeatother  

\renewcommand{\and}{\\ \multicolumn{1}{c}{} &}

\renewcommand\thesubsubsection{\arabic{subsection}.\roman{subsubsection}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesection{\arabic{section}}

\setlength{\parindent}{1.5cm}
%  ----- Header of the frontpage ----- 

\RequirePackage[acronym, toc]{glossaries}

\newcommand{\gui}[1]{«#1»}
\RequirePackage{varwidth}


\RequirePackage{booktabs}
