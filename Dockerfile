FROM python:3.7
MAINTAINER Charles Tapley Hoyt "cthoyt@gmail.com"

RUN mkdir /app
COPY requirements.txt /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN wget "https://zenodo.org/record/3756206/files/ooh_na_na.tsv.gz?download=1" -O /app/ooh_na_na.tsv.gz
RUN pip install pyobo
