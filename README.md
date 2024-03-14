# Blog Application
##### This is a simple Blog Application. It is build with ruby on rails 7 with it's new launched features. This application provides feature to post, create, update, delete the Blogs along with comments module which allow users to make comment to blog.

## Features
- Ruby (Version: 3.0.2)
- Ruby on Rails (Version: 7.0.8.1)
- Turbo Frame and StimulusJS with hotwire
- Devise for authentication
- User can sign-up, sign-in & edit profile
- User can create, update, destroy and post blogs
- Tailwind CSS with esbuild asset compiler
- User can create, update, delete and post comment on blogs
- Will Paginate gem for pagination

## Getting Started
To run the Blog application locally, follow these steps:

- Clone the Repository
- Install Ruby 3.2.0 and Rails 7.0.8
- Install MYSQL and setup username and password in config/database.yml file
- Run following commands from terminal
```sh
bundle install
rails db:create
rails db:migrate
./bin/setup
# Start the server
./bin/dev
```
- Now go to http://localhost:3000, and we should see the Rails boot screen.
