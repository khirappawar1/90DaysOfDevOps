 Day 30 – Docker Images & Container Lifecycle

## Task
Today's goal is to **understand how images and containers actually work**
```bash 
### Task 1: Docker Images
1. Pull the `nginx`, `ubuntu`, and `alpine` images from Docker Hub

- Ans: docker pull nginx,
     docker pull ubuntu 
     docker pull alpine
2. List all images on your machine — note the sizes

- Ans: docker images 
    nginx -161MB,Ubuntu -78.1MB, alpine -8.44MB

3. Compare `ubuntu` vs `alpine` — why is one much smaller?

- Ans:Alpine is built for minimalism

Uses musl libc instead of glibc

No unnecessary packages

Designed for containers

Ubuntu includes:

Full package ecosystem

More libraries

Larger base filesystem

Alpine is ideal for production containers when you need smaller attack surface and faster pulls.

4. Inspect an image — what information can you see?
   
- Ans: docker inspect nginx
   Information available:

Image ID

Created date

OS/Architecture

Environment variables

Entrypoint

Layers

Metadata 

5. Remove an image you no longer need

- Ans: docker stop <containername>
       docker rmi -f <imagename>
```

```bash 
### Task 2: Image Layers
1. Run `docker image history nginx` — what do you see?
2. Each line is a **layer**. Note how some layers show sizes and some show 0B
3. Write in your notes: What are layers and why does Docker use them?

Ans: 
Run the command
docker image history nginx

Example output (simplified):

IMAGE          CREATED       CREATED BY                                      SIZE
d1e7f4f1f0a4   2 weeks ago   /bin/sh -c #(nop)  CMD ["nginx" "-g" "daem…   0B
<missing>      2 weeks ago   /bin/sh -c #(nop)  EXPOSE 80                   0B
<missing>      2 weeks ago   /bin/sh -c apt-get update && apt-get install… 23.5MB
<missing>      2 weeks ago   /bin/sh -c #(nop)  ENV NGINX_VERSION=1.25.1   0B
<missing>      2 weeks ago   /bin/sh -c #(nop)  LABEL maintainer=NGINX …   0B
<missing>      2 weeks ago   /bin/sh -c #(nop)  ARG NGINX_VERSION           0B
2️⃣ What you see

Each line corresponds to a layer in the image.

Layers are incremental changes added on top of the previous layer.

Some layers show size (e.g., installing packages) and some show 0B (like metadata, ENV, or CMD instructions).

3️⃣ Notes: What are layers and why Docker uses them
🔹 Layers

Layers are snapshots of the filesystem at different points in building an image.

Each Dockerfile instruction (RUN, COPY, ADD, ENV, etc.) creates a new layer.

Layers are read-only; the topmost layer in a running container is writable.

🔹 Why Docker uses layers

Reusability: Layers can be shared between images.
Example: Multiple Nginx images share the same base layer (ubuntu or debian).

Efficiency: Only changed layers need to be downloaded when pulling/updating an image.

Caching: When building, unchanged layers are cached to speed up builds.

Storage saving: Common layers are stored once on the host, reducing disk usage.

```

```bash
### Task 3: Container Lifecycle
Practice the full lifecycle on one container:
1. **Create** a container (without starting it)

Ans: docker create --name mlifecycle-demo -p 8080:80 nginx
2. **Start** the container

Ans: docker start lifecycle-demo
3. **Pause** it and check status

Ans: docker pause mycontainer
4. **Unpause** it

Ans: docker unpause mycontainer
5. **Stop** it

Ans: docker stop mycontainer
6. **Restart** it

Ans: docker stop mycontainer
7. **Kill** it

Ans: docker kill mycontainer
8. **Remove** it

Ans: docker rm mycontainer

Check `docker ps -a` after each step — observe the state changes.

### Task 4: Working with Running Containers
1. Run an Nginx container in detached mode

Ans: docker run -d --name nginx-demo -p 8080:80 nginx

2. View its **logs**

Ans: docker logs nginx

3. View **real-time logs** (follow mode)

Ans: docker logs -f nginx-demo 

4. **Exec** into the container and look around the filesystem

Ans: docker exec -it nginx-demo bin/bash

5. Run a single command inside the container without entering it

Ans: docker exec lifecycle-demo ls /

6. **Inspect** the container — find its IP address, port mappings, and mounts

Ans: docker inspect nginx-demo (Ip -172.17.0.2, Port mappimg - 8080, )


### Task 5: Cleanup
1. Stop all running containers in one command

Ans: docker stop $(docker ps -q) 
2. Remove all stopped containers in one command

Ans: docker rm $(docker ps -aq)

3. Remove unused images

Ans: docker image prune -a

4. Check how much disk space Docker is using

Ans: docker system df 
```