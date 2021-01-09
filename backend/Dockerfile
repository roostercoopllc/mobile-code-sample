# Don't do line two in production, this is a total hack for speed make the image from source for staying lean
FROM python:latest
ENV FLASK_APP /app/simple_flask.py
RUN apt-get update 
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/requirements.txt
ADD simple_flask.py /app/simple_flask.py
RUN pip install -r /app/requirements.txt

CMD ["python", "simple_flask.py"]