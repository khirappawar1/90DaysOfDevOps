# -------- Stage 1 : Builder --------
FROM node:20-slim AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .


# -------- Stage 2 : Minimal Runtime --------
FROM node:20-alpine

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app/app.js ./app.js
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000

CMD ["node", "app.js"]