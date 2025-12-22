% hebrew-academic-template.cls
% Version 5.7.0 - Spacing Standards Edition
% Date: 2025-12-11
%
% A comprehensive LaTeX class for Hebrew academic documents with English integration
% Copyright (c) 2025 Dr. Segal Yoram. All rights reserved.
%
% CHANGELOG:
% v5.7.0 (2025-12-11) - Spacing Standards Edition
%   - NEW: Added enumitem package for precise list spacing control
%   - NEW: Configured itemize/enumerate with compact spacing:
%     * itemsep=0.5ex (half font height between items)
%     * parsep=0pt (no extra paragraph spacing)
%     * topsep=0.5ex (half font height above/below list)
%   - NEW: Added titlesec spacing configuration:
%     * Section: 2em before, 0.5em after (≤24pt for 12pt font)
%     * Subsection: 1.5em before, 0.5em after
%   - NEW: Added needspace check for sections (5 lines minimum before page break)
%   - RULE: Line spacing between items = 0.5x font height
%   - RULE: Space before section title = 2x font height (max)
%   - RULE: All other spacing ≤ 1x font height
%
% v5.6.2 (2025-12-10) - CRITICAL: Fixed pythonbox environment corruption (QA-detected)
%   - FIXED: pythonbox/pythonbox* causing environment stack corruption with begingroup/endgroup
%   - Problem: Using before={begingroup...} after={endgroup} conflicted with tcolorbox internals
%   - Root cause: begingroup/endgroup inside tcblisting causes environment mismatch errors
%   - Solution: Changed from before/after to before upper (no grouping needed)
%   - Matched working implementation from Homework07-Even-Odd-League project
%   - Detected by: qa-typeset QA orchestrator (40 pythonbox errors in compilation log)
%
% v5.6.1 (2025-12-05) - CRITICAL: Fixed pythonbox environment stack corruption
%   - FIXED: Hebrew titles in pythonbox causing environment stack corruption
%   - Problem: \begin{python} float wrapper inside pythonbox conflicted with BiDi
%   - Root cause: Nested python float + tcblisting + BiDi caused environment mismatch
%   - Solution: Removed python float wrapper from pythonbox, using same approach as pythonbox*
%   - Added detach title + before upper for better title handling
%   - \hebtitle{} now uses LTR wrapper with RTL hbox for Hebrew content
%
% v5.6 (2025-12-05) - CRITICAL: Pythonbox Hebrew title fix
%   - FIXED: Hebrew text in pythonbox/tcolorbox titles causing environment stack corruption
%   - Problem: Hebrew titles in pythonbox caused compilation errors and corrupted environment
%   - Root cause: tcolorbox title rendered in LTR context breaks Hebrew character handling
%   - Solution: New \hebtitle{} command for RTL pythonbox/tcolorbox titles
%   - Added \hebtitle{} command similar to \hebfoot{} but for tcolorbox title context
%   - Usage: \begin{pythonbox}[\hebtitle{כותרת בעברית}]
%   - Usage: \begin{pythonbox}[\hebtitle{פתרון \en{SVM} עם \en{cvxopt}}]
%   - Detected by: qa-code-detect agent (pythonbox Hebrew title detection)
%
% v5.5 (2025-11-28) - CRITICAL: Footer/Header BiDi fix for mixed Hebrew/English content
%   - FIXED: Hebrew text in fancyhdr footers appearing reversed (LTR instead of RTL)
%   - Problem: \texthebrew{} in fancyfoot/fancyhead doesn't properly set RTL direction
%   - Root cause: fancyhdr operates in LTR context even in RTL documents
%   - Solution: New \hebfoot{} command for RTL footer/header text with \en{} for English
%   - Added \hebfoot{} command similar to \hebcell{} but for footer/header context
%   - Usage: \fancyfoot[LO]{\hebfoot{כל הזכויות שמורות - \en{© Dr. Name}}}
%   - Updated footer definitions to use \hebfoot{} + \en{} pattern
%   - Updated title page copyright to use \hebfoot{} + \en{} pattern
%   - Detected by: Enhanced qa-BiDi-detect agent (Rule 5)
%
% v5.4 (2025-11-10) - CRITICAL: Code block background overflow fix + section numbering fix
%   - FIXED: Background overflows to the right outside document in RTL context
%   - Solution: Use python float environment wrapper + explicit text direction
%   - Changed before/after to use: \begin{python}\begingroup\selectlanguage{english}\textdir TLT\pardir TLT
%   - Root cause: tcolorbox in RTL context needs explicit LTR text direction
%   - Symptom: Code blocks appeared with background extending beyond right margin
%   - Lines changed: 726-727 (pythonbox) and 765-766 (pythonbox*)
%   - Solution source: Working implementation from C:\25D\EX\L12\Latex project
%   - Detected by: Enhanced Code Block QA Agent + user testing
%   - FIXED: Section numbering starting from 0 instead of 1
%   - Redefined \thehebrewsection to conditionally show section number without chapter prefix
%   - Root cause: \thehebrewsection showed "0.X" when no chapters used (hebrewchapter=0)
%   - Solution: Use \ifnum to check hebrewchapter value and format accordingly
%   - Lines changed: 356-362 (conditional \thehebrewsection definition)
%   - Symptom: Sections numbered 0.1, 0.2, 0.3 instead of 1, 2, 3
%   - Detected by: Enhanced RTL/LTR QA Agent
%
% v5.3 (2025-11-10) - Code block character encoding and translation fixes
%   - FIXED: Added literate replacements for hyphen character variants in code blocks
%   - Added literate rules to normalize: - (hyphen), − (minus), – (en-dash), — (em-dash)
%   - Added upquote=true to ensure straight quotes in code
%   - Prevents non-ASCII hyphen/minus characters from appearing in code listings
%   - Updated beginner_example.tex with Hebrew code comments and docstrings
%   - All code comments now in Hebrew for proper localization
%   - Detected by: New Code Block QA Agent (code-block-qa-agent-skill.md)
%
% v5.2 (2025-11-10) - Critical table layout fixes
%   - FIXED: Table caption alignment changed from left-aligned to centered
%   - Changed hebrewtable caption from raggedleft to centering
%   - Captions now properly centered for Hebrew academic tables
%   - Updated documentation to clarify RTL column ordering requirements
%   - All tables now follow Hebrew typography standards
%   - Detected by: New Table Layout QA Agent (table-layout-qa-agent-skill.md)
%
% v5.1 (2025-11-10) - Critical RTL/LTR bugfix
%   - FIXED: \entoc{} command now properly forces LTR for English text in titles
%   - Previously English text in section titles appeared reversed (RTL)
%   - Changed \entoc definition from {#1} to {\textenglish{#1}}
%   - Affects all section/subsection titles with mixed Hebrew-English content
%   - All 7 examples now render English text correctly in titles and TOC
%
% v5.0 (2025-11-09) - Unified merge of all versions
%   - Based on v3.0 with all v1.0 features restored
%   - Fixed 4 regressions from v3.0
%   - Added 18 enhancements from v3.0
%   - 100% backward compatible with v1.0 and v3.0
%   - Total: 78 commands, 8 environments, 24+ packages
%
% v3.0 (2025-10-28) - Major upgrade with chapter support
%   - Added \hebrewchapter{} for book-length documents
%   - Enhanced table cell commands (\encell, \hebheader, \enheader)
%   - Added \enpath{} for paths/filenames with hyphens
%   - Added \clsversion{} command
%
% v1.0 (2025-09-26) - Foundation release
%   - Full Hebrew RTL support with English LTR integration
%   - Custom title numbering
%   - Academic formatting with bibliography support
%   - Table support with mixed content
%
% Features:
% - Full Hebrew RTL support with English LTR integration
% - Chapter and section hierarchy with automatic numbering
% - Advanced table commands for RTL/LTR mixed content
% - Mathematical expressions with Hebrew support
% - Bibliography with biber backend for superior Unicode support
% - Code environments with floating and non-floating options
% - Cross-platform font fallback system
% - PDF bookmark support with proper hyperref integration

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hebrew-academic-template}[2025/12/05 v5.6.1 Hebrew Academic Template - Pythonbox Hebrew Title Fix]

% ==================== VERSION INFORMATION ====================
% Version command - defined early for programmatic access
\newcommand{\clsversion}{V5.6.1-2025-12-05}

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
\RequirePackage{enumitem}  % v5.7.0: For precise list spacing control
\RequirePackage{titlesec}
\RequirePackage{needspace}  % v5.7.0: For section page break control

% Bibliography support - FIXED: Using biber backend (not bibtex) for Unicode support
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

% TikZ packages for diagrams
\RequirePackage{tikz-cd}

% Hyperref for PDF bookmarks and links
\RequirePackage[unicode, pdfencoding=auto, bookmarks=true, colorlinks=true, linkcolor=blue, citecolor=red, urlcolor=blue]{hyperref}

% Header and footer support
\RequirePackage{fancyhdr}

%% ==================== SPACING STANDARDS (v5.7.0) ====================
% RULE 1: Line spacing between list items = 0.5x font height (0.5ex)
% RULE 2: Space before section title = 2x font height (2em max, ~24pt for 12pt font)
% RULE 3: Space after section title = 0.5x font height (0.5em)
% RULE 4: All other spacing ≤ 1x font height (1em)
% RULE 5: Section with ≤5 lines content should start on new page

% List spacing configuration - compact spacing for itemize and enumerate
\setlist{
  itemsep=0.5ex,      % Half font height between items
  parsep=0pt,         % No extra paragraph spacing within items
  topsep=0.5ex,       % Half font height above/below list
  partopsep=0pt,      % No extra space when list starts new paragraph
  leftmargin=2em,     % Indentation from left margin
  labelsep=0.5em      % Space between bullet/number and text
}

% Specific settings for itemize (bullets)
\setlist[itemize]{
  itemsep=0.5ex,
  parsep=0pt,
  topsep=0.5ex
}

% Specific settings for enumerate (numbers)
\setlist[enumerate]{
  itemsep=0.5ex,
  parsep=0pt,
  topsep=0.5ex
}

% Paragraph spacing - keep minimal
\setlength{\parskip}{0.5ex plus 0.1ex minus 0.1ex}

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
  \def\hebfoot#1{#1}%
  \def\hebtitle#1{#1}%
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

% Courier font with fallback for \enpath{} command
\IfFontExistsTF{Courier New}{
  \newfontfamily\courierfont{Courier New}[Renderer=Harfbuzz]
}{
  \IfFontExistsTF{DejaVu Sans Mono}{
    \newfontfamily\courierfont{DejaVu Sans Mono}[Renderer=Harfbuzz]
  }{
    \newfontfamily\courierfont{Latin Modern Mono}[Renderer=Harfbuzz]
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

% RESTORED from v1.0: \ltr{} command for LTR text protection
\newcommand{\ltr}[1]{{\textdir TLT\textenglish{#1}}}

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

%% ==================== SYMBOL COMMANDS ====================
% RESTORED from v1.0

\newcommand{\warningsymbol}{\textenglish{$\blacktriangle$}}  % Warning symbol
\newcommand{\checksymbol}{\textenglish{$\checkmark$}}        % Checkmark symbol

%% ==================== BULLET POINTS FIX ====================

% Fix bullet points for Hebrew documents - use fallback characters for missing glyphs
\renewcommand{\labelitemi}{-}
\renewcommand{\labelitemii}{-}
\renewcommand{\labelitemiii}{-}
\renewcommand{\labelitemiv}{-}

%% ==================== SECTION COMMANDS ====================

% Custom chapter command with automatic numbering
% In article class, we use section-level TOC entries for chapters
\newcounter{hebrewchapter}
\newcommand{\hebrewchapter}[1]{%
  \clearpage%
  \stepcounter{hebrewchapter}%
  \setcounter{hebrewsection}{0}% RESET section counter for new chapter
  \section*{\HebrewTitle{\thehebrewchapter}{#1}}%
  \phantomsection% CRITICAL - Added for PDF bookmarks
  \addcontentsline{toc}{section}{\HebrewTitle{\thehebrewchapter}{#1}}%
  \setcounter{section}{\value{hebrewchapter}}% Sync with section counter
}

% English text in TOC - forces LTR direction for English text in mixed Hebrew/English titles
% FIXED in v5.1: Now properly wraps with \textenglish{} to prevent RTL reversal
\newcommand{\entoc}[1]{\textenglish{#1}}

% Custom section command that handles numbering properly
% Sections are subordinate to chapters, so use subsection-level TOC entries
\newcounter{hebrewsection}[hebrewchapter]
% FIXED v5.4: Show section number without chapter prefix when no chapters used
\renewcommand{\thehebrewsection}{%
  \ifnum\value{hebrewchapter}=0
    \arabic{hebrewsection}%
  \else
    \thehebrewchapter.\arabic{hebrewsection}%
  \fi
}
\newcommand{\hebrewsection}[1]{%
  \par\needspace{5\baselineskip}% v5.7.0: Ensure 5 lines available or start new page
  \vspace{2em}% v5.7.0: Space before section = 2x font height (max 24pt for 12pt)
  \stepcounter{hebrewsection}%
  \subsection*{\HebrewSubtitle{\thehebrewsection}{#1}}%
  \phantomsection% CRITICAL - Added for PDF bookmarks
  \addcontentsline{toc}{subsection}{\HebrewSubtitle{\thehebrewsection}{#1}}%
  \setcounter{subsection}{\value{hebrewsection}}% Sync with subsection counter
  \vspace{0.5em}% v5.7.0: Space after section title = 0.5x font height
}

\newcommand{\englishsection}[1]{%
  \stepcounter{hebrewsection}%
  \begin{english}%
  \selectlanguage{english}%
  \textdir TLT\pardir TLT%
  \subsection*{\raggedright\textenglish{\thehebrewsection\quad #1}}%
  \phantomsection% CRITICAL - Added for PDF bookmarks
  \addcontentsline{toc}{subsection}{\en{\thehebrewsection\quad #1}}%
  \end{english}%
}

% Custom subsection command
% Subsections are subordinate to sections, so use subsubsection-level TOC entries
\newcounter{hebrewsubsection}[hebrewsection]
\newcommand{\hebrewsubsection}[1]{%
  \par\needspace{4\baselineskip}% v5.7.0: Ensure 4 lines available or start new page
  \vspace{1.5em}% v5.7.0: Space before subsection = 1.5x font height
  \stepcounter{hebrewsubsection}%
  \subsubsection*{\HebrewSubtitle{\thehebrewsection.\thehebrewsubsection}{#1}}%
  \phantomsection% CRITICAL - Added for PDF bookmarks
  \addcontentsline{toc}{subsubsection}{\HebrewSubtitle{\thehebrewsection.\thehebrewsubsection}{#1}}%
  \setcounter{subsubsection}{\value{hebrewsubsection}}% Sync with subsubsection counter
  \vspace{0.5em}% v5.7.0: Space after subsection title = 0.5x font height
}

%% ==================== TABLE ENVIRONMENT ====================

% Hebrew table environment with RTL orientation
% FIXED in v5.2: Changed caption from raggedleft to centering for proper Hebrew table formatting
\newenvironment{hebrewtable}[1][htbp]{%
  \begin{table}[#1]%
  \begingroup%
  \renewcommand{\arraystretch}{1.2}%
  \captionsetup{justification=centering,singlelinecheck=false}% FIXED v5.2: centering for Hebrew academic tables
  \centering%
}{%
  \endgroup%
  \end{table}%
}

% RTL tabular environment - for Hebrew tables with RTL column order
% IMPORTANT: Columns must be written in REVERSE order (right-to-left)
% Example for 3-column table:
%   Visual RTL order: [Col3] [Col2] [Col1]
%   LaTeX code order: Col3 & Col2 & Col1 \\
%   (rightmost column first, leftmost column last)
%
% USAGE PATTERN:
%   - Use m{width} column type for vertical centering (not p{width})
%   - Hebrew cells: wrap with \hebcell{Hebrew text \en{English/formulas} more Hebrew}
%   - English cells: use \en{English text} directly without \hebcell{}
%   - Formulas in Hebrew cells: \hebcell{Hebrew \en{$formula$} Hebrew}
%   - No spaces inside \en{}: use \en{$formula$} not \en{ $formula$ }
%
% Example column spec: {|m{5.5cm}|m{2cm}|m{3cm}|}
%   - All columns use m{} for vertical centering
%   - Hebrew columns will be right-aligned via \hebcell{}
%   - English columns will be left-aligned via \en{}
\newenvironment{rtltabular}[1]{%
  \begin{tabular}{#1}%
}{%
  \end{tabular}%
}

% \hebcell{} - Hebrew RTL table cell with mixed language support
%
% PURPOSE: Creates right-aligned RTL cells that support mixed Hebrew/English content
%
% FEATURES:
%   - Forces RTL (right-to-left) text direction for entire cell
%   - Right-aligns Hebrew text automatically
%   - Supports nested \en{} for English/formulas (remain LTR inline)
%   - Removes leading/trailing whitespace (no empty lines)
%   - Adds vertical padding: 0.5ex top and bottom (~half font height)
%   - Works with m{} column type for vertical centering
%
% USAGE:
%   \hebcell{Hebrew text}                           % Pure Hebrew
%   \hebcell{Hebrew \en{English} more Hebrew}       % Mixed content
%   \hebcell{Hebrew \en{$formula$} explanation}     % With formulas
%   \hebcell{\en{Symbol} Hebrew explanation}        % English symbol + Hebrew
%
% IMPORTANT:
%   - Always use with m{width} column type (not p{width}) for vertical centering
%   - Never put spaces inside \en{}: use \en{text} not \en{ text }
%   - For pure English cells, use \en{} directly without \hebcell{}
%
\newcommand{\hebcell}[1]{%
  \bgroup%
  \textdir TRT\pardir TRT%
  \everypar{\textdir TRT\pardir TRT}%
  \selectlanguage{hebrew}%
  \rightskip=0pt\leftskip=0pt plus 1fil\relax%
  \mbox{}\par\vspace{+0.2\baselineskip}\vspace{0.5ex}%
  \ignorespaces#1\unskip%
  \vspace*{0.5ex}%
  \egroup%
}

% \encell{} - English LTR table cell with vertical padding
%
% PURPOSE: Creates left-aligned LTR cells for pure English content
%
% FEATURES:
%   - Left-aligns English text automatically
%   - Adds vertical padding (0.5ex top and bottom)
%   - For pure English cells (no Hebrew content)
%
% USAGE:
%   \encell{English text}          % Pure English cell
%   \encell{np.dot(u, v)}          % Function names
%   \encell{$formula$}             % English formulas
%
\newcommand{\encell}[1]{%
  \bgroup%
  \mbox{}\par\vspace{+0.2\baselineskip}\vspace{0.5ex}%
  #1%
  \vspace*{0.5ex}%
  \egroup%
}

% \hebheader{} - Hebrew RTL table header cell (for single-line headers)
% For use in table column headers - supports mixed Hebrew/English/formulas
% Usage: \textbf{\hebheader{Hebrew title \en{English} more Hebrew}}
% Note: No top padding line (\mbox{}\par) to keep headers vertically centered
\newcommand{\hebheader}[1]{%
  \bgroup%
  \textdir TRT\pardir TRT%
  \everypar{\textdir TRT\pardir TRT}%
  \selectlanguage{hebrew}%
  \rightskip=0pt\leftskip=0pt plus 1fil\relax%
  \vspace*{0.5ex}%
  \ignorespaces#1\unskip%
  \vspace*{0.5ex}%
  \egroup%
}

% \enheader{} - English LTR table header cell (for single-line headers)
% For use in table column headers - pure English content
% Usage: \textbf{\enheader{English Title}}
\newcommand{\enheader}[1]{%
  \bgroup%
  \vspace*{0.5ex}%
  #1%
  \vspace*{0.5ex}%
  \egroup%
}

% \mixedcell{} - Deprecated, use \hebcell{} instead
% Kept for backward compatibility with existing tables
\newcommand{\mixedcell}[1]{\hebcell{#1}}

% OPTIONAL: \rtlrow{} helper command from v1.0 (for beginners)
% Auto-reverses columns for RTL tables
\newcommand{\rtlrow}[2][0]{%
  % Implementation would go here if included
  % Currently omitted as recommended by Agent B
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

% \hebfoot{} - Hebrew RTL footer/header with mixed language support
%
% PURPOSE: Creates RTL footer/header text that supports mixed Hebrew/English content
%
% FEATURES:
%   - Forces RTL (right-to-left) text direction for footer/header
%   - Supports nested \en{} for English text (remains LTR inline)
%   - Works within fancyhdr context (which defaults to LTR)
%   - Similar to \hebcell{} but optimized for single-line footer/header context
%
% USAGE:
%   \hebfoot{Hebrew text}                           % Pure Hebrew
%   \hebfoot{Hebrew \en{English} more Hebrew}       % Mixed content
%   \hebfoot{כל הזכויות שמורות - \en{© Dr. Name}}  % Copyright line
%
% IMPORTANT:
%   - fancyhdr operates in LTR context even in RTL documents
%   - \texthebrew{} alone is NOT sufficient - use \hebfoot{} instead
%   - Always use \en{} for embedded English text within \hebfoot{}
%
\newcommand{\hebfoot}[1]{%
  \bgroup%
  \textdir TRT\pardir TRT%
  \selectlanguage{hebrew}%
  #1%
  \egroup%
}

% \hebtitle{} - Hebrew RTL tcolorbox/pythonbox title with mixed language support
%
% PURPOSE: Creates RTL title text for tcolorbox-based environments (pythonbox, etc.)
%
% FEATURES:
%   - Forces RTL (right-to-left) text direction for title
%   - Supports nested \en{} for English text (remains LTR inline)
%   - Works within tcolorbox title context
%   - Prevents environment stack corruption from Hebrew in LTR context
%
% USAGE EXAMPLES:
%   \begin{pythonbox}[\hebtitle{כותרת בעברית}]
%   \begin{pythonbox}[\hebtitle{פתרון \en{SVM} עם \en{cvxopt}}]
%   \begin{pythonbox}[\hebtitle{דוגמה מלאה: מנתונים לחיזוי}]
%
% NOTES:
%   - Always use \hebtitle{} for Hebrew titles in pythonbox/tcolorbox
%   - For mixed content: \hebtitle{Hebrew \en{English} more Hebrew}
%   - Pure English titles don't need wrapping
%
% \hebtitle{} implementation that avoids BiDi environment corruption
% Simple wrapper that uses brace grouping (no begingroup/endgroup)
% This works inside tcolorbox/tcblisting titles
\newcommand{\hebtitle}[1]{{\texthebrew{#1}}}

% Page style configuration
\pagestyle{fancy}
\fancyhf{} % Clear all header/footer fields

% Footer setup with rights and page numbers
% FIXED v5.5: Using \hebfoot{} for proper RTL Hebrew with \en{} for English
\fancyfoot[LE]{\textenglish{\thepage}} % Page number on left for even pages
\fancyfoot[RO]{\textenglish{\thepage}} % Page number on right for odd pages
\fancyfoot[RE]{\hebfoot{כל הזכויות שמורות - \en{© Dr. Segal Yoram}}} % Rights on right for even pages
\fancyfoot[LO]{\hebfoot{כל הזכויות שמורות - \en{© Dr. Segal Yoram}}} % Rights on left for odd pages

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

% Define common math operators
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}

% Command for Hebrew text inside math formulas
% Usage: $\hebmath{טקסט עברי}$ will display Hebrew RTL inside LTR math
\newcommand{\hebmath}[1]{%
  \text{\begingroup\selectlanguage{hebrew}\textdir TRT #1\endgroup}%
}

% Alternative: Hebrew subscript in math (e.g., x_{\hebsub{עברי}})
\newcommand{\hebsub}[1]{%
  \text{\scriptsize\begingroup\selectlanguage{hebrew}\textdir TRT #1\endgroup}%
}

%% ==================== SPECIAL CHARACTERS FIX ====================

% Fix for special characters in Hebrew fonts that don't support them

% Use \Rsquared instead of R² in Hebrew text
\newcommand{\Rsquared}{%
  \ensuremath{R^2}%
}

% Fix for → (arrow) character - use leftarrow in RTL Hebrew context
% In Hebrew RTL text, logical "implies" (→) should visually point left (←)
\newcommand{\rarrow}{%
  $\leftarrow$%
}

% Alternative: for inline text (not in math mode)
\newcommand{\Rtwo}{%
  R\textsuperscript{2}%
}

%% ==================== TITLE PAGE COMMANDS ====================

\newcommand{\hebrewtitle}[1]{\def\@hebrewtitle{#1}}
\newcommand{\englishtitle}[1]{\def\@englishtitle{#1}}
\newcommand{\hebrewsubtitle}[1]{\def\@hebrewsubtitle{#1}}
\newcommand{\hebrewauthor}[1]{\def\@hebrewauthor{#1}}
\newcommand{\hebrewversion}[1]{\def\@hebrewversion{#1}}

% Custom title page for Hebrew documents
\renewcommand{\maketitle}{%
  \begin{titlepage}%
    \null\vfil%
    \begin{center}%
      \texthebrew{\LARGE\bfseries\@hebrewtitle}\par%
      \vskip 1em%
      \textenglish{\Large\bfseries\@englishtitle}\par%
      \ifdefined\@hebrewsubtitle%
        \vskip 0.5em%
        {\large \@hebrewsubtitle \par}%
      \fi%
      \vskip 3em%
      \ifdefined\@hebrewauthor%
        {\large \texthebrew{\@hebrewauthor} \par}%
        \vskip 0.5em%
        {\large \hebfoot{כל הזכויות שמורות - \en{© Dr. Segal Yoram}} \par}%
      \else%
        {\large \@author \par}%
      \fi%
      \vskip 2em%
      {\large \@date \par}%
      \ifdefined\@hebrewversion%
        \vskip 1em%
        {\large \texthebrew{\@hebrewversion} \par}%
      \fi%
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
  coltitle=black,
  title=#1,
  before upper={\selectlanguage{english}\textdir TLT\pardir TLT},
  listing options={
    basicstyle=\pythonverbatimformat,
    tabsize=4,
    breaklines=true,
    showspaces=false,
    showtabs=false,
    language=Python
  }
}

% Non-floating version of pythonbox for long code blocks
% Use pythonbox* when code is too long and overflows the page
%
% IMPORTANT: If pythonbox* code still overflows into footer:
% SOLUTION - Simplify code to show ONLY core functions:
%   - Remove: imports of non-core libraries (matplotlib, sklearn examples)
%   - Remove: print statements, docstrings, example data generation
%   - Remove: visualization code (UNLESS it IS the main topic)
%   - Keep: ONLY the core algorithm/function being demonstrated
% Alternative: Convert to Python pseudocode instead of executable code
%
\newtcblisting{pythonbox*}[1][]{
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
  coltitle=black,
  title=#1,
  before upper={\selectlanguage{english}\textdir TLT\pardir TLT},
  listing options={
    basicstyle=\pythonverbatimformat,
    tabsize=4,
    breaklines=true,
    showspaces=false,
    showtabs=false,
    language=Python
  }
}

%% ==================== CODE LISTING FONT SUPPORT ====================

% Command for use in lstlisting basicstyle to ensure Courier New is used
% This fixes hyphens in listing body text AND captions
\newcommand{\listingfont}{\courierfont}

% Command for paths/filenames with hyphens in captions and text
% Usage: caption={\enpath{/mnt/user-data}} or caption={\enpath{Fork-Join}}
% Made robust to work in moving arguments like lstlisting captions
\DeclareRobustCommand{\enpath}[1]{%
  {\courierfont\LTR{#1}}%
}

%% ==================== DOCUMENT LAYOUT ====================

% A4 paper with appropriate margins for Hebrew
\RequirePackage[a4paper, margin=2.5cm]{geometry}

%% ==================== END OF CLASS ====================

\endinput
