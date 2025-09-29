# Hebrew Academic Template - Mixed Content Guide

**Copyright:** © 2025 Dr. Segal Yoram. All rights reserved.

## 📋 Complete Mixed Content Rules

This guide provides detailed, precise, and technical instructions for creating professional documents that combine Hebrew and English in LaTeX using the `hebrew-academic-template.cls`. These rules ensure full compliance with academic standards and proper text direction handling.

## 🎯 Critical Text Direction Rules

### ✅ **MUST Use LTR Direction:**

1. **All Numbers** - Always wrap with `\num{}`
2. **All Years** - Always wrap with `\hebyear{}`
3. **Page Numbers** - Automatic LTR formatting
4. **Section Numbers** - Automatic LTR in headings
5. **Mathematical Formulas** - Always LTR
6. **Python Code** - Always LTR with gray background
7. **Citations** - `[1]`, `[2]` always LTR
8. **English Terms** - Always wrap with `\en{}`
9. **Copyright Symbol** - Always wrap with `\textenglish{©}`
10. **Dates** - Always wrap with `\textenglish{}`

### ✅ **Hebrew RTL Content:**

1. **Main Text** - Hebrew paragraphs
2. **Headings** - Hebrew part of mixed titles
3. **Table Content** - Hebrew cells (wrap with `\hebcell{}`)
4. **Figure Captions** - Hebrew descriptions

---

## 📖 Detailed Examples by Document Element

### 1. **Main Title (Title Page)**

#### ❌ **Wrong:**
```latex
\hebrewtitle{מחקר בשנת 2023 על AI}
```

#### ✅ **Correct:**
```latex
\hebrewtitle{מחקר בשנת \hebyear{2023} על \en{AI}}
```

**Rule:** Hebrew title with years wrapped in `\hebyear{}` and English terms in `\en{}`

---

### 2. **Copyright Notice**

#### ❌ **Wrong:**
```latex
© Dr. Segal Yoram - כל הזכויות שמורות
```

#### ✅ **Correct:**
```latex
\textenglish{©} \textenglish{Dr. Segal Yoram} - \texthebrew{כל הזכויות שמורות}
```

**Rule:** Copyright symbol and English name in LTR, Hebrew rights in RTL

---

### 3. **Date on Cover Page**

#### ❌ **Wrong:**
```latex
\date{September 2025}
```

#### ✅ **Correct:**
```latex
\date{\textenglish{September 2025}}
```

**Rule:** All dates must be wrapped in `\textenglish{}` to ensure LTR direction

---

### 4. **Footer Layout**

#### ❌ **Wrong:**
```latex
% Both copyright and Hebrew on same side
\fancyfoot[L]{© Dr. Segal Yoram - כל הזכויות שמורות}
```

#### ✅ **Correct:**
```latex
\fancyfoot[C]{\textenglish{\thepage}} % Page number center
\fancyfoot[L]{\textenglish{©} \textenglish{Dr. Segal Yoram}} % Copyright left
\fancyfoot[R]{\texthebrew{כל הזכויות שמורות}} % Hebrew rights right
```

**Rule:** Copyright left, Hebrew rights right, page numbers center (all LTR)

---

### 5. **Chapter Titles**

#### ❌ **Wrong:**
```latex
\hebrewsection{פרק 1: מבוא ל-Machine Learning}
```

#### ✅ **Correct:**
```latex
\hebrewsection{מבוא ל-\en{Machine Learning}}
```

**Result:** `1 מבוא ל-Machine Learning` (number LTR, Hebrew RTL, English LTR)

**Rule:** Chapter number automatic LTR, Hebrew title RTL, English terms wrapped in `\en{}`

---

### 6. **Body Text with Numbers**

#### ❌ **Wrong:**
```latex
בשנת 2023 פותח מודל GPT-4 עם 175 מיליארד פרמטרים.
```

#### ✅ **Correct:**
```latex
בשנת \hebyear{2023} פותח מודל \en{GPT-4} עם \num{175} מיליארד פרמטרים.
```

**Rule:** Years with `\hebyear{}`, numbers with `\num{}`, English terms with `\en{}`

---

### 7. **Numbered Lists**

#### ❌ **Wrong:**
```latex
\begin{enumerate}
    \item שלב 1: הכנת נתונים
    \item שלב 2: אימון מודל ML
\end{enumerate}
```

#### ✅ **Correct:**
```latex
\begin{enumerate}
    \item שלב \num{1}: הכנת נתונים
    \item שלב \num{2}: אימון מודל \en{ML}
\end{enumerate}
```

**Rule:** All numbers in `\num{}`, English terms in `\en{}`

---

### 8. **Bullet Lists**

#### ❌ **Wrong:**
```latex
\begin{itemize}
    \item דיוק: 95.2%
    \item מהירות: 1000 מילים/שנייה
\end{itemize}
```

#### ✅ **Correct:**
```latex
\begin{itemize}
    \item דיוק: \num{95.2}\%
    \item מהירות: \num{1000} מילים/שנייה
\end{itemize}
```

**Rule:** All numbers wrapped in `\num{}`

---

### 9. **Mathematical Formulas**

#### ❌ **Wrong:**
```latex
הנוסחה y = ax + b מתארת קו ישר.
```

#### ✅ **Correct:**
```latex
הנוסחה $y = ax + b$ מתארת קו ישר.
```

**Rule:** Math always in math mode (automatic LTR), Hebrew text around it RTL

---

### 10. **Table Titles**

#### ❌ **Wrong:**
```latex
\caption{השוואת מודלי Machine Learning}
```

#### ✅ **Correct:**
```latex
\caption{השוואת מודלי \en{Machine Learning}: \en{ML Model Comparison}}
```

**Rule:** Hebrew title RTL, English terms in `\en{}`, mixed captions with colon separator

---

### 11. **Table Cells**

#### ❌ **Wrong:**
```latex
\begin{rtltabular}{|c|c|}
\hline
מודל & דיוק \\
\hline
BERT & 88.5% \\
\hline
\end{rtltabular}
```

#### ✅ **Correct:**
```latex
\begin{rtltabular}{|c|c|}
\hline
\textbf{\mixedcell{מודל\\Model}} & \textbf{\mixedcell{דיוק\\Accuracy}} \\
\hline
\mixedcell{\en{BERT}\\ברט} & \num{88.5}\% \\
\hline
\end{rtltabular}
```

**Rule:** Use `\mixedcell{}` for mixed content, `\en{}` for English, `\num{}` for numbers

---

### 12. **Figure Captions**

#### ❌ **Wrong:**
```latex
\caption{גרף דיוק מודלי NLP בשנים 2018-2023}
```

#### ✅ **Correct:**
```latex
\caption{גרף דיוק מודלי \en{NLP} בשנים \hebyear{2018}-\hebyear{2023}: \en{NLP Model Accuracy 2018-2023}}
```

**Rule:** Hebrew description RTL, English terms in `\en{}`, years in `\hebyear{}`

---

### 13. **Python Code**

#### ❌ **Wrong:**
```latex
\begin{pythonbox}[דוגמה]
# זהו קוד Python
import numpy as np
\end{pythonbox}
```

#### ✅ **Correct:**
```latex
\begin{pythonbox}[דוגמה לעיבוד נתונים: Data Processing Example]
# This is Python code (NO Hebrew comments allowed)
import numpy as np
data = np.array([1, 2, 3, 4, 5])
print(f"Data shape: {data.shape}")
\end{pythonbox}
```

**Rule:** Code always LTR, gray background, NO Hebrew comments, mixed title allowed

---

### 14. **Hebrew Reference Title (RTL)**

#### ❌ **Wrong:**
```latex
\section{מקורות בעברית}
```

#### ✅ **Correct:**
```latex
\printhebrewbibliography  % Uses built-in Hebrew title
```

**Rule:** Use CLS function for proper RTL Hebrew bibliography title

---

### 15. **Hebrew Reference List (RTL)**

#### ❌ **Wrong:**
```latex
@article{hebrew_article,
  title={מאמר בעברית},
  author={כהן, דוד},
  year={2023}
}
```

#### ✅ **Correct:**
```latex
@article{hebrew_article,
  title={מאמר בעברית},
  author={כהן, דוד},
  year={2023},
  keywords={hebrew}  % REQUIRED for Hebrew references
}
```

**Rule:** MUST include `keywords={hebrew}` for Hebrew sources

---

### 16. **English Reference Title (LTR)**

#### ❌ **Wrong:**
```latex
\section{English References}
```

#### ✅ **Correct:**
```latex
\printenglishbibliography  % Uses built-in English title
```

**Rule:** Use CLS function for proper LTR English bibliography title

---

### 17. **English Reference List (LTR)**

#### ❌ **Wrong:**
```latex
@article{english_article,
  title={English Article},
  author={Smith, John},
  year={2023}
}
```

#### ✅ **Correct:**
```latex
@article{english_article,
  title={English Article},
  author={Smith, John},
  year={2023},
  keywords={english}  % REQUIRED for English references
}
```

**Rule:** MUST include `keywords={english}` for English sources

---

### 18. **Citations in Body Text (IEEE Format)**

#### ❌ **Wrong:**
```latex
המחקר של Smith et al. [16] הראה...
```

#### ✅ **Correct:**
```latex
המחקר של \en{Smith et al.} \cite{smith2023} הראה...
```

**Result:** `המחקר של Smith et al. [16] הראה...` (citation number LTR)

**Rule:** English names in `\en{}`, citations show LTR numbers automatically

---

## 🔧 **CLS Commands Reference**

### **Text Direction Commands:**
- `\en{text}` - English LTR text
- `\heb{text}` - Hebrew RTL text  
- `\num{123}` - Numbers in LTR
- `\hebyear{2025}` - Years in LTR
- `\textenglish{text}` - Force English LTR
- `\texthebrew{text}` - Force Hebrew RTL

### **Section Commands:**
- `\hebrewsection{title}` - Hebrew section with LTR numbering
- `\englishsection{title}` - English section
- `\hebrewsubsection{title}` - Hebrew subsection

### **Table Commands:**
- `\begin{hebrewtable}` - Hebrew table environment
- `\begin{rtltabular}` - RTL tabular
- `\mixedcell{hebrew\\English}` - Mixed content cell
- `\hebcell{text}` - Hebrew-only cell

### **Code Commands:**
- `\begin{pythonbox}[title]` - Code with gray background
- `\code{text}` - Inline code

### **Bibliography Commands:**
- `\printhebrewbibliography` - Hebrew references (RTL)
- `\printenglishbibliography` - English references (LTR)
- `\cite{key}` - Citation (always LTR numbers)

---

## 📝 **Complete Example Template**

```latex
% Copyright (c) \hebyear{2025} Dr. Segal Yoram. All rights reserved.
\documentclass{hebrew-academic-template}
\addbibresource{references.bib}

\hebrewtitle{מחקר בתחום ה-\en{AI} בשנת \hebyear{2023}}
\englishtitle{AI Research in 2023}
\hebrewauthor{ד"ר סגל יורם}
\date{\textenglish{December 2025}}

\begin{document}
\maketitle
\tableofcontents
\newpage

\hebrewsection{מבוא ל-\en{Machine Learning}}

בפרק זה נלמד על \en{ML} שפותח בשנת \hebyear{1950} ומשתמש ב-\num{100} אלגוריתמים.

\begin{enumerate}
    \item שלב \num{1}: הכנת \num{1000} דגימות
    \item שלב \num{2}: אימון מודל \en{BERT}
\end{enumerate}

\begin{hebrewtable}[h]
\caption{השוואת מודלים: \en{Model Comparison}}
\begin{rtltabular}{|c|c|}
\hline
\textbf{\mixedcell{מודל\\Model}} & \textbf{\mixedcell{דיוק\\Accuracy}} \\
\hline
\mixedcell{\en{BERT}\\ברט} & \num{88.5}\% \\
\hline
\end{rtltabular}
\end{hebrewtable}

\begin{pythonbox}[דוגמה: Example]
import numpy as np
# English comments only
data = np.array([1, 2, 3])
\end{pythonbox}

המחקר של \en{Smith et al.} \cite{smith2023} הראה שיפור.

\printhebrewbibliography
\printenglishbibliography
\end{document}
```

---

## ⚠️ **Common Mistakes to Avoid**

1. **Never** put Hebrew comments in Python code
2. **Never** use raw numbers in Hebrew text - always `\num{}`
3. **Never** use raw years in Hebrew text - always `\hebyear{}`
4. **Never** forget `keywords={english}` or `keywords={hebrew}` in `.bib` files
5. **Never** use English terms without `\en{}` wrapper in Hebrew text
6. **Never** forget to wrap dates with `\textenglish{}`
7. **Never** put copyright and Hebrew rights on same side in footer

---

**Following these rules ensures professional, academic-quality documents with perfect Hebrew RTL and English LTR integration!** 📝✨
