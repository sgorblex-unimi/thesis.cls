\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[Thesis class by Alessandro "Sgorblex" Clerici Lorenzini]

\newif\if@compact
\DeclareOption{compact}{\@compacttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass{report}

\RequirePackage[base]{babel}
\RequirePackage{graphics}

\RequirePackage{geometry}
\if@compact
	\geometry{
		paperheight=\dimexpr\textheight+8mm\relax,
		paperwidth=\dimexpr\textwidth+2mm\relax,
		left=1mm,
		top=4mm,
		right=1mm,
		bottom=4mm
	}
\else
	\geometry{includehead}
	\pagestyle{headings}
\fi

% override text parameters
\renewcommand{\baselinestretch}{1.1}

% front matter
\newcommand{\supervtext}{\iflanguage{italian}{relatore}{supervisor}}
\newcommand{\cosupervtext}{\iflanguage{italian}{correlatore}{co-supervisor}}
\newcommand{\matrtext}{\iflanguage{italian}{numero di matricola}{student number}}

\newcommand{\logo}[1]{\newcommand{\@logo}{#1}}
\newcommand{\university}[1]{\newcommand{\@university}{#1}}
\newcommand{\dept}[1]{\newcommand{\@dept}{#1}}
\newcommand{\degr}[1]{\newcommand{\@degr}{#1}}
\newcommand{\superv}[1]{\newcommand{\@superv}{#1}}
\newcommand{\cosuperv}[1]{\newcommand{\@cosuperv}{#1}}
\newcommand{\matr}[1]{\newcommand{\@matr}{#1}}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{center}
		\ifdefined \@logo
			\includegraphics{\@logo}
		\fi

		\Large
		\ifdefined \@university
			\textsc{\@university} \\
		\fi
		\ifdefined \@dept
			\@dept \\
		\fi
		\ifdefined \@degr
			\@degr
		\fi
	\end{center}
	\vskip 1in
	\begin{center}
		\Huge{\textsc{\expandafter{\@title}}}
	\end{center}
	\vskip 0.6in
	\hfill
	\parbox{3in}{
		\begin{flushright}
			{\Large \@author} \\[1ex]
			\matrtext~\@matr
		\end{flushright}
	}
	\vskip 1in
	\begin{description}
		\large
		\ifdefined \@superv
		\item[\footnotesize\MakeUppercase{\supervtext}] \@superv
			\fi
			\ifdefined \@cosuperv
		\item[\footnotesize\MakeUppercase{\cosupervtext}] \@cosuperv
			\fi
	\end{description}
	\vfill
	\begin{center}
		\large \@date
	\end{center}
	\newpage
}
