# MakersBnB

[Project Description](#project-description) | [Tech Stack](#tech-stack) | [Installation](#installation) | [Running tests](#running-tests) | [Development Process](#development-process) | [User Stories](#user-stories) | [Database](#database) | [Models](#models) | [Further development](#further-development)

## Project Description

Create a clone app of Airbnb in Ruby. This is a group project focused on pair programing and delivering MPV utilizing XP principles.

### The Team:

Project created by the team: ([Ed Ancerys](https://github.com/EdAncerys), [Andrew Hulme](https://github.com/AndrewHulme), [Ellis Trickett](https://github.com/ellistrickett), [Colin Muir](https://github.com/cjm106), ) at Makers Academy.

## What we done

- Our app allows user to sign_up
- Allows user to sign_in.
- Once we are identified by the system we can create a space or book one.
- As part of our implementation we can add a name to the space, a price and a description.

## Tech Stack:

- [Capybara](https://github.com/teamcapybara/capybara) Capybara helps you test web applications by simulating how a real user would interact with your app.
- [RSpec](https://rspec.info/) Behaviour Driven.
  Development for Ruby. **TDD**.
- [Sinatra](http://sinatrarb.com/) Sinatra is a DSL for quickly creating web. applications in Ruby with minimal effort.
- [PostgreSQL](https://www.postgresql.org/) Open Source Relational Database
- [Rubocop](https://github.com/rubocop-hq/rubocop) RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
- [Bootstrap](https://getbootstrap.com/) & CSS for styling.

## Installation

- Clone this repository
  `$ git clone https://github.com/EdAncerys/MakersBnB`
- Navigate to local repository
  `$ cd MakersBnB`
- Install bundler if you don't already have it
  `$ gem bundle install`
- Install all dependencies
  `$ bundle install`
- Add/install database structure locally.

```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

Add following for both, development and test databases:

```
CREATE TABLE users(user_id SERIAL PRIMARY KEY, email VARCHAR(200), password VARCHAR(60), real_name VARCHAR(100));
CREATE TABLE space(id SERIAL PRIMARY KEY, user_id INTEGER NOT NULL, space_name VARCHAR(100) NOT NULL, description VARCHAR(250) NOT NULL, price MONEY NOT NULL, dates_available TEXT NOT NULL);
```

- Start the server
  `$ ruby app.rb`
- Navigate to [http://localhost:3000](http://localhost:3000) in your browser

## Running tests

- Navigate to local repository
  `$ cd MakersBnB`
- No need to start the server. In the terminal type the following command:
  `$ rspec`

## Development Process

Our team used an agile development process with regular sprints to deliver this application.
We followed the Extreme Programming values - all features were pair programmed, team members shared all the changes in the code design, the team used test-driven development, and delivered an MVP in the first sprint.
During development we used an agile process of git branches, merges, regular code reviews, and continuous integration.
We had daily stand-ups and retrospectives to update each other on the tasks completed, and reflect on our team's progress.

## Our user stories implementation had followed this check points:

Any signed-up user can list a new space.

- As a user, I need to sign-up. (name, username, email, password)
- As a user, I need to log-in. (username, password)
- As a user, I need to log-out.
- As a Owner, I want to be able to list a new space

Users can list multiple spaces

As A Owner, I want to be able to list multiple spaces.

- Users should be able to name their space, provide a short description of the space, and a price per night.
- As a Owner, I want to be able to name my spaces.
- As a Owner, I want to be able to be able to add a description to my spaces
- As a Owner, I want to be able to add a price per night to my spaces

Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

- As a Client, I would like to request a space for a night.
- As a Owner, I would like to be able to approve requests to stay at my space
- As a Owner, I would like to be able to decline requests to stay at my space
- Nights for which a space has already been booked should not be available for users to book that space
- As a Client, I don't want to see rooms that have an accepted booking request for my chosen dates (not available).
- Until a user has confirmed a booking request, that space can still be booked for that night.
- As a client, I can make a booking request for a room with an existing booking request that has not yet been approved. (maybe available)

## User Stories

```
As a user,
So I can have an account,
I am able to sign up.
```

```
As a user,
So I can interact with the website,
I am able to log in.
```

```
As a user,
So I can create a new listing,
I am able to list a new space.
```

```
As a user,
So I can advertise multiple spaces,
I am able to list multiple spaces.
```

```
As a user,
So I can name my space,
I can give my space a name.
```

```
As a user,
So that I can advertise my space,
I can write a short description for my space.
```

```
As a user,
So that others know how much my space costs,
I can give it a price per night.
```

```
As a user,
So I can show when the space is available,
I want to make the space available to book over a range of dates.
```

```
As a user,
So that I can rent a space,
I need to be able to request the property on a certain date.
```

```
As a user,
So that I can rent my space,
I need to be able to see my requests and approve them.
```

```
As a user,
So that a space can't be double booked,
I shouldn't be able to book a space on those dates
```

```
As a user,
So that I can decide who books the space,
My space is still available to book until I have confirmed a request.
```

## Database

### To set up the databases

#### database

Connect to `psql` and create the `makersbnb` database:

```
CREATE DATABASE makersbnb;
```

#### Test database

Connect to `psql` and create the `makersbnb_test` database:

```
CREATE DATABASE makersbnb_test;
```

`USER` table:

| field     | type              |
| --------- | ----------------- |
| USER ID   | PRIMARY SERIAL ID |
| EMAIL     | VARCHAR(200)      |
| PASSWORD  | VARCHAR(60)       |
| USERNAME  | VARCHAR(100)      |
| REAL NAME | VARCHAR(100)      |

`SPACE ADVERTISMENT` table:

| field           | type                       |
| --------------- | -------------------------- |
| SPACE ID        | PRIMARY SERIAL ID          |
| USER ID (host)  | VARCHAR(100) (FOREIGN KEY) |
| NAME OF SPACE   | VARCHAR(100)               |
| DESCRIPTION     | VARCHAR(250)               |
| PRICE           | Integer                    |
| DATES AVAILABLE | VARCHAR                    |

`CONFIRMED BOOKING` table:

| field           | type                       |
| --------------- | -------------------------- |
| ID              | PRIMARY SERIAL ID          |
| USER ID (guest) | VARCHAR(100) (FOREIGN KEY) |
| SPACE ID        | (FOREIGN KEY)              |
| DATE OF BOOKING | DATE                       |

## Models

| class | methods  |
| ----- | -------- |
| user  | @spaces  |
|       | .log_in  |
|       | .sign_up |

| class | methods                                               |
| ----- | ----------------------------------------------------- |
| Space | @name                                                 |
|       | .add_space(name, description, price, dates_available) |
|       | .view_spaces                                          |

| class   | methods                 |
| ------- | ----------------------- |
| Booking | .book_space(name, date) |
|         | .view_book_space        |
|         | @price                  |

| class   | methods                   |
| ------- | ------------------------- |
| Request | .see_requests(bookings?)  |
|         | .approve_request          |
|         | .decline_request          |
|         | .\_update_dates_available |

## Further Development

Ideas to improve our application

- Add feature to have a calendar view and be able to book a range of dates (from-to) as at the moment we able to book a specific date only.
- Add feature for a user to be able to see availability in a calendar for specific dates.
- Add feature for users to browse spaces based on availability and see spaces available for a range of specific dates.
- Add the ability for space owners to see a range of dates booked and select/accept all or pick dates that suit.
