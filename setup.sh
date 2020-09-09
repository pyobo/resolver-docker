#!/bin/bash

# Exit on first command that goes wrong
set -e

TMPIMAGENAME=obo_postgres4
IMAGENAME=oohnana-test
HASH=$(git rev-parse HEAD)

docker image build -t $TMPIMAGENAME .
docker container run -e POSTGRES_PASSWORD=pyobo -p 5433:5432 -t -d --name $TMPIMAGENAME $TMPIMAGENAME

python -m pip install -q pyobo
python -m pyobo.database.sql.loader \
  --uri postgresql+psycopg2://postgres:pyobo@localhost:5433/postgres \
  --test

docker container commit $TMPIMAGENAME $IMAGENAME:$HASH
docker container stop $TMPIMAGENAME

# VERIFY, run on a different port to be sure
# docker container run -p 5436:5432 --rm -it --name oohnana2 oohnana2
docker login
docker tag $IMAGENAME:$HASH cthoyt/$IMAGENAME:$HASH
docker push cthoyt/$IMAGENAME:$HASH
