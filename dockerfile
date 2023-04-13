#base image
FROM alpine:3.5

#install python and pip

RUN apk add --update py2-pip
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
RUN pip install --upgrade pip

COPY app.py /usr/src/app/
COPY index.html /usr/src/app/templates/

EXPOSE 5000

#to run the application
CMD ["python", "/usr/src/app/app.py"]