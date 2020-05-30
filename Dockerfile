FROM python:3.8
MAINTAINER Charles Tapley Hoyt "cthoyt@gmail.com"

RUN pip install --upgrade pip
RUN pip install pyobo==0.2.4
EXPOSE 5000
ENTRYPOINT python -m pyobo.apps.resolver --port 5170 --host "0.0.0.0" --gunicorn
