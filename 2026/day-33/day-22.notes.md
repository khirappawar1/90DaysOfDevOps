 ## Day 33 – Docker Compose: Multi-Container Basics

## Task
Today's goal is to **run multi-container applications with a single command**.

## Challenge Tasks

### Task 1: Install & Verify
1. Check if Docker Compose is available on your machine
2. Verify the version





### Task 3: Two-Container Setup
Write a `docker-compose.yml` that runs:
- A **WordPress** container
- A **MySQL** container

They should:
- Be on the same network (Compose does this automatically)
- MySQL should have a named volume for data persistence
- WordPress should connect to MySQL using the service name

![alt text](image.png)

### Task 4: Compose Commands
Practice and document these:
1. Start services in **detached mode**

Ans: docker compose up -d 
2. View running services

3. View **logs** of all services

Ans: docker compose ps
4. View logs of a **specific** service

Ans: docker compose -f wordpress

5. **Stop** services without removing

Ans: docker compose down 
6. **Remove** everything (containers, networks)

Ans: docker compose down -v

7. **Rebuild** images if you make a change

Ans: docker compose up --build