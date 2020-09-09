FROM python:3.8

ARG PYOBO_SQLALCHEMY_URI
ENV PYOBO_SQLALCHEMY_URI=${PYOBO_SQLALCHEMY_URI}

RUN python -m pip install --upgrade pip
RUN python -m pip install pyobo
