// Import express.js
const express = require("express");
const bodyParser = require('body-parser');

// Create express app
var app = express();

// Add static files location
app.use(express.static("static"));
// Use the Pug templating engine
app.set('view engine', 'pug');
app.set('views', './app/views');

// Get the functions in the db.js file to use
const db = require('./services/db');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Create a route for root - /
// app.get("/", function (req, res) {
//     res.send("Hello world!");
// });

// Create a route for testing the db
app.get("/db_test", function (req, res) {
    // Assumes a table called test_table exists in your database
    sql = 'select * from test_table';
    db.query(sql).then(results => {
        console.log(results);
        res.send(results)
    });
});

// Create a route for /goodbye
// Responds to a 'GET' request
app.get("/goodbye", function (req, res) {
    res.send("Goodbye world!");
});

// Create a dynamic route for /hello/<name>, where name is any value provided by user
// At the end of the URL
// Responds to a 'GET' request
app.get("/hello/:name", function (req, res) {
    // req.params contains any parameters in the request
    // We can examine it in the console for debugging purposes
    console.log(req.params);
    //  Retrieve the 'name' parameter and use it in a dynamically generated page
    res.send("Hello " + req.params.name);
});


// Create a route for service provider
app.get("/", function (req, res) {
    // Assumes a table called test_table exists in your database
    sql = 'select * from ServiceProviders';
    db.query(sql).then(results => {
        console.log(results);
        res.render('serviceProviders', { serviceProviders: results });
    });
});

// Create a route for service provider by ID
app.get("/service_providers/:id", function (req, res) {
    const id = req.params.id;
    const serviceProviderQuery = 'SELECT * FROM ServiceProviders WHERE ServiceProviderID = ?';
    const reviewsQuery = 'SELECT * FROM Reviews WHERE ServiceProviderID = ?';

    db.query(serviceProviderQuery, [id])
        .then(serviceProviderResults => {
            console.log(serviceProviderResults);
            db.query(reviewsQuery, [id])
                .then(reviewsResults => {
                    console.log(reviewsResults);
                    res.render('serviceProviderDetails', {
                        serviceProvider: serviceProviderResults[0],
                        reviews: reviewsResults
                    });
                })
        })

});


app.get("/add_reveiw/:id", function (req, res) {
    const id = req.params.id;
    res.render("createReveiw", { serviceProviderID: id });
});

app.post("/reviews", function (req, res) {
    console.log(req.body)
    const { serviceProviderID, reviewerName, rating, comment } = req.body;
    const sql = 'INSERT INTO Reviews (ServiceProviderID, ReviewerName, Rating, Comment) VALUES (?, ?, ?, ?)';
    db.query(sql, [serviceProviderID, reviewerName, rating, comment])
        .then(result => {
            console.log(result);
            res.redirect(`/service_providers/${serviceProviderID}`)
        })
});


// Start server on port 3000
app.listen(3000, function () {
    console.log(`Server running at http://127.0.0.1:3000/`);
});