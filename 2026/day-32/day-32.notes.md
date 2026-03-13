# Day 32 – Docker Volumes & Networking

## Task
Today's goal is to **solve two real problems: data persistence and container communication**.

Containers are ephemeral — they lose data when removed. And by default, containers can't easily talk to each other. Today you fix both.


## Challenge Tasks

### Task 1: The Problem
1. Run a Postgres or MySQL container

Ans: docker pull mysql:latest
     docker run -d --name my-sql -e MYSQL_ROOT_PASSWORD=root mysql
2. Create some data inside it (a table, a few rows — anything)

Ans: CREATE DATABASE testdb;
     mysql>USE testdb;
     mysql>CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);
mysql>INSERT INTO users (name) VALUES ('Alice'), ('Bob');
mysql>SELECT * FROM users;
mysql>SHOW TABLES;

3. Stop and remove the container

Ans: docker stop my-sql
     docker rm my-sql
4. Run a new one — is your data still there?SHOW TABLES;

Ans: docker run -d --name my-sql -e MYSQL_ROOT_PASSWORD=root mysql
Check for the last data in the craetyed databas 

Write what happened and why.

1. Firsly I have craeted msql container and accessed the container and added some data in it then stopped the container and deleted the container. 
2. Later I again created the container and accessed the container and exploerd the database but last data is lost. 
> After deleting the database I lost all the data in it.
> Solution: We have to create the docker volume and attach it to the container. 


### Task 2: Named Volumes
1. Create a named volume

Ans: docker volume testvol
2. Run the same database container, but this time **attach the volume** to it

Ans: docker run -d --name my-mysql1 -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v testvol:/vae/lib/mysql mysql 

3. Add some data, stop and remove the container
4. Run a brand new container with the **same volume**
5. Is the data still there?


