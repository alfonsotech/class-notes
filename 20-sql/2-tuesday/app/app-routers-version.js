const express = require("express");
const app = express();
require("dotenv").config();

const treeRoutes = require("./treeRoutes");

app.use(express.json());

// Use the tree routes
app.use("/trees", treeRoutes);

// Set port and listen for incoming requests
const port = 5001;
app.listen(port, () => console.log("Server is listening on port", port));
