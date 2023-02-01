FROM ubuntu:latest
RUN mkdir /project
ADD . /project/
WORKDIR /project
RUN apt-get install python3
RUN apt install python3-pip
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD python3.6 manage.py runserver 0.0.0.0:8000
