const express = require("express");
const app = express();
const port = 3000;
const sqlite3 = require("sqlite3");
require("dotenv").config();

//DB Connection
const db = new sqlite3.Database(
  process.env.data_source,
  sqlite3.OPEN_READWRITE
);

app.use(express.json());

app.get("/trees", (req, res, next) => {
  //write sql query
  const sql = "SELECT * FROM trees";

  //take in any parameters
  const params = [];

  //send that request to our DB
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

app.post("/trees", (req, res, next) => {
  //query
  const sql = `
        INSERT INTO trees (tree, location, height_ft, ground_circumference_ft)
        VALUES (?, ?, ?, ?);
    `;

  //params
  const params = [
    req.body.name,
    req.body.location,
    req.body.height,
    req.body.size,
  ];

  //request
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

//Error handling middleware

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
