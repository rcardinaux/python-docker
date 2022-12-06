# syntax=docker/dockerfile:1

# Base image we would like to use for our application
FROM python:3.8-slim-buster

# Create a working directory whose path is going to be the base for all subsequent commands
WORKDIR /app

# Copy requirements.txt from the machine into the image
# Install pip packages
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copy all the files located in the current directory on our machine into the image
COPY . .

# Tell Docker what command we want to run when our image is executed inside a container.
# Make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]