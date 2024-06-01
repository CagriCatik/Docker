# Managing Images & Containers

In this tutorial, we'll delve into managing Docker images and containers, including how to delete them and how to add versions to images.

## Deleting Images and Containers

To manage Docker images and containers, we need to understand how to delete them.

### Deleting Images

First, let's list all the images:

```bash
docker images
```

To delete an image, you can use the `docker image rm` command followed by the image name or ID. For example:

```bash
docker image rm my_app
```

If the image is being used by a container, you'll receive an error. To force the removal of an image being used by a container, you can add the `-f` flag:

```bash
docker image rm -f my_app
```

### Deleting Containers

To delete containers, first list all containers:

```bash
docker ps -a
```

Then, to delete a container, use the `docker container rm` command followed by the container name or ID:

```bash
docker container rm my_container
```

### Deleting Images Used by Containers

If an image is being used by a container, you can either force-remove it or delete the associated containers first.

To force-remove an image being used by a container:

```bash
docker image rm -f my_image
```

Or, delete the associated containers first:

1. List all containers.
2. Delete the containers.
3. Now you can delete the image without errors.

## Adding Versions to Images

Docker allows you to add versions or tags to images. You can create variations of your images with different tags, denoted by adding a colon (`:`) after the image name followed by the tag name.

### Creating Tagged Images

To create a new image with a tag/version:

```bash
docker build -t my_app:v1 .
```

This command builds an image with the tag `v1`.

### Running Containers with Specific Image Versions

When running a container, specify the tag/version of the image:

```bash
docker run --name my_app_c -p 4000:4000 my_app:v1
```

This command runs a container from the image `my_app` with the tag `v1`.

## Example: Creating and Managing Docker Images and Containers

In this example, we'll create a Docker image for a basic web server using Flask, add a version to it, and run a container from that versioned image.

### Step 1: Create a Flask Web Server

First, create a Flask web server in a file named `app.py`:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, Docker!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
```

### Step 2: Create a Dockerfile

Next, create a `Dockerfile` in the same directory as `app.py`:

```Dockerfile
# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Flask
RUN pip install --no-cache-dir Flask

# Expose port 5000
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```

### Step 3: Build the Docker Image

Build the Docker image with a tag/version:

```bash
docker build -t my_flask_app:v1 .
```

### Step 4: Run the Docker Container

Run a container from the versioned image:

```bash
docker run --name my_container -p 5000:5000 my_flask_app:v1
```

### Step 5: Access the Web Server

Open your web browser and navigate to `http://localhost:5000` to see the message "Hello, Docker!" served by the Flask web server running in the Docker container.

### Step 6: Manage Images and Containers

You can list images and containers:

```bash
docker images
docker ps -a
```

And delete them when no longer needed:

```bash
docker rm my_container
docker image rm my_flask_app:v1
```
