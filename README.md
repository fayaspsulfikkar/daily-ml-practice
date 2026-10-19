# 🚀 Daily Machine Learning & Python Learning Journey

[![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?style=flat&logo=jupyter&logoColor=white)](https://jupyter.org/)
[![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-150458?style=flat&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/NumPy-Scientific%20Computing-013243?style=flat&logo=numpy&logoColor=white)](https://numpy.org/)
[![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-11557c?style=flat)](https://matplotlib.org/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-Daily-green.svg)](https://github.com/fayaspsulfikkar/daily-ml-practice)

Welcome to my personal Machine Learning & Python learning repository! This repo tracks my daily coding practice, study notes, notebooks, and multi-topic weekly progression through BroCamp and self-directed practice.

---

## 📌 Quick Links

- 📖 **[Daily Learning Journal (DAILY_LOG.md)](DAILY_LOG.md)** — Chronological log of daily study notes, files worked on, and takeaways.
- 📋 **[Topic Notes Template](templates/TOPIC_NOTES_TEMPLATE.md)** — Standardized notes format for every new topic.
- ⚡ **[Daily Sync Automation](daily_push.sh)** — One-command script to stage, log, commit, and push daily progress to GitHub.

---

## 🗺️ Learning Roadmap & Progress Tracker

| Week | Primary Focus Area | Key Topics Covered | Status |
|:---:|---|---|:---:|
| **Week 1** | **Python Core Fundamentals** | Syntax, Data Types, If-Else, Loops, Functions, Lists | ✅ Completed |
| **Week 2** | **Intermediate Python & OOP** | OOP (Classes/Objects), Comprehensions, Lambda, Modules & Packages | ✅ Completed |
| **Week 3** | **Data Science Foundation** | NumPy Matrices, Pandas DataFrames, Matplotlib Visuals, Titanic EDA | 🔄 In Progress |

---

## 📂 Repository Structure

This repository is structured to support **multiple learning topics per week**, keeping exercises and notes organized:

```text
├── DAILY_LOG.md                 # Daily study journal & habit tracker
├── README.md                    # Main dashboard and learning roadmap
├── daily_push.sh                # 1-command daily Git sync script
├── new_topic.sh                 # Scaffolding helper for new topics
│
├── templates/                   # Reusable markdown templates
│   ├── TOPIC_NOTES_TEMPLATE.md  # Template for topic-specific notes
│   └── DAILY_LOG_TEMPLATE.md    # Template for daily journal entries
│
├── Pyhton Basics/               # Core Python & Foundation modules
│   ├── Week 1/                  # Syntax, loops, functions, lists
│   ├── Week 2/                  # OOP, modules, comprehensions
│   ├── Week3/                   # Data manipulation & analysis
│   │   ├── NumPy/               # NumPy array practice
│   │   ├── Pandas/              # DataFrame exploration & Titanic dataset
│   │   └── MatPlotLib/          # Intro to data visualization
│   └── python login/            # Mini application practice
│
└── Exam_Reviews/                # Weekly assessments & review notebooks
    └── Week2/                   # Comprehensive review & test problems
```

---

## ⚡ Daily Workflow: How to Practice & Push

### Method 1: Automated 1-Command Push (Recommended)
After finishing your study session for the day:

1. Open your terminal in this repository folder:
   ```bash
   cd "/media/raw/New Volume/BroCamp"
   ```
2. Run the daily push script:
   ```bash
   ./daily_push.sh
   ```
3. Type a quick 1-line summary of what you learned (e.g. `Pandas grouping and Matplotlib plots`).
4. The script automatically:
   - Stages all modified and new files (`git add .`)
   - Logs your progress into [`DAILY_LOG.md`](DAILY_LOG.md)
   - Creates a clear, formatted commit
   - Pushes directly to GitHub!

> **Shortcut:** You can also pass your topic directly in one line:  
> `./daily_push.sh "Completed Matplotlib scatter plots"`

---

### Method 2: Starting a New Weekly Topic Fast
Whenever you start a new topic during the week, run:
```bash
./new_topic.sh "Week 4" "Data_Visualization_Seaborn"
```
This automatically creates the folder and pre-fills `notes.md` from the topic template so you can start taking notes immediately.

---

### Method 3: Standard Manual Git Commands
If you ever want to push manually without the helper script:
```bash
git status
git add .
git commit -m "📚 Practice (2026-10-14): Summary of what you learned"
git push origin main
```

---

## 🔐 One-Time Setup: Save GitHub Credentials

If Git asks for your GitHub username and password every time you push:
1. Run this command once in your terminal:
   ```bash
   git config --global credential.helper store
   ```
2. Next time you push, enter your GitHub **Username** and your **Personal Access Token (PAT)** as the password.
3. Git will save it securely and will **never ask again** on daily pushes!
