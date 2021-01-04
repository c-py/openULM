# OpenULM

Open User Lifecycle Management (OpenULM) is a free application to onboard manage the lifecycle of application users.

Contributions Welcome.

## Developing

1. To set up the development environment create a `.env` file and populate with the snippet below. Replace the placeholders `< >` with sane values.

```
SECRET_KEY_BASE=<INSERT A RANDOM KEY>
PGUSER=<POSTGRES USER>
PGPASSWORD=<POSTGRES PASSWORD>
PGDATABASE=openulm
PGPORT=5432
PGHOST=db
```

2. To start the development server run `docker-compose up`
3. To run `mix` commands use `docker-compose run`. For example to reset the database run `docker-compose run --rm phoenix mix ecto.reset`