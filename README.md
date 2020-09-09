# resolver-docker

A docker image for the CURIE->Name resolver. 

Run with `docker`:

```bash
docker build --tag resolver:1.0 .
docker run resolver:1.0
````

Run with `docker-compose`:

```bash
docker-compose up --build
```

One thing you have to watch out for is this uses quite a bit of memory!
Probably at least 10-12 gigabytes.

https://nickjanetakis.com/blog/docker-tip-79-saving-a-postgres-database-in-a-docker-image

```bash
docker image build -t obo_postgres_2 .
docker container run -e POSTGRES_PASSWORD=pyobo -p 5433:5432 -t -d --name obo_postgres_2 obo_postgres_2
python -m pyobo.database.sql.loader \
    --uri postgresql+psycopg2://postgres:pyobo@localhost:5433/postgres \
    --test
docker container commit obo_postgres_2 oohnana2:latest
docker container stop obo_postgres_2

# VERIFY, run on a different port to be sure
docker container run -p 5436:5432 --rm -it --name oohnana2 oohnana2
```
