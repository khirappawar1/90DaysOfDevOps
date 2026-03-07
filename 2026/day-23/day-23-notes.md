1.What is a branch in Git?
Ans: A branch in Git is a separate line of development.

Think of it like a parallel workspace where you can work on new features or fixes without affecting the main codebase.

Technically:

A branch is just a pointer to a specific commit.

As you make new commits, the branch pointer moves forward.

Example:

main:    A --- B --- C
                \
feature-x:       D --- E

Here:

main continues stable development

feature-x is where new work happens

2.Why do we use branches instead of committing everything to main?
Ans:Branches help keep the project safe, organized, and collaborative.

Reasons:

1️⃣ Prevent breaking the main code

If you commit everything to main, unfinished work can break the project.
With branches:

main → stable
feature-login → work in progress

2️⃣ Work on multiple features at the same time

Different branches can hold different work.

Example:

main
 ├── feature-login
 ├── feature-payment
 └── bugfix-navbar

3️⃣ Easier collaboration

Multiple developers can work independently.

Example:

Dev A → feature-auth

Dev B → feature-search

Later they merge into main.

4️⃣ Safer experimentation

You can try new ideas without risking the main project.

If it fails → just delete the branch.

3.What is HEAD in Git?
Ans: HEAD is a special pointer that tells Git which commit you are currently working on.

Most of the time:

HEAD → branch → latest commit

4.What happens to your files when you switch branches?
Ans: When switching branches, Git updates the working directory to match the snapshot of the selected branch. Files may change, appear, or disappear based on the branch's commits.
