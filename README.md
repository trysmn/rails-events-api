## Exercise 2

This README.md file will describe the steps necessary to run and test this Rails app, in accordance with the brief.

I have followed a tutorial on how to make an API on the Ruby on Rails framework - this can be found at the following link: https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one

Firstly, move to the rails-events-api directory in your terminal.

* Ruby version, Rails version and Bundler version

Ensure that you have the latest ruby version, rails version and bundler version installed in your terminal - I used Ruby 2.4.4, Rails 5.2.1 and Bundler 1.16.3, which worked well. To check your ruby version, type 'ruby -v', to check your rails version, type 'rails -v' and to check your bundler version, type 'bundle -v'. To install ruby, type 'rbenv install 2.4.4' in to your terminal. To install rails, type 'gem install rails'; to update rails, type 'gem update rails'. To install bundler, type 'gem install bundler'.

* Configuration and Ruby gems

In the gemfile, I added the rspec-rails, factory_bot_rails, shoulda-matchers, faker and database_cleaner gems. The rspec-rails gem allows us to build and run tests on our event creation. The factory_bot_rails gem allows us to use methods involved in the module FactoryBot. The shoulda-matchers gem allows us to use rspec as our test framework and full matcher libraries for rails. The faker gem allows us to generate fake data that has the structure we desire for specific attributes - for example, it can generate a 'random' colour for an attribute colour. The database_cleaner gem allows us to clean the database each time a test is carried out, so that other instances do not interfere with the logic of our Event model. I then typed 'bundle install' in the terminal to ensure that these changes were registered.

* Database initialization

Next, you will need to create a database - this is done by typing 'rails db:create'. We then ensure that the event table is created in the schema by migrating it - this is done by typing 'rails db:migrate'.

* How to run the test suite

The event tests written in /rails-events-api/spec/requests/events_spec.rb can then be run by typing 'bundle exec rspec' in the terminal. Each test should be a green colour, confirming that it has passed.

* Seeding the database

To seed the database with the 10 events defined in /rails-events-api/db/seeds.rb, type 'rails db:seed' in the terminal. A message should visually confirm that these events have been created.

* Testing that the API returns the 10 events in JSON:

Start a rails server by typing 'rails s' in your terminal. Go to your localhost with the relevant port on your browser (for me, this is localhost:3000). Then you can test the endpoints stated in the brief (/api/events/ and /api/events/:id). If you wish to create a new event, then one can do this using the gem httpie (this can be installed using 'gem install httpie'). Once you have httpie, create another tab for your terminal (in addition to the rails server running) and you can write HTTP requests on the command line.
Some examples of this are:

$ http :3000/events
# shows all events returned by the API in JSON format.

$ http POST :3000/events start_time="2001-02-03T04:05:06.123456789+07:00" end_time="2001-02-04T04:05:06.123456789+07:00" label="event_one" category="blue"
# creates a new event with defined values for parameters.

$ http DELETE :3000/events/1
# deletes the event with id 1 from the database.

