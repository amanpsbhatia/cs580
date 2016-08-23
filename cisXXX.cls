%%
%% CISXXX.cls version 0.3
%% cisXXX  - Latex2e document class for typesetting homework solutions in
%%           CS 580 at Purdue University, Fall 2016.
%% Copyright (C) 2016, Derrick McKee.
%%
%% Adapted from the excellent template by Jake Hart and Sanjeev Khanna
%% https://www.overleaf.com/latex/templates/upenn-cs-hw-template/vbwrvfqctqdx#.V7uWfZgrKUk
%%
%% LICENSE:
%%
%% This work may be distributed and/or modified under the conditions of the 
%% LaTeX Project Public License, either version 1.3 of this license or (at
%% your option) any later version. 
%%
%% The latest version of this license is in:
%% http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX version 
%% 2005/12/01 or later.
%%
%% CHANGELOG
%%
%% Added a new page between every new homework problem
%%

%% ============================================================
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{cisXXX}[2016/07/05 CIS XXX Standard LaTeX document class]

\LoadClass[a4paper, oneside, 11pt]{article}[2005/09/16]
%% ============================================================

%%
%% Margins of Text Pages
%%
\RequirePackage[head=2cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
%%
%% ============================================================

%%
%% Authors and Partners
%%
% \HWauthor{Name}{e-mail}: your name and school e-mail.
% \HWno:                   which homework is it?
% \HWcourse:               the course you are submitting to (cis-XXX).
\RequirePackage{ifthen}
\makeatletter
\newcommand{\HWauthor}[2]{%
  \ifthenelse{\isundefined{\theHWauthors}}{%
    \def\theHWauthors{#1\\#2}
  }%
  {%
    \g@addto@macro\theHWauthors{\and #1\\#2}
  }
  \ifthenelse{\isundefined{\theHWauthorsatheader}}{%
    \def\theHWauthorsatheader{#1}
  }%
  {%
    \g@addto@macro\theHWauthorsatheader{, #1}
  }
}
\newcommand{\HWno}[1]{%
  \ifthenelse{\isundefined{\theHWno}}{%
    \def\theHWno{#1}
  }%
  {%
    \let\theHWno{#1}
  }
}
\newcommand{\HWcourse}[1]{%
  \ifthenelse{\isundefined{\theHWcourse}}{%
    \def\theHWcourse{#1}
  }%
  {%
    \let\theHWcourse{#1}
  }
}
\newcommand{\HWextension}{%
  \def\theHWextension{Yes}
}
\makeatother
% \HWpartner{Name}: Declare somebody you worked with on the homework.
%                   For multiple partners, just use the \partner command 
%                   multiple times. Relative ordering is preserved.
\makeatletter
\newcommand{\HWpartner}[1]{%
  \ifthenelse{\isundefined{\theHWpartners}}{%
    \def\theHWpartners{#1}
  }%
  {%
    \g@addto@macro\theHWpartners{, #1}
  }
}
\makeatother
%%
%% ============================================================

%%
%% Problem Numbering and Sectioning
%%

\RequirePackage{titlesec}
\RequirePackage{changepage}

\newcounter{theHWproblem}
\setcounter{theHWproblem}{1}
\newcounter{theHWsubproblem}[theHWproblem]

\newcommand{\HWproblem}{%
  \ifnum\value{theHWproblem} > 1
	\cleardoublepage
  \fi
  \subsection*{Problem \arabic{theHWproblem}}
  \addtocounter{theHWproblem}{1}
  \setcounter{theHWsubproblem}{1}
}

\titleformat{\subsubsection}[runin]{\bfseries}{}{}{}[)]

\newcommand{\HWsubproblem}{%
  \subsubsection*{\alph{theHWsubproblem}}
  \addtocounter{theHWsubproblem}{1}
}
%%
%% ============================================================

%%
%% Headers and Footers of Text Pages
%%
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhead[RO]{\theHWauthorsatheader}
\fancyhead[CO]{\theHWcourse}
\fancyhead[LO]{Homework \theHWno}
\fancyfoot[RO]{}
\fancyfoot[CO]{\thepage}
\fancyfoot[LO]{}
%%
%% ============================================================

%%
%% Title
%%
\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{%
  \author{\theHWauthors}
  \title{\theHWcourse{} -- Homework \theHWno}
  \oldmaketitle
  \begin{center}
    \ifthenelse{\isundefined{\theHWextension}}{}{%
      {\Large Using Extension.}

    }
    \ifthenelse{\isundefined{\theHWpartners}}{}{%
      {Partners: \theHWpartners.}
    }

  \end{center}
}
%%
%% ============================================================