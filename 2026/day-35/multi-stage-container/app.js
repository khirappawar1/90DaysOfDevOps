const http = require("http");
const os = require("os");

const PORT = 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "application/json" });

  const response = {
    message: "Hello from Node.js running inside Docker 🚀",
    hostname: os.hostname(),
    platform: os.platform(),
    uptime: process.uptime(),
    time: new Date()
  };

  res.end(JSON.stringify(response, null, 2));
});

server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});