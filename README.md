# README
* Ruby version
  3.1.3

* Rails version
  7.0.8
  
* Database
  PostgreSQL
  
* Database creation
  rails db:create
  
* Instruction for start application
* rails db:migrate
* rails db:seed
* rails s

After launching the server, to familiarize yourself with the api, you can go to http://localhost:3000/api-docs/ and try out the necessary routes

1) To log in, you must enter your email - api/v1/login
2) Next you will receive a confirmation code via email (6 digits) - at the moment you need to set up an smtp server to send the letter for real (the code is valid for 60 seconds)
3) After receiving the code by email, 3 parameters are expected to be sent - email, token and your code from email to api/v1/create
4) Next, cookies are created - with a validity period of 1 day
5) Next, CRUD is available for actions with the product
6) You can also add products to favorites and remove them from it
7) You can also delete the session, then actions with products will be unavailable

The application has an admin panel where you can create, delete and edit users and products

The application has rspek tests for the necessary endpoints and service objects
