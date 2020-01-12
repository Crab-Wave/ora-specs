%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{specifications}[2020/10/01 v1.0.0 Software Specifications Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry)
%-------------------------------------------------------------------------------

% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to put a background to the document
\RequirePackage[pages=some]{background}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to put boxes
\RequirePackage[skins]{tcolorbox}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Needed to set section font
\RequirePackage{sectsty}
% Needed to define colors
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage[absolute,quiet,overlay]{textpos}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=4.5cm, right=2.0cm, bottom=3.0cm, footskip=1.0cm}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Project colors
\definecolor{orangecrab}{HTML}{E55934}
\definecolor{bluewave}{HTML}{3F72AC}

\sectionfont{\color{orangecrab}}
\subsectionfont{\color{bluewave}}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date
\setfontfamily\FA[Path=\@fontdir]{FontAwesome}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each Specifications elements
% For fundamental structures
\newcommand*{\headernamesstyle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\bodyfont\scshape\color{orangecrab} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------

% Define background images
% Usage: \firstpage{<path-to-image>}
% Usage: \background{<path-to-image>}
\newcommand*{\firstpage}[1]{\def\@firstpage{#1}}
\newcommand*{\background}[1]{\def\@background{#1}}
\newcommand*{\lheader}[1]{\def\@lheader{#1}}
\newcommand*{\rheader}[1]{\def\@rheader{#1}}

% Define project's basic properties
% Usage: \university{<university name>}
\newcommand*{\university}[1]{\def\@university{#1}}

% Defines project's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines project's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines project's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines project's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% -------------------------------------------------------------------------

\AddEverypageHook{
  \ifnum\value{page}=1\relax
    \backgroundsetup{
      scale=1,
      angle=0,
      opacity=1.0,
      contents={
        \includegraphics[width=\paperwidth,height=\paperheight]{\@firstpage}
	  }
    }
  \else
    \backgroundsetup{
      scale=1,
      angle=0,
      opacity=1.0,
      contents={
        \includegraphics[width=\paperwidth,height=\paperheight]{\@background}
	  }
    }
	\TPoptions{absolute=true,showboxes=false}
    \begin{center}
      \begin{textblock*}{10cm}(-0.5cm,1.0cm)
        {\color{white}\bfseries\fontsize{20}{25}\selectfont\MakeUppercase\@lheader}
      \end{textblock*}
	  \begin{textblock*}{10cm}(11.2cm,1.0cm)
        {\color{white}\bfseries\fontsize{20}{25}\selectfont\MakeUppercase\@rheader}
      \end{textblock*}
    \end{center}
  \fi
  \BgMaterial
}

\renewcommand\maketitle{
  \begin{center}
    \includegraphics[scale=0.08]{logo.png}
  \end{center}
  \begin{center}
    {\Huge\color{white}\bfseries\@title\par}
	\vspace*{2ex}
    {\Large\color{white}\bfseries\@author\par}
	\vspace*{2ex}
    {\ifx\@university\@empty\else\large\@university\par\fi}
  \end{center}
  \TPoptions{absolute=true,showboxes=false}
  \begin{center}
    \begin{textblock*}{10cm}(5.5cm,20.1cm)
      {\color{white}\bfseries\fontsize{20}{25}\selectfont Réalisé le \@date}
    \end{textblock*}
  \end{center}
}
