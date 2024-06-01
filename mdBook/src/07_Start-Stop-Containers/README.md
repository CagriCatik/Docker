# Starting & Stopping Containers

 In this tutorial, we will delve into starting and stopping containers, both through Docker Desktop GUI and the command line interface (CLI).

## Overview

- Introduction to running containers from Docker images.
- Port mapping to access container services.
- Starting, stopping, and restarting containers using Docker Desktop and CLI.

## Starting Containers with Docker Desktop

### 1. Running an Image

- Open Docker Desktop and navigate to the Images tab.
- Click on the Run button next to the desired image.
- Specify container name and port mapping.
  - Example: `my_app_container_1`, mapping port 4000 of the container to localhost port 4000.
- Click Run to start the container.

### 2. Accessing Container Services

- Once the container is running, access its services via the specified port.
- Verify functionality by accessing `localhost:4000` in your web browser.
- Containers can be stopped using the Stop button, but they remain listed in Docker Desktop.

## Starting Containers with CLI

### 1. Finding Image Details

- Open a terminal or command prompt.
- List available Docker images:
  ```
  docker images
  ```

### 2. Running Containers

- Run an image and create a container:
  ```
  docker run --name my_app_container_1 my_app
  ```

### 3. Mapping Ports

- Use the `-p` flag to map container ports to host ports:
  ```
  docker run --name my_app_container_2 -d -p 4000:4000 my_app
  ```

### 4. Detached Mode

- Add `-d` flag to run containers in detached mode:
  ```
  docker run -d --name my_app_container_2 -p 4000:4000 my_app
  ```

### 5. Accessing Container Services

- Verify container functionality by accessing `localhost:4000` in your web browser.

## Stopping and Restarting Containers

### 1. Stopping Containers

- List running containers:
  ```
  docker ps
  ```
- Stop a container by its ID or name:
  ```
  docker stop my_app_container_2
  ```

### 2. Restarting Containers

- List all containers:
  ```
  docker ps -a
  ```
- Restart a stopped container:
  ```
  docker start my_app_container_2
  ```

## Example: Running a Node.js Application in Docker

### 1. Setting up the Node.js Application

Create a simple Node.js application that serves a JSON response:

**app.js**

```javascript
const http = require('http');

const hostname = '0.0.0.0';
const port = 4000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ message: 'Hello from Docker!' }));
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

### 2. Dockerfile Configuration

Create a Dockerfile to define the container's configuration:

**Dockerfile**

```Dockerfile
FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

CMD ["node", "app.js"]
```

### 3. Building the Docker Image

Build the Docker image from the Dockerfile:

```bash
docker build -t my-node-app .
```

### 4. Running the Docker Container

#### Using Docker Desktop

- Open Docker Desktop.
- Navigate to the Images tab.
- Click on the Run button next to the `my-node-app` image.
- Specify a container name (`my_node_container`) and port mapping (`4000:4000`).
- Click Run to start the container.

#### Using CLI

Run the Docker container from the command line:

```bash
docker run -d --name my_node_container -p 4000:4000 my-node-app
```

### 5. Accessing the Application

Visit `localhost:4000` in your web browser to access the Node.js application running inside the Docker container. You should see the JSON response: `{"message":"Hello from Docker!"}`.

### 6. Stopping and Restarting the Container

#### Stopping the Container

Using Docker Desktop:

- Go to the Containers tab.
- Click on the Stop button next to `my_node_container`.

Using CLI:

```bash
docker stop my_node_container
```

#### Restarting the Container

Using Docker Desktop:

- Go to the Containers tab.
- Click on the Start button next to `my_node_container`.

Using CLI:

```bash
docker start my_node_container
```
