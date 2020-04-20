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

