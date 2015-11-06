# RailsReactLive

#### http://recruitme.seshook.com

RailsReactLive is a simple web-based Twitter client. It consumes the authenticated user timeline and notifies for new statuses in real-time over websockets.

The main goal of this application was to demonstrate my skills as a web developer and software engineer for potential recruiters. But in the meantime it turned out to be an experiment with the [Action Cable framework](https://github.com/rails/actioncable) due in the upcoming Rails 5 release.

##### Features

- Authentication with twitter account
- Twitter streaming API consumer
- Twitter feed pagination with endless scroll
- Real-time timeline update over websockets

This example application is built using the following technologies :

##### Backend

- Ruby on Rails
- [Action Cable framework](https://github.com/rails/actioncable) (Rails 5)
- Redis
- PostgreSQL
- Nginx

##### Frontend

- [React](https://facebook.github.io/react)
- Underscore
- Bootstrap & jQuery
- SCSS

Since Action Cable uses an EventMachine loop and threads this application requires [Puma](https://github.com/puma/puma) threaded web server.
Automated deployment is handle by Capistrano and the application is hosted on a small Digital Ocean Droplet.

## Usage

### Requirements

- Ruby 2.2
- PostgreSQL
- Redis
- Node.js
- [PhantomJS](http://phantomjs.org/) (this is **optional** and only required for testing)

### Installation

```ruby
# Setup database
rake db:create
rake db:migrate

# Start web server
rails s   

# Open browser
open http://localhost:3000
```

### Running the test suite

Tests are written using Rspec and Capybara. Note that you **must** have [PhantomJS](http://phantomjs.org/) installed before running the test suite.

```ruby
rspec spec
```

## Code Tour

- `app/assets/javascripts/component` : React components written in ECMAScript 6.
- `app/cables` : Action Cable channels logic.
- `app/controllers` : Controllers handling requests logic.
- `app/helpers` : Modules that provide view helpers.
- `app/services` : Service objects that encapsulate a domain's business logic.
- `app/spec` : Unit and integration tests

Here I just mentioned directories that worth taking a look at. Others contain Rails standard stuffs.

## License

RailsReactLive is licensed under the MIT License.
