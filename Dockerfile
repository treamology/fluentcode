FROM python:3
ENV PYTHONBUFFERED 1

#RUN mkdir /code/
#WORKDIR /code/

COPY requirements.txt .
RUN pip install -r requirements.txt

# COPY . /code/