# phpPgAdmin Docker Image

Based on https://github.com/ReimuHakurei/phpPgAdmin

## Environment variables

### Server

 * `POSTGRES_HOST` - Postgresql server host
 * `POSTGRES_PORT` - Postgresql server port (default `5432`)
 * `POSTGRES_DB` - Database name (default `postgres`)
 * `POSTGRES_DESCR` - Display name for the server on the login screen (Default `$POSTGRES_HOST`)
 * `POSTGRES_SSL_MODE` - Database SSL mode. Possible options: disable, allow, prefer, require. (default `allow`)

### Additional servers (optional)

Up to three more servers can be added. Each uses the same variables as above with a suffix: `_2`, `_3` or `_4`.
A server is added only if its `POSTGRES_HOST_<n>` is defined; the other variables of that server are optional and have the same defaults as above.

 * `POSTGRES_HOST_2`, `POSTGRES_PORT_2`, `POSTGRES_DB_2`, `POSTGRES_DESCR_2`, `POSTGRES_SSL_MODE_2` - second server
 * `POSTGRES_HOST_3`, `POSTGRES_PORT_3`, `POSTGRES_DB_3`, `POSTGRES_DESCR_3`, `POSTGRES_SSL_MODE_3` - third server
 * `POSTGRES_HOST_4`, `POSTGRES_PORT_4`, `POSTGRES_DB_4`, `POSTGRES_DESCR_4`, `POSTGRES_SSL_MODE_4` - fourth server

Example:

```
docker run -p 8080:80 \
  -e POSTGRES_HOST=db1 \
  -e POSTGRES_HOST_2=db2 -e POSTGRES_PORT_2=5433 -e POSTGRES_DESCR_2="Staging" \
  viktor44/phppgadmin:latest
```

### Interface

 * `DEFAULT_LANG` - Default interface language, e.g. `english`, `polish`. `auto` uses browser preference (default `auto`)
 * `THEME` - Look & feel theme (default `default`)
 * `SHOW_OWNED_ONLY` - Only show databases owned by the user (default `false`)
 * `SHOW_ADVANCED_OBJECTS` - Show aggregates, types, operators, operator classes, conversions, languages and casts (default `false`)
 * `SHOW_SYSTEM_OBJECTS` - Show system objects (default `false`)
 * `PORT` - exposed HTTP port (Default 80)

## Usage

Example `docker-compose.yaml` with a PostgreSQL server and phpPgAdmin:

```yaml
services:

  db:
    image: postgres:18
    shm_size: 128mb
    ports:
      - 5432:5432
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: example

  pgadmin:
    image: viktor44/phppgadmin:latest
    depends_on:
      - db
    ports:
      - 5000:80
    environment:
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
```

Run `docker compose up` and open http://localhost:5000. Log in with `postgres` / `example`.

## Issues

https://github.com/viktor44/docker-phppgadmin/issues



