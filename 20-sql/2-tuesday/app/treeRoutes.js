const express = require("express");
const router = express.Router();
const sqlite3 = require("sqlite3");

const db = new sqlite3.Database(
  process.env.data_source,
  sqlite3.OPEN_READWRITE
);

// GET all trees
router.get("/", (req, res, next) => {
  const sql = "SELECT * FROM trees";
  const params = [];

  db.all(sql, params, (err, rows) => {
    if (err) {
      next(err);
    } else {
      res.json(rows);
    }
  });
});

// GET specific tree
router.get("/:id", (req, res, next) => {
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

// POST new tree
router.post("/", (req, res, next) => {
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

  db.run(sql, params, function (err) {
    if (err) {
      next(err);
    } else {
      const sqlLast = "SELECT * FROM trees WHERE id = last_insert_rowid()";
      db.get(sqlLast, [], (err, row) => {
        if (err) {
          next(err);
        } else {
          res.json(row);
        }
      });
    }
  });
});

module.exports = router;
