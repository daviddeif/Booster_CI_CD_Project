FROM ubuntu:latest
RUN mkdir /project
ADD . /project/
WORKDIR /project
RUN apt update -y
RUN apt-get install python3.6 -y
RUN apt install python3-pip -y
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations 
RUN python3 manage.py migrate
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
