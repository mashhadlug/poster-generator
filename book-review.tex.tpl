\documentclass[a4paper]{article}

\usepackage[a4paper,margin=1in]{geometry}
\usepackage{graphicx}
\usepackage{tikz}
\usepackage{xcolor}
\usepackage{enumitem}

\setlength{\parindent}{0pt}
\pagestyle{empty}

\usepackage{xepersian}
\settextfont{Vazirmatn}[
  Path=fonts/,
  Extension=.ttf,
  UprightFont=*-Regular,
  BoldFont=*-Bold,
  ItalicFont=*-Light,
  BoldItalicFont=*-SemiBold
]

\usepackage{xcolor}
\pagecolor{cyan!15}

\begin{document}

\begin{minipage}{0.2\textwidth}
  \includegraphics[width=0.8\textwidth]{assets/logo.png}
\end{minipage}
\hfill
\begin{minipage}{0.9\textwidth}
  \raggedleft
  {\Huge\textbf{نشست
  ${EVENT_NUMBER}
   مشهدلاگ | معرفی کتاب}}\\
  \vspace{0.2cm}
  \large{شرکت در رویداد برای عموم، آزاد و رایگان می‌باشد}
\end{minipage}

\vspace{1.5cm}

\begin{minipage}[t]{0.5\textwidth}
	\LARGE
	\raggedleft

	\textbf{${LECTURER_FULLNAME}}:\\
	{\large{\textbf{${LECTURER_BOOK_NAME}}}}
	\vspace{0.3cm}

	\begin{itemize}
	${NOTE_1}
	${NOTE_2}
	${NOTE_3}
	\end{itemize}
\end{minipage}
\hfill
\begin{minipage}[t]{0.5\textwidth}
\centering
\vspace{\fill}
\includegraphics[width=0.8\textwidth]{assets/gnu.png}
\vspace{\fill}
\end{minipage}

\vspace{1.5cm}

\begin{minipage}[t]{0.5\textwidth}
\centering
\vspace{\fill}
\includegraphics[width=0.8\textwidth]{assets/book.png}
\vspace{\fill}
\end{minipage}
\hfill
\begin{minipage}[t]{0.5\textwidth}
	\LARGE
	\raggedleft

	\textbf{تاریخ:}\\ ${EVENT_DATE}
	\vspace{0.3cm}

	\textbf{ساعت:}\\ ${EVENT_TIME_RANGE}
	\vspace{0.3cm}

	\textbf{حامی این جلسه:}\\ ${EVENT_SPONSOR}
	\vspace{0.3cm}

	\textbf{آدرس:}\\ ${EVENT_LOCATION_ADDRESS}
	\vspace{0.3cm}

	\includegraphics[width=0.4\textwidth]{assets/qrcode.png}
\end{minipage}

\end{document}
