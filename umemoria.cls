%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%
%%%%%%%%	Clase U-Memoria
%%%%%%%%	Primer Autor: Nikolas Tapia M.
%%%%%%%%  Contacto: ntapia@dim.uchile.cl
%%%%%%%%	Version: 1.6.1
%%%%%%%%	Fecha: 23-09-2021
%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{umemoria}[2021/09/23 v1.6 Clase LaTeX para estandarizacion de Memorias U. de Chile]

%% Definicion de Condicionales
\newif\if@swapnum
\newif\if@contnum
\newif\if@en
\@swapnumfalse
\@contnumtrue
\@enfalse

%% Declaracion de Opciones
\DeclareOption{leftnum}{\@swapnumtrue}
\DeclareOption{rightnum}{\@swapnumfalse}
\DeclareOption{contnum}{\@contnumtrue}
\DeclareOption{english}{\@entrue}
\DeclareOption{nocontnum}{\@contnumfalse}
\DeclareOption{uprightd}{\AtEndOfPackage{\DeclareMathSymbol{d}{\mathalpha}{operators}{`d}}}
\DeclareOption{uprighte}{\AtEndOfPackage{\DeclareMathSymbol{e}{\mathalpha}{operators}{`e}}}
\DeclareOption{uprighti}{\AtEndOfPackage{\DeclareMathSymbol{i}{\mathalpha}{operators}{`i}}}
\DeclareOption{upright}{\ExecuteOptions{uprightd,uprighte,uprighti}}

%% Pasar Opciones a clase Book
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,oneside]{book}

%% Packages necesarios
\RequirePackage{fontspec}

%% Márgenes bonitos
% \RequirePackage[left=1.75in, right=1.75in, top=1.25in, bottom=1.5in, paper=letterpaper]{geometry} % Margenes

%% Márgenes horribles porque eso es lo que pide la universidad ヽ(ಠ_ಠ) ノ
\RequirePackage[left=3cm, right=2cm, top=2cm, bottom=2cm, paper=letterpaper]{geometry} % Margenes

%% Formato
\usepackage{parskip}

%% Caption antes de la tabla
\RequirePackage{caption}
\captionsetup[table]{position=above}

\RequirePackage[toc, page]{appendix}

\RequirePackage{csquotes} % Recommended when using babel
\RequirePackage[spanish,mexico,es-nolists]{babel} % Lenguaje
\RequirePackage[pdfpagelabels,hidelinks,pdfusetitle]{hyperref} % Links y numeracion del PDF
\RequirePackage{pgffor} % foreach

%% Lenguaje
\addto\captionsspanish{\renewcommand\tablename{Tabla}}
\addto\captionsspanish{\renewcommand\contentsname{Tabla de Contenido}}
\addto\captionsspanish{\renewcommand\listtablename{Índice de Tablas}}
\addto\captionsspanish{\renewcommand\listfigurename{Índice de Ilustraciones}}

\addto\captionsspanish{\renewcommand{\appendixname}{Anexo}}
\addto\captionsspanish{\renewcommand{\appendixpagename}{Anexos}}
\addto\captionsspanish{\renewcommand{\appendixtocname}{Anexos}}

%% Entornos nuevos
\newenvironment{abstract}{%
\clearpage
\if@en
	\chapter*{Abstract}
\else
	\chapter*{Resumen}
\fi
}{\vfill\null}

\newenvironment{resumen}{%
\chapter*{Resumen}
}{\vfill\null}

\newenvironment{dedicatoria}{\clearpage\null\vspace{\stretch{1}}\begin{flushright}\itshape}{\end{flushright}\vspace{\stretch{2}}\null}
\let\thanks\undefined

\newenvironment{thanks}{
	\clearpage
	\if@en
		\chapter*{Acknowledgments}
	\else
		\chapter*{Agradecimientos}
	\fi
	
}

%% Spaced Small Caps and All Caps (for fancy cover page)
\newcommand\smallcapsspacing[1]{{\addfontfeature{LetterSpace = 12}\scshape#1}}
\newcommand\allcapsspacing[1]{{\addfontfeature{LetterSpace = 12}#1}}

\newcommand\scspace[1]{\smallcapsspacing{#1}}
\newcommand\scspaced[1]{\smallcapsspacing{\MakeLowercase{#1}}}
\newcommand\acspaced[1]{\allcapsspacing{\MakeUppercase{#1}}}

\newcommand\mcspaced[1]{\addfontfeature{LetterSpace = 12}\textsc{#1}}

\newcommand\oldstyle[1]{\addfontfeature{Numbers = OldStyle}#1}

%% Comandos para la portada
\global\def\@universidad{Universidad de Chile}
\newcommand{\setuniversidad}[1]{\def\@carrera{#1}}
\let\universidad\setuniversidad
\let\setuniversidad\relax

\global\def\@facultad{Facultad de Ciencias Físicas y Matemáticas}
\newcommand{\setfacultad}[1]{\def\@carrera{#1}}
\let\facultad\setfacultad
\let\setfacultad\relax

\global\def\@lugar{Santiago de Chile}
\newcommand{\setlugar}[1]{\def\@lugar{#1}}
\let\lugar\setlugar
\let\setlugar\relax

\global\let\@carrera\@empty
\newcommand{\setcarrera}[1]{\def\@carrera{#1}}
\let\carrera\setcarrera
\let\setcarrera\relax

\global\let\@grado\@empty
\newcommand{\setgrado}[1]{\def\@grado{#1}}
\let\grado\setgrado
\let\setgrado\relax

\global\let\@memoria\@empty
\newcommand{\setmemoria}[1]{\def\@memoria{#1}}
\let\memoria\setmemoria
\let\setmemoria\relax

\global\let\@tesis\@empty
\newcommand{\settesis}[1]{\def\@tesis{#1}}
\let\tesis\settesis
\let\settesis\relax

\global\let\@cotutela\@empty
\newcommand{\setcotutela}[1]{\def\@cotutela{#1}}
\let\cotutela\setcotutela
\let\setcotutela\relax

\global\let\@guia\@empty
\newcommand{\setguia}[1]{\def\@guia{#1}}
\let\guia\setguia
\let\setguia\relax

\global\let\@coguia\@empty
\newcommand{\setcoguia}[1]{\def\@coguia{#1}}
\let\coguia\setcoguia
\let\setcoguia\relax

\global\let\@depto\@empty
\newcommand{\setdepto}[1]{\def\@depto{#1}}
\let\depto\setdepto
\let\setdepto\relax

\global\let\@comision\@empty
\newcommand{\setcomision}[1]{\def\@comision{#1}}
\let\comision\setcomision
\let\setcomision\relax

\global\let\@auspicio\@empty
\newcommand{\setauspicio}[1]{\def\@auspicio{#1}}
\let\auspicio\setauspicio
\let\setauspicio\relax

\global\def\@anho{\the\year{}}
\newcommand{\setanho}[1]{\def\@anho{#1}}
\let\anho\setanho
\let\setanho\relax

%%Portada
\renewcommand{\maketitle}{
	\newgeometry{left=1in, right=1in, top=.75in, bottom=1in}
	\begin{titlepage}
		\begin{minipage}{1.6cm}
			\includegraphics[scale=.12]{imagenes/escudoU2014.pdf}
		\end{minipage}
		\begin{minipage}[t]{12cm}
			\scspaced{\@universidad}
			
			\scspaced{\@facultad}
	
			\scspaced{\@depto}
		\end{minipage}

		\begin{center}
			\vspace{120pt}
			\Huge
			\addfontfeature{LetterSpace = 12}\scshape{\@title}
		\end{center}
		\vspace{1.25cm}
		\begin{center}
		\if\@tesis\@empty\else
			\scspaced{Tesis para optar al grado de}\\\scspace{\@tesis}
			\if\@cotutela\@empty\else
				\\\bigskip \scspaced{En cotutela con \@cotutela}
			\fi
		\fi
		\vspace{1.25cm}
		\if\@memoria\@empty\else
			\if\@tesis\@empty\else
				\\\bigskip
			\fi
			\scspaced{Memoria para optar al título de}\\\scspace{\@memoria}
		\fi

		\vspace{1.25cm}

		\scspace{por\\\@author}

		\vspace{1.25cm}

		\foreach \x [count=\xi] in \@guia {
			\scspaced{Profesor Guía\ifnum\xi>1 \ \xi \fi:}\\ \scspace{\x}
			}

		\foreach \x [count=\xi] in \@coguia {
			\scspaced{Profesor Co-Guía\ifnum\xi>1 \ \xi \fi:}\\ \scspace{\x}
		}

		\vspace{1.25cm}

		\scspaced{miembros de la comisión:}
		\foreach \x in \@comision { \\\scspace{\x} }

		\if\@auspicio\@empty\else
			\normalfont
			Este trabajo ha sido parcialmente financiado por \@auspicio
		\fi
		
		\vspace{1.25cm}

		\scspace{\@lugar}\\\oldstyle{\@anho}
		\end{center}
	\end{titlepage}
	\restoregeometry

	%% Configuración de hyperref
	%%  (... tenemos en título, autor, etc., acá)
	\hypersetup{
		pdfauthor = {\@author},
		pdftitle = {\@title}
	}
}

%%Estilo del frontmatter
\newcommand{\ps@front}{
	\renewcommand{\thepage}{\roman{page}}
	\renewcommand{\@oddhead}{}
	\renewcommand{\@evenhead}{}
	\renewcommand{\@oddfoot}{\hfill\thepage\hfill}
	\renewcommand{\@evenfoot}{\hfill\thepage\hfill}
}

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
	\pagestyle{front}
	\oldfrontmatter
}
\let\oldfrontmatter\relax
