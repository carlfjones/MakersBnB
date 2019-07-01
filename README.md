# MakersBnB
Team Marquee

#User Stories
```
As a user,
So that I can sign in,
I want to be able to create an account
```
```
As a user,
So that I can adertise my space,
I want to be able to list a new space
```
```
As a user,
So that I can advertise all of my spaces
I want to be ablke to list multiple spaces
```
```
As a user,
So that I can identify my spaces,
I would like to give them names
```
```
As a user,
So that I can promote my space,
I would like to provide a short description of my space
```
```
As a user,
So that customers know how much it costs,
I would like to post price per night for my space
```
```
As a user,
So that customers know when they can book,
I would like to offer a range of dates when my space is available
```
```
As a user,
So I can make a booking,
I would like to request to hire any space for one night
```
```
As a user,
So that I can let people book my space,
I would like to approve a hire request from a user
```
```
As a user,
So that my space isn't double booked,
I would like my space to be unavaialable for other users to book for those dates.
```
```
As a user,
Until a user has confirmed a booking request for my space,
My space can still be booked for that night
```
#Nice to Have:

```
As a user,
So that I know the sign up process is conplete,
I would like to recieve an email confirmation.
```

## Project Setup

* $> bundle install

```
# in Gemfile
source 'https://rubygems.org'

gem 'sinatra'
gem 'rspec'
gem 'capybara'
gem 'selenium-webdriver'
gem 'pg'
gem 'rubocop'
```

### To set up the database

Run `psql` and create `makersbnb` and `makersbnb_test` databases:

```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

To set up your tables, connect to each database in `psql` with `\c makersbnb` and `\c makersbnb_test`, then run the SQL scripts found in db/migrations folder in the correct order.

* $> rspec --init

* Run rackup

* Open in browser on localhost:9292
