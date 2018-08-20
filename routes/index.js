var express = require('express');
var router = express.Router();

const mysql = require('mysql');
const fs = require('fs')

// var { query } = require('../sql/init');
// query('show tables;', (err, result) => {
//   if (err) throw err;
//   console.log(result.length);
// });
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
