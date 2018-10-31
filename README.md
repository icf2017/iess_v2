# KSEC 2050 Calculator

A web interface to the Karnataka State Energy Calculator 2050

Further detail on the project:
http://indiaenergy.gov.in

Canonical source:
http://github.com/iept/iess_v2

# Installation

1. Install Ruby dependency `ruby-2.4.2`
2. `gem install bundler`
3. `bundle install`
4. `npm install`

# Running the web app

### Development

  1. We use hot reloading of RackApp. Use `shotgun` to start the server.
  2. Navigate to http://localhost:9393 in your web browser

### Production

  1. Run the app by starting the puma server. `puma -e <environment>`
  2. Navigate to http://localhost:9292 in your web browser

## Deployment

  1. Run `rake test:all` to run all the tests
  2. Run `rake asset:pipeline` to precompile all the assets  
  3. Run `cap <environment> deploy` to deploy to the server.

# Tests

Use `rake test:all` to run all the unit and acceptance tests.

# BugBounty

You are welcome to improve this code. Please read the LICENCE file and then the HACKING file contains some hints and tips on changing the code and a process for sending in patches and bug reports.
