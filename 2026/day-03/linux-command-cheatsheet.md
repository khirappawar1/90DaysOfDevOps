# Day 03 – Linux Commands Practice

*Process management

*File system

*Networking troubleshooting

* * Process Management 
In Linux, a process is an instance of a program in execution, managed by the kernel. Process management involves monitoring, controlling, scheduling, and terminating processes to ensure optimal system performance.
$top #Viweing the running processes

$htop

$ps aux #shows all running processes with detailed information

$kill #send signale to terminate the process 

$pkill #terminate the process by process name

&kill PID #terminate the process using PID



* * File System 

In linux,everything is a file as files, and all data is organized under a single root directory (/) 
$ls - List all files and directories 

$pwd - print working directory

$cd - Change directory

$mkdir - Make directory

$rmdir - Remove directory

$cat filename - Read file content

$touch - Create empty file

$ls -la - Show hidden files

$hostname - show hostname

$Whoami - Check the which user logged in 

$uname -a - Check the kernerl version

$cat /etc/os-release - Check the OS with version

$echo - To print output on screen and craete a file

$cp source destination - Copy files/directories

$mv source detination - Move and Rename files/directories

$grep <keyword> - Search using keyword

* * Networking Troubleshooting commands 

$ip -a / ip addr - Check Ip address

$ping - Check the conectivity status

$wget <url> - download data from url

$ssh - Secure shell remote login 