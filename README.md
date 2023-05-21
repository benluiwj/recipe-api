# README

## Setup with Docker

The following instructions are adapted from https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails
To build run the following:

```
docker compose run --no-deps web rails new . --api --force --database=postgresql
```

Run the following to build:

```
docker compose build
```

On the first build, update `config/database.yml` file to the following

```

default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: recipe_api_development


test:
  <<: *default
  database: recipe_api_test
```

Boot the app with `docker compose up`. If all is well, you should see the following:

```
$ docker compose up

rails_db_1 is up-to-date
Creating rails_web_1 ... done
Attaching to rails_db_1, rails_web_1
db_1   | PostgreSQL init process complete; ready for start up.
db_1   |
db_1   | 2018-03-21 20:18:37.437 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2018-03-21 20:18:37.437 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2018-03-21 20:18:37.443 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2018-03-21 20:18:37.726 UTC [55] LOG:  database system was shut down at 2018-03-21 20:18:37 UTC
db_1   | 2018-03-21 20:18:37.772 UTC [1] LOG:  database system is ready to accept connections

```

Create the database by opening another terminal and run the following:

```
docker compose run web rake db:create
```

To seed the database, run

```
docker compose run api rails db:migrate
docker compose run api rails db:seed
```

To stop the application, run

```
docker compose down
```

# IMPROVEMENTS

- [ ] Improve primary key for procedures and ingredients to include the step number and name respectively
