const express = require("express");
const redis = require("redis");
const process = require("process");

const app = express();

// create redis client
const client = redis.createClient({
  host: "redis-server", // connection url/container
  port: 6379 // default port
});

// init in redis as 0
client.set("visits", 0);

// route and callback
app.get("/", (req, res) => {
  // process.exit(0); // crash and exit
  client.get("visits", (err, visits) => {
    res.send("Number of visits is " + visits); // send back to user
    client.set("visits", parseInt(visits) + 1); // visits++
  });
});

// listening
app.listen(8081, () => {
  console.log("Listening on port 8081");
});
