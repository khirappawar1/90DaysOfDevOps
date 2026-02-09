# Linux Fundamentals: Read and Write Text Files
-Today’s goal is to practice basic file read/write using only fundamental commands.
Creating a file
Writing text to a file
Appending new lines
Reading the file back

* Creating File/Viweing/editing or Appendimng file content : 
  - In linux various method to create file such as (touch,echo,vim,etc..)
$touch notes.txt                       - To create empty file.

$echo "Hello,There" > notes.txt        - To create using echo command.

$vim notes.txt                         - To create file using vim editor.

$echo "content" > notes.txt            - Adding content to file.

$echo "Appending the file" >>notes.txt - Use >> to append the file content.

$cat notes.txt                         - To view file content.

$tail -n 2 notes.txt                   - Show last 2 lines of file.

$head -n 3 notes.txt                   - Show last 3 lines of file. 

$echo "using tee command"|tee note.txt - Using tee commad to save and at the same time. 

(image-2.png)