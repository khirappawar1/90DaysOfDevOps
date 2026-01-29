* * * Day 02 – Linux Architecture, Processes, and systemd

# The core components of Linux (kernel, user space, init/systemd)
Linux is not OS is a Kernel. Kernel is heart of linux where it interact with the hardawar through the command line provided by user to perform the specific task.
Process management – create, schedule, and terminate processes
Memory management – RAM allocation, virtual memory, paging
Device drivers – communicate with hardware (disk, keyboard, network)
File systems – ext4, xfs, btrfs, etc.
Networking – TCP/IP stack
Security – permissions, SELinux, AppArmor
# user space - User space is where all user applications and utilities run. It interacts with the kernel via system calls.
Includes:
Shells – bash, zsh, fish
Core utilities – ls, cp, mv, grep (GNU coreutils)
Libraries – glibc (provides APIs for programs)
User applications – browsers, editors, servers
Daemons – background services (sshd, cron)
# init/systemd - The init system is the first process started by the kernel (PID 1).
Modern Linux uses systemd (replaced SysVinit/Upstart on most distros).
# How they work together (Boot flow)
Bootloader (GRUB) loads the kernel
Kernel initializes hardware and mounts root filesystem
Kernel starts systemd (PID 1)
systemd starts system services
User space becomes available (login shell / GUI)

# Explain process states (running, sleeping, zombie, etc.)
- A process state describes what a process is doing right now—running on the CPU, waiting for something, stopped, or finished but not cleaned up yet.

Running - The process is currently executing on the CPU or ready to run (in the run queue).

Sleeping- The process is waiting for an event (I/O, timer, signal).

Zombie - The process has finished execution, but its parent hasn’t collected its exit status yet.