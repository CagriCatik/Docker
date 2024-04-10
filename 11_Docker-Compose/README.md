## Docker Compose

In this tutorial, we'll dive deep into Docker Compose, a tool that simplifies the process of defining and running multi-container Docker applications. We'll cover setting up a `docker-compose.yaml` file, building and running containers, accessing services, and cleaning up resources.

### 1. Introduction to Docker Compose:

Docker Compose is a tool provided by Docker that allows you to define multi-container Docker applications in a single YAML file. It automates the process of creating and managing multiple containers, making it easier to develop, deploy, and scale complex applications.

### 2. Setting up Docker Compose File:

Let's create a `docker-compose.yaml` file in the root directory of our project. This file will contain all the configurations for our Docker services.

```yaml
version: "3.8"

services:
  api:
    build: ./api
    container_name: api_container
    ports:
      - "4000:4000"
    volumes:
      - ./api:/app
      - ./api/node_modules:/app/node_modules
```

#### Explanation:

- `version`: Specifies the version of Docker Compose to use. We're using version 3.8.
- `services`: Defines the services (containers) for our project.
  - `api`: Name of the service.
    - `build`: Path to the Dockerfile for building the image.
    - `container_name`: Name of the container.
    - `ports`: Port mapping between host and container.
    - `volumes`: Mapping local directories to container directories.

### 3. Building and Running with Docker Compose:

Now, let's use Docker Compose to build and run our containers.

- Open your terminal in the root directory containing the `docker-compose.yaml` file.
- Run the following command:

```bash
docker-compose up
```

#### Explanation:

This command reads the `docker-compose.yaml` file, builds the Docker image for each service, and starts the containers.

### 4. Accessing Your Services:

Once the containers are up and running, you can access your services as usual. For example, if your API service is running on port 4000, you can access it at `http://localhost:4000`.

### 5. Stopping and Cleaning up:

To stop the containers and remove them, you can use the following command:

```bash
docker-compose down
```

#### Explanation:

This command stops and removes the containers, but it keeps the images and volumes intact.

### 6. Cleaning Up Completely:

If you want to remove the images and volumes as well, you can use additional flags with the `down` command:

```bash
docker-compose down --rmi all -v
```

#### Explanation:

This command removes all images and volumes created by Docker Compose.
