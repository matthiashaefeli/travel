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


Deploy Travel to Heroku:

