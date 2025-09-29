% Hebrew Academic Template Class
% A comprehensive LaTeX class for Hebrew academic documents with English integration
% Based on successful document.tex implementation
%
% Copyright (c) 2025 Dr. Segal Yoram. All rights reserved.
% Author: Dr. Segal Yoram
% Date: 2025
% Version: 1.0
%
% Features:
% - Full Hebrew RTL support with English LTR integration
% - Custom title numbering (LTR numbers, RTL Hebrew text, LTR English words)
% - Academic formatting with proper bibliography support
% - Table support with RTL orientation and mixed content
% - Mathematical expressions in LTR
% - Page numbering and headers in LTR
% - Custom footer with rights and page numbers

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hebrew-academic-template}[2025/09/26 v1.0 Hebrew Academic Template]

% Base class - article with 12pt default and twoside for proper headers/footers
\LoadClass[12pt,a4paper,twoside]{article}

%% ==================== REQUIRED PACKAGES ====================

% Font and language support
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\RequirePackage{luabidi}
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{setspace}
\RequirePackage{caption}
\RequirePackage{enumerate}
\RequirePackage{titlesec}

% Bibliography support
\RequirePackage[backend=biber, style=ieee]{biblatex}
\DeclareLanguageMapping{hebrew}{english}

% Declare bibliography categories
\DeclareBibliographyCategory{hebrew}
\DeclareBibliographyCategory{english}

% Automatically categorize entries based on keywords field
\AtDataInput{%
  \ifkeyword{hebrew}
    {\addtocategory{hebrew}{\thefield{entrykey}}}
    {\ifkeyword{english}
      {\addtocategory{english}{\thefield{entrykey}}}
      {}}%
}

% Table packages
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{booktabs}

% Hyperref for PDF bookmarks and links
\RequirePackage[unicode, pdfencoding=auto, bookmarks=true, colorlinks=true, linkcolor=blue, citecolor=red, urlcolor=blue]{hyperref}

% Header and footer support
\RequirePackage{fancyhdr}

%% ==================== CORE FUNCTIONS AND COMMANDS ====================

% Advanced title function for mixed Hebrew/English content
% Usage: \HebrewTitle{number}{mixed Hebrew/English title}
\newcommand{\HebrewTitle}[2]{%
  \textenglish{#1}\quad#2%
}

% Subtitle function for subsections
% Usage: \HebrewSubtitle{number}{mixed Hebrew/English subtitle}
\newcommand{\HebrewSubtitle}[2]{%
  \textenglish{#1}\quad#2%
}

% PDF string handling for hyperref compatibility
\pdfstringdefDisableCommands{%
  \def\textenglish#1{#1}%
  \def\texthebrew#1{#1}%
  \def\en#1{#1}%
  \def\heb#1{#1}%
  \def\ilm#1{#1}%
  \def\textbf#1{#1}%
  \def\LTR#1{#1}%
  \def\HebrewTitle#1#2{#1 #2}%
  \def\HebrewSubtitle#1#2{#1 #2}%
  \def\quad{ }%
  \def\\{ }%
  \def\xpg@aux#1#2{}%
  \def\texorpdfstring#1#2{#2}%
}

%% ==================== LANGUAGE SETUP ====================

% Main language configuration
\setmainlanguage[calendar=gregorian,numerals=arabic]{hebrew}
\setotherlanguage{english}

% Hebrew line breaking and text handling for LuaLaTeX
\emergencystretch=3em
\tolerance=1000
\hbadness=10000

%% ==================== NUMBERING CONFIGURATION ====================

% Section numbering - always LTR
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

% Page numbering - always LTR
\renewcommand{\thepage}{\textenglish{\arabic{page}}}

% Table and figure numbering - always LTR
\renewcommand{\thetable}{\textenglish{\arabic{table}}}
\renewcommand{\thefigure}{\textenglish{\arabic{figure}}}

%% ==================== FONT CONFIGURATION ====================

% Smart font fallback mechanism - works on both Windows/MiKTeX and Linux/TeX Live
% First try preferred fonts (Windows/MiKTeX), then fallback to available alternatives

% Main font: Times New Roman (Windows) -> Latin Modern Roman (Linux)
\IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}[
        Renderer=Harfbuzz,
        Ligatures=TeX
    ]
    \newfontfamily\englishfont{Times New Roman}[
        Renderer=Harfbuzz,
        Script=Latin,
        Ligatures=TeX
    ]
}{
    \setmainfont{Latin Modern Roman}[
        Renderer=Harfbuzz,
        Ligatures=TeX
    ]
    \newfontfamily\englishfont{Latin Modern Roman}[
        Renderer=Harfbuzz,
        Script=Latin,
        Ligatures=TeX
    ]
}

% Hebrew font: David CLM (Windows) -> DejaVu Sans (Linux)
\IfFontExistsTF{David CLM}{
    \newfontfamily\hebrewfont{David CLM}[
        Renderer=Harfbuzz,
        Script=Hebrew,
        Ligatures=TeX,
        Scale=MatchLowercase
    ]
}{
    \IfFontExistsTF{DejaVu Sans}{
        \newfontfamily\hebrewfont{DejaVu Sans}[
            Renderer=Harfbuzz,
            Script=Hebrew,
            Ligatures=TeX,
            Scale=MatchLowercase
        ]
    }{
        % Ultimate fallback to Latin Modern Roman with Hebrew support
        \newfontfamily\hebrewfont{Latin Modern Roman}[
            Renderer=Harfbuzz,
            Script=Hebrew,
            Ligatures=TeX,
            Scale=MatchLowercase
        ]
    }
}

% Sans-serif font: Arial (Windows) -> DejaVu Sans (Linux)
\IfFontExistsTF{Arial}{
    \setsansfont{Arial}[Renderer=Harfbuzz]
}{
    \IfFontExistsTF{DejaVu Sans}{
        \setsansfont{DejaVu Sans}[Renderer=Harfbuzz]
    }{
        \setsansfont{Latin Modern Sans}[Renderer=Harfbuzz]
    }
}

% Monospace font: Courier New (Windows) -> DejaVu Sans Mono (Linux)
\IfFontExistsTF{Courier New}{
    \setmonofont{Courier New}[Renderer=Harfbuzz]
}{
    \IfFontExistsTF{DejaVu Sans Mono}{
        \setmonofont{DejaVu Sans Mono}[Renderer=Harfbuzz]
    }{
        \setmonofont{Latin Modern Mono}[Renderer=Harfbuzz]
    }
}

%% ==================== CONVENIENT COMMANDS ====================

% Short commands for language switching
\newcommand{\en}[1]{\textenglish{#1}}
\newcommand{\heb}[1]{\texthebrew{#1}}
\newcommand{\ilm}[1]{\textenglish{#1}}  % For inline math/English terms

% Command for inline numbers in Hebrew text (always LTR)
\newcommand{\num}[1]{\textenglish{#1}}

% Command for years in Hebrew text (always LTR)
\newcommand{\hebyear}[1]{\textenglish{#1}}

% Command for percentages in Hebrew text (always LTR with % symbol)
\newcommand{\percent}[1]{\textenglish{#1\%}}

% Command for English sections that maintain LTR left-alignment and then return to Hebrew RTL
\newcommand{\startenglish}{%
  \selectlanguage{english}%
  \textdir TLT\pardir TLT%
  \raggedright%
}

% Command to return to Hebrew RTL alignment after English sections
\newcommand{\stophebrew}{%
  \selectlanguage{hebrew}%
  \textdir TRT\pardir TRT%
  \raggedleft%
}

% Command to end English sections and return to Hebrew RTL alignment
\newcommand{\stopenglish}{%
  \selectlanguage{hebrew}%
  \textdir TRT\pardir TRT%
}

% Text direction commands (only define if not already defined)
\providecommand{\LTR}[1]{\textenglish{#1}}
\providecommand{\RTL}[1]{\texthebrew{#1}}

%% ==================== BULLET POINTS FIX ====================

% Fix bullet points for Hebrew documents - use fallback characters for missing glyphs
\renewcommand{\labelitemi}{-}
\renewcommand{\labelitemii}{-}
\renewcommand{\labelitemiii}{-}
\renewcommand{\labelitemiv}{-}

%% ==================== SECTION COMMANDS ====================

% Custom section command that handles numbering properly
\newcounter{hebrewsection}
\newcommand{\hebrewsection}[1]{%
  \stepcounter{hebrewsection}%
  \section*{\HebrewTitle{\thehebrewsection}{#1}}%
  \addcontentsline{toc}{section}{\HebrewTitle{\thehebrewsection}{#1}}%
  \setcounter{section}{\value{hebrewsection}}%
}

\newcommand{\englishsection}[1]{%
  \stepcounter{hebrewsection}%
  \begin{english}%
  \selectlanguage{english}%
  \textdir TLT\pardir TLT%
  \section*{\raggedright\textenglish{\thehebrewsection\quad #1}}%
  \addcontentsline{toc}{section}{\en{\thehebrewsection\quad #1}}%
  \end{english}%
}


% Custom subsection command
\newcounter{hebrewsubsection}[hebrewsection]
\newcommand{\hebrewsubsection}[1]{%
  \stepcounter{hebrewsubsection}%
  \subsection*{\HebrewSubtitle{\thehebrewsection.\thehebrewsubsection}{#1}}%
  \addcontentsline{toc}{subsection}{\HebrewSubtitle{\thehebrewsection.\thehebrewsubsection}{#1}}%
  \stepcounter{subsection}%
}

%% ==================== TABLE ENVIRONMENT ====================

% Hebrew table environment with RTL orientation
\newenvironment{hebrewtable}[1][htbp]{%
  \begin{table}[#1]%
  \begingroup%
  \renewcommand{\arraystretch}{1.2}%
  \centering%
}{%
  \endgroup%
  \end{table}%
}

% RTL tabular environment - back to simple version
\newenvironment{rtltabular}[1]{%
  \begin{tabular}{#1}%
}{%
  \end{tabular}%
}

% Dedicated function for Hebrew RTL cells with mixed language support
\newcommand{\hebcell}[1]{%
  \begingroup%
  \setRTL%
  \texthebrew{#1}%
  \endgroup%
}

% Function for mixed Hebrew/English cell content
\newcommand{\mixedcell}[1]{%
  \begingroup%
  \setRTL%
  #1%
  \endgroup%
}

%% ==================== BIBLIOGRAPHY SETUP ====================

% Suppress split bibliography warning
\BiblatexSplitbibDefernumbersWarningOff

% Custom command to force LTR numbers like page numbers
\newcommand{\ltrnumber}[1]{\textenglish{#1}}

% Custom formatting for ALL bibliography entries
% Use the exact same approach as working page numbers
\AtBeginDocument{%
  \DeclareFieldFormat{year}{\ltrnumber{#1}}%
  \DeclareFieldFormat{pages}{\ltrnumber{#1}}%
  \DeclareFieldFormat{volume}{\ltrnumber{#1}}%
  \DeclareFieldFormat{number}{\ltrnumber{#1}}%
  % Force LTR formatting for citation labels (like [19])
  \DeclareFieldFormat{labelnumber}{\ltrnumber{#1}}%
  \DeclareFieldFormat{labelnumberwidth}{\ltrnumber{#1}}%
  % Also ensure citation commands use LTR
  \DeclareCiteCommand{\cite}
    {\usebibmacro{prenote}}
    {\usebibmacro{citeindex}%
     \printtext[bibhyperref]{\ltrnumber{[\usebibmacro{cite}]}}}
    {\multicitedelim}
    {\usebibmacro{postnote}}%
  % Override the default bracket formatting to use LTR
  \DeclareFieldFormat{bibhyperref}{\ltrnumber{#1}}%
}

% Hebrew bibliography command - shows title in Hebrew RTL, aligned right
% Only shows Hebrew references (keywords=hebrew)
\newcommand{\printhebrewbibliography}{%
  \defbibcheck{hebrewcheck}{\ifkeyword{hebrew}{}{\skipentry}}%
  \hebrewsection{מקורות בעברית}%
  \printbibliography[check=hebrewcheck,heading=none]%
}

% English bibliography command - shows title in English LTR, aligned left
% Only shows English references (keywords=english)
\newcommand{\printenglishbibliography}{%
  \defbibcheck{englishcheck}{\ifkeyword{english}{}{\skipentry}}%
  \englishsection{English References}%
  \begin{english}%
  \pardir TLT % Add this line
  \printbibliography[check=englishcheck,heading=none]%
  \end{english}%
}

%% ==================== HEADER AND FOOTER ====================

% Page style configuration
\pagestyle{fancy}
\fancyhf{} % Clear all header/footer fields

% Footer setup with rights and page numbers
\fancyfoot[LE]{\textenglish{\thepage}} % Page number on left for even pages
\fancyfoot[RO]{\textenglish{\thepage}} % Page number on right for odd pages
\fancyfoot[RE]{\textenglish{©} \textenglish{Dr. Segal Yoram} - \texthebrew{כל הזכויות שמורות}} % Rights on right for even pages
\fancyfoot[LO]{\textenglish{©} \textenglish{Dr. Segal Yoram} - \texthebrew{כל הזכויות שמורות}} % Rights on left for odd pages

% Remove header rule
\renewcommand{\headrulewidth}{0pt}
% make @ a letter for internal macros
\makeatletter
% Keep footer rule
\renewcommand{\footrulewidth}{0.4pt}

%% ==================== DOCUMENT SPACING ====================

% Set line spacing
\onehalfspacing

%% ==================== MATHEMATICAL EXPRESSIONS ====================

% Ensure math mode always uses LTR
\AtBeginDocument{%
  \mathdir TLT%
}

%% ==================== TITLE PAGE COMMANDS ====================

\newcommand{\hebrewtitle}[1]{\def\@hebrewtitle{#1}}
\newcommand{\englishtitle}[1]{\def\@englishtitle{#1}}
\newcommand{\hebrewauthor}[1]{\def\@hebrewauthor{#1}}

% Custom title page for Hebrew documents
\renewcommand{\maketitle}{%
  \begin{titlepage}%
    \null\vfil%
    \begin{center}%
      \texthebrew{\LARGE\bfseries\@hebrewtitle}\par%
      \vskip 1em%
      \textenglish{\Large\bfseries\@englishtitle}\par%
      \vskip 3em%
      \ifdefined\@hebrewauthor%
        {\large \texthebrew{\@hebrewauthor} \par}%
        \vskip 0.5em%
        {\large \textenglish{©} \textenglish{Dr. Segal Yoram} - \texthebrew{כל הזכויות שמורות} \par}%
      \else%
        {\large \@author \par}%
      \fi%
      \vskip 2em%
      {\large \@date \par}%
    \end{center}%
    \vfil\null%
  \end{titlepage}%
}

%% ==================== CUSTOM LISTS ====================

\newcommand{\Hitem}[1]{\item \texthebrew{#1}}

%% ==================== ADDITIONAL UTILITIES ====================

\makeatother
% end @-macros block
% Command for creating Hebrew figures with proper numbering
\newcommand{\hebrewfigure}[3][htbp]{%
  \begin{figure}[#1]%
    \centering%
    #2%
    \caption{#3}%
  \end{figure}%
}

% Command for inline code with proper font
\newcommand{\code}[1]{\en{\texttt{#1}}}

% Command for English terms in Hebrew text
\newcommand{\englishterm}[1]{\en{\textit{#1}}}

%% ==================== CODE ENVIRONMENTS ====================

% Require additional packages for professional code styling
\RequirePackage{xcolor}

% Define light gray color for code background
\definecolor{codegray}{RGB}{245,245,245}

% Professional code block environment with light gray background and LTR direction
% Using tcolorbox with listings for proper LTR code display
\RequirePackage{tcolorbox}
\tcbuselibrary{listings}
\RequirePackage{fvextra}

% Define a custom listing style for LTR code using tcblisting
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[fileext=lop,placement=htbp,name=Listing]{python}

\newcommand{\pythonverbatimformat}{%
  \selectlanguage{english}%
  \textdir TLT\pardir TLT%
  \ttfamily\footnotesize%
}

\newtcblisting{pythonbox}[1][]{
  listing engine=listings,
  listing only,
  colback=codegray,
  colframe=codegray,
  arc=2pt,
  boxrule=0pt,
  left=8pt,
  right=8pt,
  top=8pt,
  bottom=8pt,
  fonttitle=\bfseries,
  title=#1,
  before={\begin{python}\begingroup\selectlanguage{english}\textdir TLT\pardir TLT},
  after={\endgroup\end{python}},
  listing options={
    basicstyle=\pythonverbatimformat,
    tabsize=4,
    breaklines=true,
    showspaces=false,
    showtabs=false,
    language=Python
  }
}

%% ==================== DOCUMENT LAYOUT ====================

% A4 paper with appropriate margins for Hebrew
\RequirePackage[a4paper, margin=2.5cm]{geometry}

%% ==================== END OF CLASS ====================

\endinput





