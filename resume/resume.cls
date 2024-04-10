\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2015/05/25 An elegant Résumé class]
\LoadClass[11pt]{article}

% disable indent globally
\setlength{\parindent}{0pt}
% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
% use fontawesome
\RequirePackage{fontawesome}
% use xcolor for customizing color
\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% Main document font
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

\RequirePackage[
	a4paper,
	left=0.7in,
	right=0.7in,
	top=0.50in,
	bottom=0.5in,
	nohead
]{geometry}

\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}
\RequirePackage[super]{nth}

\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1}{*1}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1}{*0.5}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}

\newcommand{\xsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}

\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}


%\newcommand{\name}[1]{
%  \raggedright{\Huge\scshape{#1}}
%  \vspace{1.2ex}
%}
\newcommand{\name}[1]{
  \begin{flushright}
    {\large\scshape{#1}}
  \end{flushright}
  \vspace{1ex}
}

\newcommand{\phone}[1]{
  \begin{flushright}
    {\large\scshape{#1}}
  \end{flushright}
}

\newcommand{\email}[1]{
  \raggedright{\normalsize{#1}}
}

\newcommand{\homepage}[1]{
  \raggedright{\normalsize{#1}}
}

\newcommand{\pinfo}[2]{
  \begin{flushright}
    {\large\scshape{#1}}\\{\scshape{#2}}
  \end{flushright}
  \vspace{1ex}
}

\newcommand{\wwwinfo}[3]{
  \begin{flushright}
    {\large\scshape{#1}}\\{\scshape{#2}}\\{\scshape{#3}}
  \end{flushright}
}

% makes a resume line with a header and a corresponding text
% usage: \xblock{timeperiod}{position}{company}{department}
\newcommand{\xblock}[4]{
	\subsection*{{\parbox[c]{8em}{\textbf{#1}}}{\textbf{#2}}}
  \subsection*{{\hspace*{8.25em}}{\textbf{#3}}\hspace{1em}{#4}}
}

\newcommand{\expblockcn}[4]{
	\subsection*{{\parbox[c]{8em}{\textbf{#1}}}{\textbf{#2}}}
  \subsection*{{\hspace*{8.25em}}{\textbf{#3}}\hspace{1em}{#4}}
}
\newcommand{\expblockexcn}[4]{
	\subsection*{{\parbox[c]{8em}{\textbf{#1}}}{\textbf{#2}}}
  \subsection*{{\hspace*{8.25em}}{\textbf{#3}}}
  \subsection*{{\hspace*{8.25em}}{#4}}
}

\newcommand{\expblock}[4]{
	\subsection*{{\parbox[c]{8em}{\textbf{#1}}}{\textbf{#2}}}
  \subsection*{{\hspace*{8em}}{\textbf{#3}}\hspace{1em}{#4}}
}
\newcommand{\expblockex}[4]{
	\subsection*{{\parbox[c]{8em}{\textbf{#1}}}{\textbf{#2}}}
  \subsection*{{\hspace*{8em}}{\textbf{#3}}}
  \subsection*{{\hspace*{8em}}{#4}}
}

% makes a resume line with a header and a corresponding text
% usage: \edublock{timeperiod}{position}{school}{university}
\newcommand{\edublock}[4]{
	\subsection*{{\parbox[c]{8.25em}{\textbf{#1}}}{#2}}
  \subsection*{{\hspace*{8em}} {#3} \hfill \textsc{#4}}
}



\newcommand{\contactInfo}[4]{
  \centerline{\sffamily\large{\ {#1} \textperiodcentered\ \ {#2}}
    \ifthenelse{\isempty{#3}}%
      { } % if {#3} is empty
      {\textperiodcentered\ \ {#3} } % homepage, no space before \text...
    \ifthenelse{\isempty{#4}}%
      { } % if {#3} is empty
      {\textperiodcentered\ \ {#4} }
  }
  \vspace{0.7ex}
}

\newcommand{\role}[2]{
  {\par \textit{#1} ~ #2 \par}
  \vspace{0.5ex}
}


% defines one's birthday (optional)
% usage: \born{date, place}
\newcommand{\born}[1]{{#1}}

% defines one's email (optional)
% usage: \email{<email adress>}

\newcommand{\spaceline}{
  \vspace{\baselineskip}
}

\newcommand{\expitemx}[1]{
  \hspace*{4em}\parbox[c]{\textwidth-4em}{#1}
}

\newcommand{\expitemcn}[1]{
  \hspace*{1.5em}\parbox[c]{\textwidth-1.5em}{#1}
}

\newcommand{\explistitemx}[1]{
  %\hspace*{1em}\parbox[c]{\textwidth-1em}{#1}
  #1
}