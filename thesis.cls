%% Copyright (C) 2022 Alessandro Clerici Lorenzini
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Alessandro Clerici Lorenzini
%
% This work consists of the files listed in work.txt


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
	\newgeometry{bottom=3cm}
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
	\restoregeometry
}

\newcommand{\prefacetitle}{\iflanguage{italian}{Introduzione}{Preface}}
\newcommand{\preface}{
	\chapter*{\prefacetitle}
	\addcontentsline{toc}{chapter}{\prefacetitle}
}
