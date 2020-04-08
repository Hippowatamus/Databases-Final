const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000

const cors = require('cors')
app.use(cors())
app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
  response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})

app.get('/branchemployee', db.getAllBranchEmployeeInfo)

app.get('/branchemployee/:branch_id', db.getBranchEmployeeInfo)

app.get('/guest', db.getAllGuestInfo)

app.get('/guest/:guest_id', db.getGuestBookingInfo)

app.get('/host/:host_id', db.getHostInfo)

app.post('/host/:host_id', db.createProperty)

app.route('/host/:host_id').post((req, res) => {
  db.createProperty
})

app.delete('/host/:host_id/:id', db.deleteProperty)