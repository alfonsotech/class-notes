const express = require("express");
const app = express();

require("dotenv").config();

// TODO: 2. Instantiate database here
//const db = new sqlite3.Database("./pies.db", sqlite3.OPEN_READWRITE);
const sqlite3 = require("sqlite3");
const db = new sqlite3.Database(
  process.env.data_source,
  sqlite3.OPEN_READWRITE
);

app.use(express.json());

//CRUD: READ
// 3. Routes will go here
app.get("/trees", (req, res, next) => {
  // 4. route handling goes here
  const sql = "SELECT * FROM trees";
  const params = [];

  db.all(sql, params, (err, rows) => {
    // 5. response handling goes here
    // res.json(rows);
    //6. Error Handling
    if (err) {
      next(err);
    } else {
      res.json(rows);
    }
  });
});

// 7. Get specific record
app.get("/trees/:id", (req, res, next) => {
  const sql = "SELECT * FROM trees WHERE id = ?";
  const params = [req.params.id];

  db.get(sql, params, (err, row) => {
    if (err) {
      next(err);
    } else {
      res.json(row);
    }
  });
});

//CRUD: CREATE
//8. Insert Record
app.post("/trees", (req, res, next) => {
  const sql = `
        INSERT INTO trees (tree, location, height_ft, ground_circumference_ft)
        VALUES (?, ?, ?, ?);
    `;
  const params = [
    req.body.name,
    req.body.location,
    req.body.height,
    req.body.size,
  ];

  db.run(sql, params, (err) => {
    if (err) {
      next(err);
    } else {
      //   res.json({
      //     message: "success",
      //   });
      // 9. Return inserted item
      db.get(sqlLast, [], (err, row) => {
        res.json(row);
      });
    }
  });
});

// Set port and listen for incoming requests
const port = 5001;
app.listen(port, () => console.log("Server is listening on port", port));
