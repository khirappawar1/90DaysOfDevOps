# Day 25 – Git Reset vs Revert & Branching Strategies

## Task

You'll learn how to **undo mistakes** safely — one of the most important skills in Git. You'll also explore **branching strategies** used by real engineering teams to manage code at scale.

---

## Expected Output
- A markdown file: `day-25-notes.md` with your observations and answers
- Continue updating `git-commands.md` in your `devops-git-practice` repo

---

## Challenge Tasks

### Task 1: Git Reset — Hands-On
1. Make 3 commits in your practice repo (commit A, B, C)
2. Use `git reset --soft` to go back one commit — what happens to the changes?
3. Re-commit, then use `git reset --mixed` to go back one commit — what happens now?
4. Re-commit, then use `git reset --hard` to go back one commit — what happens this time?
5. Answer in your notes:
   - What is the difference between `--soft`, `--mixed`, and `--hard`?

   Ans: Moves the HEAD pointer back by one commit.All changes from that commit stay staged (in the index).Your files are unchanged in the working directory.You can immediately recommit those changes if you want.

git reset --mixed HEAD~1 (default)-- Moves HEAD back by one commit.Unstages the changes (removes from index) but keeps them in your working directory.Your files still have the changes, but you need to git add them again to stage.
   - Which one is destructive and why?

   Ans: git reset --hard HEAD~1 -- Moves HEAD back by one commit.Discards all changes from the last commit from both the index and working directory.Your files revert to the state of the previous commit.This is destructive because changes are lost permanently unless recovered elsewhere.
   - When would you use each one?

   Ans: --soft: When you want to undo a commit but keep all changes staged to tweak or recommit.
        --mixed: When you want to undo a commit and unstage changes but keep them in files for editing.
        --hard: When you want to completely discard changes and revert files to the previous commit state.
   - Should you ever use `git reset` on commits that are already pushed?

   Ans: Generally, no unless you coordinate with your team because it rewrites history and can cause problems for others. 
If you must, use git reset with force push (git push --force), but be very careful and communicate well.

---

### Task 2: Git Revert — Hands-On
1. Make 3 commits (commit X, Y, Z)
2. Revert commit Y (the middle one) — what happens?
3. Check `git log` — is commit Y still in the history?
4. Answer in your notes:
   - How is `git revert` different from `git reset`?
   - Why is revert considered **safer** than reset for shared branches?
   - When would you use revert vs reset?

---

### Task 3: Reset vs Revert — Summary
Create a comparison in your notes:

| | `git reset` | `git revert` |
|---|---|---|
| What it does | ? | ? |
| Removes commit from history? | ? | ? |
| Safe for shared/pushed branches? | ? | ? |
| When to use | ? | ? |

---

### Task 4: Branching Strategies
Research the following branching strategies and document each in your notes with:
- How it works (short description)
- A simple diagram or flow (text-based is fine)
- When/where it's used
- Pros and cons

1. **GitFlow** — develop, feature, release, hotfix branches
2. **GitHub Flow** — simple, single main branch + feature branches
3. **Trunk-Based Development** — everyone commits to main, short-lived branches
4. Answer:
   - Which strategy would you use for a startup shipping fast?
   - Which strategy would you use for a large team with scheduled releases?
   - Which one does your favorite open-source project use? (check any repo on GitHub)

---

### Task 5: Git Commands Reference Update
Update your `git-commands.md` to cover everything from Days 22–25:
- Setup & Config
- Basic Workflow (add, commit, status, log, diff)
- Branching (branch, checkout, switch)
- Remote (push, pull, fetch, clone, fork)
- Merging & Rebasing
- Stash & Cherry Pick
- Reset & Revert

---
