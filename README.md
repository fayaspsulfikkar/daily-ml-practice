# BroCamp Learning Repository

This repository records my weekly learning notes, coding exercises, notebooks, and review work from BroCamp.

Existing study files stay in their original folders. This repository does not reorganize or replace them.

## Current learning areas

- `Pyhton Basics/Week 1/` — Python fundamentals, conditions, loops, lists, functions, and practice exercises.
- `Pyhton Basics/Week 2/` — object-oriented programming, comprehensions, lambda functions, files, modules, and revision work.
- `Pyhton Basics/Week3/` — NumPy and Pandas notebooks with practice data.
- `Pyhton Basics/python login/` — HTML practice.
- `Exam_Reviews/` — review notebook and supporting data.

> The folder name `Pyhton Basics` is retained exactly as it already exists on my laptop.

## Weekly learning pattern

For future weeks, add your work using this pattern inside the relevant learning area:

```text
Week 4/
├── Topic Name/
│   ├── Subtopic Name/
│   │   └── practice_file.py or notebook.ipynb
│   └── another_subtopic.ipynb
└── Practice/
    └── exercise_01.py
```

Use folders when a topic has several related files. For a single short exercise, saving it directly in the week folder is also fine.

## My Git routine

After a useful learning session:

```bash
git status
git add "Pyhton Basics/Week 4"
git commit -m "Add Week 4 Python practice"
git push
```

Use `git status` before and after each commit to see exactly what will be saved. The `.gitignore` file keeps local virtual environments, Python cache files, and Jupyter checkpoints out of Git.
