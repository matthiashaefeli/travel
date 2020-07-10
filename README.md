# Travel

Travel is a rails app to calculate travel times with the given start and end locations.

## How to get set up locally

Note: Travel uses PostgreSQL, so you'll need to have PostgreSQL installed in order to get the project running.

```
$ git clone https://github.com/matthiashaefeli/travel.git
$ cd travel
$ bundle install
$ yarn
$ rails db:create
$ rails db:migrate
````

## Running the server

```
$ rails s
```
## Run test suit

```
$ cd travel
$ rspec
```
Test coverage file: travel/coverage/index.html

## Deploy Travel to Heroku:

```
$ heroku login
$ heroku create
$ git config --list | grep heroku  # verify remote
$ git push heroku master
$ heroku ps  # check dynos
$ heroku open  # open app in browser
```

Rails secret key config

```
$ rake secret
$ heroku config:set SECRET_KEY_BASE='put here new generated key'
```

