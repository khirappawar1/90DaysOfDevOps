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


Step 1: Generate SSH Key (on EC2)
ssh-keygen -t ed25519 -C "your_email@example.com"

Press Enter for:

File location (default is fine)

Passphrase (optional)

This creates:

~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
📋 Step 2: Copy Public Key
cat ~/.ssh/id_ed25519.pub

Copy the full output.

🌐 Step 3: Add SSH Key to GitHub

Go to 👉 GitHub

Click your profile → Settings

Click SSH and GPG keys

Click New SSH key

Paste the copied key

Save

🔍 Step 4: Test SSH Connection

Run:

ssh -T git@github.com

If successful, you’ll see:

Hi username! You've successfully authenticated...
🔄 Step 5: Change Remote URL to SSH

Right now your remote is HTTPS:

https://github.com/username/repo.git

Change it to SSH:

git remote set-url origin git@github.com:username/90DaysOfDevOps.git

Verify:

git remote -v
