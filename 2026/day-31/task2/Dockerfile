#Base image
FROM node:18

WORKDIR /app

COPY . .

RUN npm init -y 

EXPOSE 3000

#Run default command
CMD ["node", "app.js"]
