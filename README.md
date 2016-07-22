# diskashin

This is a discussion board application written in Ruby using the Ruby on Rails framework.

## Running the Tests
To run the unit tests do:  
  `./bin/rake test` 
## Running the Demo
To see a demo of this application execute the following commands from its root folder:

  `./bin/rake db:schema:load`  
  `cp demo/fixtures/* test/fixtures/`  
  `./bin/rake db:fixtures:load`  
  `./bin/rails server`


Then visit [the application url in your browser](http://localhost:3000)

*NOTE*: copying the demo fixtures to test fixture path will cause the tests to fail.

There are two pre-registered users in the demo data.
- Admin user  
  _username_: admin  
  _password_: admin  
- Normal user  
  _username_: mustafa  
  _password_: password  
