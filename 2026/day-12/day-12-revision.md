 Day 12 – Breather & Revision (Days 01–11)

## Goal
Take a **one-day pause** to consolidate everything from Days 01–11 so you don’t forget the fundamentals you just built.


## What to Review (pick at least one per section)
- **Mindset & plan:** revisit your Day 01 learning plan—are your goals still right? any tweaks?  
- **Processes & services:** rerun 2 commands from Day 04/05 (e.g., `ps`, `systemctl status`, `journalctl -u <service>`); jot what you observed today.  
- **File skills:** practice 3 quick ops from Days 06–11 (e.g., `echo >>`, `chmod`, `chown`, `ls -l`, `cp`, `mkdir`).  
- **Cheat sheet refresh:** skim your Day 03 commands—highlight 5 you’d reach for first in an incident.  
- **User/group sanity:** recreate one small scenario from Day 09 or Day 11 (create a user or change ownership) and verify with `id`/`ls -l`.

# Mini Self-Check (write short answers in `day-12-revision.md`)
1) Which 3 commands save you the most time right now, and why?  
```bash
Ans: Usually in linux there are lot of commands to perfrom derived action and you can use the various option usch as pipes (|), &&, etc. 
vim/shell scripts can minimize the time by automating the various action into scripts, Can use to insatll any service in linux and script to add users group and various file permissions and operations.
``` 
2) How do you check if a service is healthy? List the exact 2–3 commands you’d run first.  
```bash
Ans: By using the systemctl commands we can check the healt of any services running or installed on linux.
Systemctl status service_name
systemctl list-unit service_name
systemctl start/is-enable service_name
journalctl -u service_name 
```
3) How do you safely change ownership and permissions without breaking access? Give one example command.  
```bash
Ans: by usning list (ls) command we can check the permissions and ownership of any file or directory.
ls -l / ll 
ls -lR
```
4) What will you focus on improving in the next 3 days?
```bash
Ans: In terms of improving while learning DevOps methodology need lot lot of practice/hands-on and understing the concepts in detail.
```
## Suggested Flow (30–45 minutes)
- 10 min: skim notes from each day, update Day 01 plan if needed.  
- 15–20 min: rerun a tiny hands-on set (process check, service check, file permission change).  
- 5–10 min: write the self-check answers and key takeaways.