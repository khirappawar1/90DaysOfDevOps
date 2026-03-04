## Git commands Reference

```bash 
git --version - To check the version of git (By default git is installed in Linux)
git init  - Initilize the git repository in created directory.
git status - Check the status of the repository. 
git config --global user.name "khirappawar1" - Configure the username
git config --global user.email "omkarkhirappawar98@gmail.com" - To configure the email address
git config --list - To check the configured details
```
**Basic Workflow**
```bash
4. git status

What it does: Shows the current state of the working directory and staging area.
Example:

git status
5. git add

What it does: Adds changes from working directory to staging area.
Example:

git add file.txt
git add .
6. git commit

What it does: Saves staged changes as a new commit in the repository.
Example:

git commit -m "Added new feature"
7. git rm

What it does: Removes a file from the working directory and staging area.
Example:

git rm file.txt
8. git restore

What it does: Discards changes in the working directory.
Example:

git restore file.txt
```
**Viewing Changes**
```bash
9. git log

What it does: Displays commit history.
Example:

git log
10. git diff

What it does: Shows differences between working directory and staged files.
Example:

git diff
11. git show

What it does: Displays detailed information about a specific commit.
Example:

git show <commit-id>
```
