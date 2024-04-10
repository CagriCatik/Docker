# The Dockerfile

In this tutorial, we'll delve into the essential component of Docker image creation – the Dockerfile. Dockerfiles serve as blueprints for building Docker images, defining the environment, dependencies, and configurations necessary for running your applications within containers. By the end of this crash course, you'll be equipped with the knowledge to create Dockerfiles and build Docker images effectively.

## Overview

In the previous lessons, we discussed how Docker images consist of multiple layers, with each layer representing changes or additions to the image. The initial layer typically comprises a parent image, such as an operating system or a specific software environment like Node.js or Python. Additional layers are then added to customize the image according to your application's requirements.

The Dockerfile is a text file that contains a set of instructions for Docker to build an image. These instructions define each layer of the image, specifying actions such as copying files, installing dependencies, and setting up the runtime environment.

## Prerequisites

Before we begin, ensure that Docker is installed on your system. You can download Docker Desktop for your operating system from the official Docker website.

## Step-by-Step Guide

### 1. Understanding the Application

For demonstration purposes, we'll use a simple Node.js application. You can access the sample application's code in the `api` folder of the course files on GitHub (Lesson 5 branch).

### 2. Creating the Dockerfile

1. Open your text editor or integrated development environment (IDE).
2. Navigate to the root directory of your project.
3. Create a new file named `Dockerfile` (no file extension).

### 3. Writing the Dockerfile

Now, let's populate the Dockerfile with instructions to build our Docker image:

```Dockerfile
# Specify the base image
FROM node:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy application source code
COPY . .

# Install dependencies
RUN npm install

# Expose port 4000
EXPOSE 4000

# Command to run the application
CMD ["node", "app.js"]
```

Let's break down each instruction:

- `FROM`: Specifies the base image (Node.js 17 on Alpine Linux).
- `WORKDIR`: Sets the working directory inside the container to `/app`.
- `COPY`: Copies the application source code from the host to the container's `/app` directory.
- `RUN`: Executes the `npm install` command to install dependencies.
- `EXPOSE`: Informs Docker that the application inside the container will listen on port 4000.
- `CMD`: Defines the command to run when the container starts (`node app.js`).

### 4. Building the Docker Image

1. Open a terminal.
2. Navigate to the directory containing the Dockerfile.
3. Run the following command to build the Docker image:

```bash
docker build -t my-app .
```

- `-t my-app`: Tags the image with the name `my-app`.
- `.`: Specifies the location of the Dockerfile (current directory).

### 5. Running the Docker Container

Once the image is built successfully, you can run a container using the following command:

```bash
docker run -p 4000:4000 my-app
```

- `-p 4000:4000`: Maps port 4000 of the host machine to port 4000 of the container.
- `my-app`: Specifies the name of the Docker image to use.

Certainly! Let's create a comprehensive example to demonstrate the use of Docker and Dockerfiles. In this example, we'll build a Docker image for a Python web application using Flask framework.

## Example: Dockerizing a Python Flask Application

### 1. Project Structure

Create a new directory for your project and organize the files as follows:

```sh
project/
├── app/
│   ├── templates/
│   │   └── index.html
│   └── app.py
└── Dockerfile
```

### 2. Python Flask Application

Create a simple Python Flask application that serves a basic web page:

#### `app/app.py`

```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

#### `app/templates/index.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flask Docker Example</title>
</head>
<body>
    <h1>Hello, Docker!</h1>
    <p>This is a simple Flask web application running inside a Docker container.</p>
</body>
</html>
```

### 3. Dockerfile

Create a Dockerfile in the project directory to define the Docker image:

#### `Dockerfile`

```Dockerfile
# Use the official Python image as a base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 5000 to the outside world
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
```

### 4. Requirements File

If your application has dependencies, create a `requirements.txt` file listing them:

#### `requirements.txt`

```sh
Flask==2.0.1
```

### 5. Building the Docker Image

Open a terminal, navigate to the project directory, and build the Docker image:

```bash
docker build -t flask-docker-example .
```

### 6. Running the Docker Container

Once the image is built successfully, run a container using the following command:

```bash
docker run -p 5000:5000 flask-docker-example
```

### 7. Accessing the Application

Open a web browser and navigate to `http://localhost:5000` to view the Flask application running inside the Docker container.
