 ## Day 37 – Docker Revision & Cheat Sheet

 # Self-Assessment Checklist
Mark yourself honestly — **can do**, **shaky**, or **haven't done**:

- [ ] Run a container from Docker Hub (interactive + detached)
- [ ] List, stop, remove containers and images

Ans: docker ps -a - List all containers (started and running)
     docker stop <container-name/container_id> - stop the runnning container
     docker rm <container_name/container_id> - remove the container
     docker rm $(docker ps -aq) - Remove all container in one command
     dokcker rmi <container_name> - remove the images
     docker images - list iamges
     docker images -a - list all running and hidden containers
    

- [ ] Explain image layers and how caching works

Ans: A Docker image is built from a series of layers. Each layer corresponds to a single instruction in your Dockerfile (like FROM, RUN, COPY, etc.).
Immutable: Once created, a layer doesn’t change.
Stacked: Layers are stacked on top of each other to form the final image.

Caching
When you build a Docker image, Docker tries to reuse existing layers from previous builds. It checks each instruction in order:If the instruction and context haven’t changed, Docker reuses the cached layer.
If something changed, Docker rebuilds that layer and all layers after it.

Key points:
Cache is instruction-specific. If COPY requirements.txt . changes, the RUN pip install... layer will rebuild.
Layers before the change stay cached.
This is why ordering instructions matters for build speed.

- [ ] Write a Dockerfile from scratch with FROM, RUN, COPY, WORKDIR, CMD

Ans: #Use a modern Python slim image
FROM python:3.11-slim

#Set working directory
WORKDIR /app

#Copy only dependency files first for better caching
COPY package*.json requirements.txt ./

#Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Copy the rest of the application code
COPY . .

#Default command to run the app
CMD ["python", "app.py"]

- [ ] Explain CMD vs ENTRYPOINT

Ans: CMD :- CMD
Purpose: Specifies the default command to run when a container starts.Can be overridden by providing arguments in docker run.

Syntax:Exec form (recommended): CMD ["executable", "param1", "param2"]
Shell form: CMD command param1 param2 (runs in /bin/sh -c)

ENTRYPOINT:- 
Purpose: Specifies the main executable of the container.Cannot be easily overridden by docker run arguments; arguments passed to docker run are appended.

Syntax:
Exec form (recommended): ENTRYPOINT ["executable", "param1"]
Shell form: ENTRYPOINT command param1

- [ ] Build and tag a custom image

Ans: docker build -t myflaskapp .

-t myflaskapp → tags the image with the name myflaskapp.
. → the current directory as the build context.
✅ After this, Docker will read the Dockerfile and create an image with layers.

- [ ] Create and use named volumes

Ans: docker volume create mydata

mydata → the name of the volume.

Verify creation:
docker volume ls
You should see something like:
DRIVER    VOLUME NAME
local     mydata

- [ ] Use bind mounts?

Ans: What is a Bind Mount?

A bind mount maps a specific folder from your host machine into a container.

Unlike volumes, the data lives on your host filesystem, not managed by Docker.

Changes in the container are immediately reflected on your host, and vice versa.

Use case: Ideal for development, because you can edit code on your host, and the container sees the changes instantly.

Syntax for Bind Mounts
docker run -d \
  -p 5000:5000 \
  -v /path/on/host:/path/in/container \
  myflaskapp

/path/on/host → the folder on your computer.
/path/in/container → where it will appear inside the container.
Example: Mount your app source code for live development.

- [ ] Create custom networks and connect containers

Ans: What is a Docker Network?
Docker containers by default use the bridge network.
Custom networks allow containers to communicate by name instead of IP, which is more convenient.You can create isolated networks for your projects.

Create a Custom Network
Ans: docker network create my_custom_network
my_custom_network → name of the network.
Check networks:
docker network ls
You should see:
NETWORK ID     NAME                 DRIVER    SCOPE
abcd1234       my_custom_network    bridge    local

Connect Containers to a Network
Suppose you have two containers:

flask_app → your Flask container
mongo_db → a MongoDB container

Run MongoDB on the Custom Network
docker run -d \
  --name mongo_db \
  --network my_custom_network \
  -v mongo_data:/data/db \
  mongo:7

--network my_custom_network → connects the container to the network.

Named volume mongo_data persists the database.
Run Flask App on the Same Network
docker run -d \
  --name flask_app \
  --network my_custom_network \
  -p 5000:5000 \
  -v /home/user/flask_app:/app \
  myflaskapp
Communicate Between Containers
Inside the Flask container, you can connect to MongoDB using the container name as hostname:
from pymongo import MongoClient

client = MongoClient("mongodb://mongo_db:27017/")
db = client["todo_db"]
mongo_db → resolves automatically because both containers are on the same network.

Verify Network Connectivity
docker exec -it flask_app ping mongo_db
You should see replies from mongo_db.


- [ ] Write a docker-compose.yml for a multi-container app

Ans: version: "3.9"

services:
  flask_app:
    build: .
    container_name: flask_app
    ports:
      - "5000:5000"
    volumes:
      - ./app:/app          # Bind mount for live development
    networks:
      - my_app_network
    environment:
      - FLASK_ENV=development
      - MONGO_URI=mongodb://mongo_db:27017/todo_db
    depends_on:
      - mongo_db

  mongo_db:
    image: mongo:7
    container_name: mongo_db
    restart: always
    volumes:
      - mongo_data:/data/db  # Named volume for persistence
    networks:
      - my_app_network

volumes:
  mongo_data:                 # Named volume declaration

networks:
  my_app_network:             # Custom network
    driver: bridge


- [ ] Use environment variables and .env files in Compose

Ans: Create a .env File

In the same directory as your docker-compose.yml, create a file called .env:

FLASK_ENV=development
FLASK_PORT=5000
MONGO_DB=todo_db
MONGO_USER=myuser
MONGO_PASSWORD=mypassword
MONGO_PORT=27017

- [ ] Write a multi-stage Dockerfile

Ans: What is a Multi-Stage Dockerfile?
Multi-stage builds let you use multiple FROM statements in a single Dockerfile.
You can separate the build environment from the runtime environment.
Result: the final image contains only what’s needed to run the app, making it smaller.

#---- Stage 1: Build stage ----
FROM python:3.11-slim AS build

#Set working directory
WORKDIR /app

#Install build dependencies
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

#Copy dependency files
COPY requirements.txt .

#Install dependencies into /install directory
RUN pip install --prefix=/install -r requirements.txt --no-cache-dir

#Copy application code
COPY . .

#---- Stage 2: Final runtime stage ----
FROM python:3.11-slim

WORKDIR /app

#Copy only installed dependencies from build stage
COPY --from=build /install /usr/local

#Copy application code
COPY --from=build /app /app

#Expose Flask port
EXPOSE 5000

#Set environment variables
ENV FLASK_ENV=production
ENV PYTHONUNBUFFERED=1

#Default command
CMD ["python", "app.py"]


- [ ] Push an image to Docker Hub

Ans: Log in to Docker Hub
docker login

Enter your Docker Hub username and password when prompted.

If you use 2FA, you may need a personal access token as a password.

Tag Your Local Image for Docker Hub

Docker Hub images must be tagged as username/repository:tag.
docker tag flask_app:multi-stage yourusername/flask_app:1.0

flask_app:multi-stage → local image name
yourusername/flask_app:1.0 → Docker Hub repository name and tag

Tip: The repository must exist on Docker Hub. You can create it on the website before pushing.

Push the Image to Docker Hub
docker push yourusername/flask_app:1.0

Docker will upload each layer.Layers that exist on Docker Hub are skipped due to caching → faster uploads.


- [ ] Use healthchecks and depends_on


Ans: Healthchecks in Docker Compose

Purpose: Check if a container is healthy before other services interact with it.

Syntax:

healthcheck:
  test: ["CMD", "command-to-test"]
  interval: 10s        # How often to check
  timeout: 5s          # Time to wait for response
  retries: 5           # Number of retries before marking unhealthy
  start_period: 10s    # Initial wait before starting checks

  # Quick-Fire Questions
Answer from memory, then verify:
1. What is the difference between an image and a container?

Ans: | feature |  Docker image | Docker container |
|----------|----------|----------|
| Nature|Read-only template|Running instance of an image
State	|Immutable	|Mutable
Storage |Stored in registry or locally |Exists in Docker engine
Lifecycle|Built once, reused many times|Starts, stops, can be removed
Example Command	|docker build -t myapp .|docker run -p 5000:5000 myapp|


2. What happens to data inside a container when you remove it?

Ans: By default, when you remove a container (docker rm <container>):All data stored inside the container’s filesystem is deleted permanently.Any changes made after the container was created are lost.
Exceptions:
Data stored in volumes or bind mounts persists outside the container.
✅ Rule of thumb: Always use volumes or bind mounts for persistent data like databases.

3. How do two containers on the same custom network communicate?

Ans: Containers on the same user-defined bridge network can communicate using container names as hostnames.
Example:
docker network create my_network
docker run -d --name db --network my_network mongo
docker run -d --name app --network my_network myflaskapp
Inside app container, you can connect to MongoDB via:MongoClient("mongodb://db:27017")

Docker DNS automatically resolves db to the container’s IP.Containers on the default bridge network cannot use container names to resolve each other; you need a custom network.

4. What does docker compose down -v do differently from docker compose down?

Ans: docker compose down → stops and removes containers, networks, and default resources.docker compose down -v → also removes volumes associated with the Compose project.
Effect: Any persistent data in volumes is deleted, so use -v carefully.

5. Why are multi-stage builds useful?

Ans Multi-stage builds let you separate build environment from runtime environment.

Benefits:
Smaller images: Only runtime dependencies are included.
Cleaner images: Build tools and temporary files are left out.
Better security: Fewer tools in production reduce attack surface.
Maintainability: Easier to test, build, and deploy efficiently.
Example: Build Python dependencies in one stage, copy only installed packages to the final image.

6. What is the difference between COPY and ADD?


Ans: Feature	COPY	ADD
Basic use|Copies files/folders|Copies files/folders + extra features
Supports URLs|❌ No|✅ Can download files from URLs
Supports tar files|❌ No|✅ Can automatically extract .tar files
Recommended	|✅ Simple copy (best practice) |⚠ Only when you need URL download or extraction

Rule of thumb: Use COPY unless you specifically need ADD’s extra functionality.

7. What does -p 8080:80 mean?

Ans: Maps host port 8080 to container port 80.
Syntax: -p <host_port>:<container_port>

Example:
docker run -p 8080:80 nginx
Access http://localhost:8080 → reaches the container’s port 80.
Useful for exposing web services to the host machine.

8. How do you check how much disk space Docker is using?

Ans: Command:docker system df

Output shows:
Images: total size of downloaded/built images
Containers: storage used by stopped/running containers
Volumes: disk space used by Docker volumes
Build cache: intermediate image layers
Optional cleanup:
docker system prune -a --volumes
Removes unused images, stopped containers, and optionally volumes to free up disk space.