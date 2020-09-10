FROM python:3.8

RUN python -m pip install --upgrade pip
RUN python -m pip install pyobo gunicorn
