# Flight Booker

A modest Ruby on Rails web app that lets users search for and book one-way flights for up to 4 passengers. Built with Rails 7 and Ruby 3.1.2.

View a live version [on Heroku](https://quiet-dusk-24650.herokuapp.com/).
- **Note:** Due to being on Heroku's free plan, initial load time may be longer than expected

![alt text](homepage.png?raw=true "screenshot of Flight Booker home page")

## Features
- Create multiple objects with a single form via nested forms and nested attributes
- 1500 sample flights created using database seeds and a service object
- Beautiful, responsive design using Bootstrap
- Send confirmation emails to passengers after a ticket is booked (only available in a local clone, not in the live version)
- Tested with RSpec and Capybara (89% code coverage)

## How to Use
#### Live Version
[Click here to view a live version on Heroku](https://quiet-dusk-24650.herokuapp.com/).
- **Note:** Due to being on Heroku's free plan, initial load time may be longer than expected

#### Local Version
To run locally, you must have the following prerequisites:
```
Ruby >= 3.1.2
Rails >= 7.0.3
Bundler >= 2.3.6
PostgreSQL >= 14.3
```
Then, clone this repo, `cd` into the project's root directory and run:
```
bundle install
bin/rails server
```
Finally, visit http://localhost:3000/ to view the application.

## Possible Improvements
- Use realistic flight durations instead of random ones
- Use Stimulus to allow addition/removal of passengers
