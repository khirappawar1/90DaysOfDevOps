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
   - Which one is destructive and why?
   - When would you use each one?
   - Should you ever use `git reset` on commits that are already pushed?

---

### Task 2: Git Revert — Hands-On
1. Make 3 commits (commit X, Y, Z)
2. Revert commit Y (the middle one) —
 what happens?

 Ans: New commit created that undoes changes from Y History remains intact
3. Check `git log` — 
is commit Y still in the history?

Ans: Yes --- Git adds a new commit that reverses it.
4. Answer in your notes:
   - How is `git revert` different from `git reset`?
   
   Reset	Revert
Rewrites history	Preserves history
Removes commits	Creates undo commit
Dangerous for shared branches	Safe for teams
   - Why is revert considered **safer** than reset for shared branches?

   Ans: Because it does not change commit history, preventing conflicts for collaborators.
   - When would you use revert vs reset?

Use revert when:

- commits are pushed

- working with a team

- undoing specific commit safely

Use reset when:

- working locally

- fixing recent mistakes

- cleaning commit history before push

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

1. What is a Branching Strategy?

A branching strategy is a workflow that defines how developers create, use, and merge branches in a Git repository.
It helps teams collaborate, manage features, fix bugs, and release software efficiently.

2. Common Git Branching Strategies
1. Git Flow

Git Flow is a structured branching model used in many traditional development workflows.

Main branches:

main (or master) → production-ready code

develop → integration branch for features

Supporting branches:

feature/* → new features

release/* → prepare a release

hotfix/* → urgent production fixes

Workflow

Create feature branch from develop

Merge feature → develop

Create release branch
Merge release → main

Hotfix branches created from main

✅ Best for:

Large projects

Scheduled releases

❌ Downsides:

Complex

Too many branches

2. GitHub Flow

A simple and lightweight branching strategy.

Branches

main → always deployable

feature branches → created from main

Workflow

Create feature branch

Make commits

Open Pull Request

Code review

Merge into main

Deploy

✅ Best for:

Continuous deployment

Small/medium teams

3. GitLab Flow

Combines Git Flow + environment branches.

Branches

main

feature branches

environment branches like:

production

staging

Workflow includes deployment stages.

✅ Best for:

Teams with staging environments

4. Trunk-Based Development

Developers work on very short-lived branches and merge frequently to the main branch (trunk).

Rules

Small commits

Frequent merges

Feature flags used

✅ Best for:

CI/CD environments

Fast development teams

❌ Requires strong automated testing.

3. Comparison
Strategy	Complexity	Best For
Git Flow	High	Large projects with releases
GitHub Flow	Low	Web apps / continuous deployment
GitLab Flow	Medium	Teams with staging environments
Trunk-Based	Low	CI/CD and fast-moving teams
4. Key Benefits of Branching Strategies

Parallel development

Better collaboration

Safe feature development

Easy bug fixing

Organized release management

✅ Summary:
Branching strategies help teams manage code changes efficiently by defining how branches are created, merged, and maintained during development.


1. **GitFlow** — develop, feature, release, hotfix branches
2. **GitHub Flow** — simple, single main branch + feature branches
3. **Trunk-Based Development** — everyone commits to main, short-lived branches
4. Answer:
   - Which strategy would you use for a startup shipping fast?

   itHub Flow (or Trunk-Based Development) is best.

Why:

Very simple workflow

Short-lived feature branches

Frequent deployments

Continuous integration

Typical workflow:

Create feature branch from main

Make changes

Open Pull Request

Review

Merge to main and deploy

This approach allows fast iterations and continuous delivery, which startups usually need.

   - Which strategy would you use for a large team with scheduled releases?

   Git Flow

Why:

Supports planned release cycles

Separates development and production code

Handles hotfixes and release preparation

Main branches:

main → production

develop → integration

Supporting branches:

feature/*

release/*

hotfix/*

This structured workflow works well for large teams and enterprise projects with scheduled releases.

   - Which one does your favorite open-source project use? (check any repo on GitHub)

   Example: React repository

Repository:
https://github.com/facebook/react

Branching style used:

A main branch (main)

Contributors create feature branches and pull requests

This is similar to GitHub Flow:

Work happens in short-lived branches

Changes are merged through pull requests

main remains stable and deployable.

---

---

## Hints
- `git reflog` is your safety net — it shows everything Git has done, even after a hard reset
- For branching strategies, look at how projects like Kubernetes, React, or Linux kernel manage branches
