FROM python:3.7
RUN mkdir /code
ADD . /code/
WORKDIR /code
RUN apt-get update
RUN apt-get install python3-dev default-libmysqlclient-dev -y
RUN pip install pip -U
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
ENV DJANGO_MYSQL_DATABASE django_app
ENV DJANGO_MYSQL_USER root
ENV DJANGO_MYSQL_PASSWORD mypassword
ENV DJANGO_MYSQL_HOST db
ENV DJANGO_MYSQL_PORT 3306
ENV DJANGO_REDIS_LOCATION redis://redis:6379/0