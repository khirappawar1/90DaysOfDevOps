FROM ubuntu:latest

RUN apt-get update -y &&  apt-get install -y git

WORKDIR app.txt  /app

COPY . . 

Expose 3000

CMD ["cat", "app.txt"]

