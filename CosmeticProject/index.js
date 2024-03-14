const mysql = require('mysql2');

// create a new MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Tuantruong131203',
  database: 'cosmetic'
});
// connect to the MySQL database
connection.connect((error) => {
  if (error) {
    console.error('Error connecting to MySQL database:', error);
  } else {
    console.log('Connected to MySQL database!');
  }
});

// close the MySQL connection
connection.end();

async function fetchData() {
    let response = await fetch("http://makeup-api.herokuapp.com/api/v1/products.json");
    let data = await response.json();
    console.log(data[0]);
    return data[0];
}

// fetchData()