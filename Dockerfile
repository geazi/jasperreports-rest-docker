# Dockerfile
FROM openjdk:17
WORKDIR /app
COPY . .
CMD ["node", "server.js"]
