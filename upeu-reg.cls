\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{upeu-reg}[2022/05/23 clase permite escribir reglamentos]
\RequirePackage{xcolor}


\newcommand{\headlinecolor}{\normalcolor}
\definecolor{blue-upeu}{RGB}{0, 44, 89}


\LoadClassWithOptions{mwbk}
\RequirePackage[normalem]{ulem}



\widowpenalty 1000
\clubpenalty  1000
\displaywidowpenalty 1000



%%%SECTION IN TOC%%%%
%\renewcommand*\l@section[2]{\mw@tocline{1}{1.5em}{4em}{Sección~ #1}{#2}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\SetSectionFormatting{section}
{0pt}
{\textbf{\ifHeadingNumbered
		\headlinecolor{CAPÍTULO~}
		\HeadingNumber\fi: %retirei o ponto
		\MakeUppercase{\HeadingText}}
}
{0pt}



\renewcommand{\thesection}{\Roman{section}}

\renewcommand{\thechapter}{\Roman{chapter}}

%%%SECTION IN TOC - Formatinc of custom document class%%%%
\renewcommand*\l@chapter[2]{\mw@tocline{1}{1.5em}{4em}{TÍTULO~ #1}{#2}}
\renewcommand*\l@section[2]{\mw@tocline{1}{1.5em}{4em}{CAPÍTULO~ #1}{#2}}
%\renewcommand*\l@chapter[2]{\mw@tocline{1}{1.5em}{2.em}{TÍTULO~ #1}{#2}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%



%\RequirePackage{hyperref}
%\RequirePackage[all]{nowidow}

\RequirePackage{ifxetex}
\ifxetex
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage{spanish}
\else
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish,brazil]{babel}
\fi

\RequirePackage{textcase}

%%tachar partes del texto
\newcommand{\tachado}[1]{\sout{#1}}

\newcommand{\titulog}[1]{
	\begin{center}
		\headlinecolor{\centering \bfseries \Large #1}
	\end{center}
	\thispagestyle{plain}}


%\newcounter{titulo}
%\newcommand{\titulo}{\refstepcounter{titulo} % 
%	\par
%	\ifnum\thearticle<10 %
%	{\bfseries TÍTULO ~\Roman{titulo}~~}%
%	\else
%	{\bfseries TÍTULO \Roman{titulo}~~}%
%	\fi
%	%Art. \arabic{artigo}.~
%	\setcounter{inciso}{0}
%}



\newcommand{\descripcion}[1]{\hfill%
	\begin{minipage}{0.8\textwidth}
		#1
	\end{minipage}
	\vspace{\baselineskip}
	}




% % % Para comenzar capítulos en la misma página:


% opção de começar capítulos na mesma página: capitulo
\DeclareOption{capitulo}{%
\SetSectionFormatting[wholewidth]{chapter}
{12pt}
{\raggedright\normalsize\textbf{\ifHeadingNumbered
		\MakeUppercase{TÍTULO ~}\enspace
		\HeadingNumber:::\enspace\fi %retirei o ponto
		\MakeUppercase\HeadingText}}
{6pt}

%\newcounter{article}
%\SetSectionFormatting{chapter}
%{12pt}
%{\textbf{\headlinecolor{TÍTULO~}\HeadingNumber:
%		\MakeUppercase{\HeadingText}}
%}
%{0pt}



%\SetSectionFormatting[wholewidth]{chapter}
%{12pt}
%{\FormatRigidChapterHeading{4\baselineskip}{0pt}%
%	{\centering\large\MakeUppercase\@chapapp\space}{\Large\MakeUppercase}}
%{\baselineskip}

}


%%%capítulos em maiúsculas 

%\SetSectionFormatting[breakbefore,wholewidth]{chapter}
%{12pt}
%{\FormatRigidChapterHeading{4\baselineskip}{0pt}%
%	{\centering\large\MakeUppercase\@chapapp\space}{\Large\MakeUppercase}}
%{\baselineskip}



%%%%%



\DeclareOption{paragrafoespaco}{%
\setlength{\parskip}{8pt}%
\setlength{\parindent}{0pt}%
}

\DeclareOption{paragrafonormal}{%
	\setlength{\parskip}{0pt}%
}

\ExecuteOptions{paragrafoespaco}

\DeclareOption{azul}{\renewcommand{\headlinecolor}{\color{blue-upeu}}}



\ProcessOptions\relax




%%%%%%%%%
%# a unidade básica de articulação será o artigo, indicado pela abreviatura "Art.", seguida de numeração ordinal até o nono e cardinal a partir deste;
%
%# os artigos desdobrar-se-ão em parágrafos ou em incisos; os parágrafos em incisos, os incisos em alíneas e as alíneas em itens;
%
%# os parágrafos serão representados pelo sinal gráfico "§", seguido de numeração ordinal até o nono e cardinal a partir deste, utilizando-se, quando existente apenas um, a expressão "parágrafo único" por extenso;
%
%# os incisos serão representados por algarismos romanos, as alíneas por letras minúsculas e os itens por algarismos arábicos;
%%%%%


\newcounter{article}
\newcommand{\article}{\refstepcounter{article} % 
	\par
	\ifnum\thearticle<10 %
	{\bfseries \headlinecolor{Artículo~}\arabic{article}º~~}%
	\else
	{\bfseries \headlinecolor{Artículo }\arabic{article}~~}%
	\fi
	%Art. \arabic{artigo}.~
	\setcounter{inciso}{0}
}

\newcounter{paragrafo}[article]
\newcommand{\paragrafo}{\refstepcounter{paragrafo} %
	\par 
	\ifnum\theparagrafo<10 %
	\hangindent=2em \hangafter=0 \arabic{article}.\arabic{paragrafo}~%
	\else
	\hangindent=2em \hangafter=0 \arabic{paragrafo}~%
	\fi
}

\newcommand{\paragrafounico}{\hangindent=2em \hangafter=0 Parágrafo único.\enspace}


\newcounter{inciso}[paragrafo]
\newcommand{\inciso}{\refstepcounter{inciso} % 
\par
\ifnum\theparagrafo=0
\hangindent=2em \hangafter=0
\else 
\hangindent=3.5em \hangafter=0
\fi 
\Roman{inciso} --- 
}




\newcounter{alinea}[inciso]
\newcommand{\alinea}{\refstepcounter{alinea} %
\par 
 \hangindent=5em  \hangafter=0	\alph{alinea}) 
}

\newcounter{itens}[alinea]
\newcommand{\itens}{\refstepcounter{itens} % 
\par 
 \hangindent=6.5em \hangafter=0	\arabic{itens}. 
}

%\renewcommand{\section}{%
%    \@startsection
%    {section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}%
%    {1ex plus .2ex}{\headlinecolor}%
%}

\endinput
