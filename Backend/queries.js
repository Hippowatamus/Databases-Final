const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'tripadvisordb',
  password: 'Starfish42',
  port: 5432,
})

const getAllBranchEmployeeInfo = (request, response) => {
    pool.query(`SELECT property.house_number, property.street, property.city, property.province, property.property_type, property.room_type, property.accommodates, property.bathrooms, property.bedrooms, property.beds, property.host_id, renter_rate.price, rental_agreement.signing_date, rental_agreement.start_date, rental_agreement.end_date FROM property
                LEFT JOIN renter_rate ON property.renter_rate_id = renter_rate.id
                LEFT JOIN rental_agreement ON property.id = rental_agreement.property_id`, (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  const getBranchEmployeeInfo = (request, response) => {
    const requestedBranch = parseInt(request.params.branch_id)
    pool.query(`SELECT property.house_number, property.street, property.city, property.province, property.property_type, property.room_type, property.accommodates, property.bathrooms, property.bedrooms, property.beds, property.host_id, renter_rate.price, rental_agreement.signing_date, rental_agreement.start_date, rental_agreement.end_date FROM property
                LEFT JOIN renter_rate ON property.renter_rate_id = renter_rate.id
                LEFT JOIN rental_agreement ON property.id = rental_agreement.property_id
                WHERE property.branch_id = $1`, [requestedBranch], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }



  const getAllGuestInfo = (request, response) => {
    pool.query(`SELECT   property.street,
                    property.property_type,
                    property.city,
                    property.province,
                    property.house_number,
                    property.street, 
                    property.room_type, 
                    property.accommodates, 
                    property.bathrooms, 
                    property.bedrooms, 
                    property.beds, 
                    property.host_id,
                    renter_rate.price,
                    available_dates.available_date 
                FROM ((property
                LEFT JOIN booking_property ON property.id = booking_property.property_id)
                LEFT JOIN renter_rate ON property.renter_rate_id = renter_rate.id)
                LEFT JOIN available_dates ON property.id = available_dates.property_id
                WHERE booking_property.id is null`, (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  const getGuestBookingInfo = (request, response) => {
    const requestedGuest = parseInt(request.params.guest_id)
    pool.query(`SELECT property.street,
                property.property_type,
                property.city,
                property.province,
                property.house_number,
                property.street, 
                property.room_type, 
                property.accommodates, 
                property.bathrooms, 
                property.bedrooms, 
                property.beds, 
                property.host_id, 
                renter_rate.price,
                rental_agreement.signing_date,
                rental_agreement.start_date,
                rental_agreement.end_date
                FROM (( booking_property 
                    LEFT JOIN 
                    property ON property.id = booking_property.property_id) 
                    LEFT JOIN 
                    renter_rate ON property.renter_rate_id = renter_rate.id)
                    LEFT JOIN
                    rental_agreement ON rental_agreement.property_id = property.id
                WHERE booking_property.guest_id = $1`, [requestedGuest], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  
  const getHostInfo = (request, response) => {
    const requestedHost = parseInt(request.params.host_id)
    pool.query(`SELECT *
                FROM property
                WHERE property.host_id = $1`, [requestedHost], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
//  const {house_number, street, city, province, property_type, room_type, accomodates, bathrooms, bedrooms, beds, branch_country, host_id, renter_rate, number_of_guests} = request.body

  const createProperty = (request, response) => {
    const {branch_country} = request.body

    pool.query('INSERT INTO branch (id, country) VALUES (22, $1)', [branch_country], (error, results) => {
      if (error) {
        throw error
      }
      response.status(201).send(`branch added with ID: ${results.insertId}`)
    })
    // pool.query('INSERT INTO property () VALUES ($1, $2, $3, $4, $5, $6, $7)', [house_number, street, city, province, property_type, room_type, accomodates, bathrooms, bedrooms, beds, branch_country, host_id, renter_rate, number_of_guests], (error, results) => {
    //   if (error) {
    //     throw error
    //   }
    //   response.status(201).send(`Property added with ID: ${results.insertId}`)
    // })
  }

  const deleteProperty = (request, response) => {
    const id = parseInt(request.params.id)
    console.log("testdelete")
    pool.query(`DELETE FROM rental_agreement
    WHERE property_id = $1;
   `, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
    DELETE FROM reviews
    WHERE property_id = $1;
    `, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
    DELETE FROM rules
    WHERE property_id = $1;
    `, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
    DELETE FROM amenities
    WHERE property_id = $1;
`, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
    DELETE FROM available_dates
    WHERE property_id = $1;
   `, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
    DELETE FROM booking_property
    WHERE property_id = $1;
`, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
    DELETE FROM employee_email_addresses
    WHERE employees.property_id = $1 AND employee_email_addresses.user_id = employees.id;
`, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
        DELETE FROM employee_phone_numbers
    WHERE employees.property_id = $1 AND employee_phone_numbers.user_id = employees.id;
 `, [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`property deleted with ID: ${id}`)
    })
    pool.query(`
DELETE FROM employees
WHERE property_id = $1;
`, [id], (error, results) => {
  if (error) {
    throw error
  }
  response.status(200).send(`property deleted with ID: ${id}`)
})
pool.query(`
DELETE FROM property
WHERE id = $1;`, [id], (error, results) => {
  if (error) {
    throw error
  }
  response.status(200).send(`property deleted with ID: ${id}`)
})
  }

  module.exports = {
      getAllBranchEmployeeInfo,
      getBranchEmployeeInfo,
      getAllGuestInfo,
      getHostInfo,
      getGuestBookingInfo,
      createProperty,
      deleteProperty
  }
