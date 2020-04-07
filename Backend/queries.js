const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'tripadvisor',
  password: 'Starfish42',
  port: 5432,
})

const getAllProperty = (request, response) => {
    pool.query('SELECT * FROM property', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  module.exports = {
      getAllProperty,
  }
