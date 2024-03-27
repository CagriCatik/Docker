# What is Docker?

## Introduction

Docker is a powerful tool that simplifies the process of developing and deploying applications. Docker is often overlooked by new developers due to its initial complexity. However, understanding Docker is crucial as it simplifies application development and deployment, both individually and in team environments.

## What is Docker?

At its core, Docker utilizes containers to run applications in isolated environments on a computer. These containers encapsulate everything an application needs to run, including source code, dependencies, and runtime environments. Docker is a platform designed to make it easier to create, deploy, and run applications using containers. But what exactly are containers?

### Containers

Containers are isolated environments that encapsulate an application's code, dependencies, and runtime environment. They ensure consistency and portability by bundling everything an application needs to run, regardless of the host system.

### Why Docker?

Docker simplifies the development process by eliminating the need to configure individual development environments for each application. With Docker, you can package your application and its dependencies into a container, making it easily shareable and runnable across different systems. Consider a scenario where you're working in a development team, and you need to share your application with teammates. Without Docker, setting up the development environment on each teammate's computer can be tedious and error-prone.

Docker eliminates this hassle by packaging applications into containers, ensuring consistency across different environments. This means you no longer need to worry about installing specific versions of dependencies or configuring environments manually.

### Docker vs. Virtual Machines

While virtual machines can also address similar challenges, Docker containers are more lightweight and efficient. Unlike virtual machines, which run their own operating system, Docker containers share the host computer's kernel, resulting in faster startup times and lower resource consumption.

### Key Benefits of Docker

* **Isolation** : Containers provide a sandboxed environment for running applications, ensuring they don't interfere with each other.
* **Portability** : Docker containers can run consistently across different environments, from development to production.
* **Efficiency** : Containers are lightweight and share the host system's resources, leading to faster startup times and reduced overhead compared to virtual machines.
* **Consistency** : Docker ensures that applications run the same way everywhere, regardless of the underlying infrastructure.


## Getting Started with Docker

Now that you understand the basics, let's dive into installing Docker and getting started with using it.

### Installation

Follow these steps to install Docker on your computer:

* On Windows

  ```ps1
  winget install -e --id Docker.DockerDesktop
  ```
* On Linux

  ```sh
  #!/bin/bash

  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl
  sudo mkdir -p /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker-archive-keyring.gpg

  # Add the Docker repository to Apt sources:
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update

  # Install Docker packages:
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx docker-compose

  # Test Docker installation:
  sudo docker run hello-world
  ```

### Usage

Once Docker is installed, you can start using it to create and manage containers. Here are some common commands to get you started:

* `docker pull <image>`: Pulls a Docker image from a registry.
* `docker run <image>`: Runs a Docker container based on a specified image.
* `docker ps`: Lists running containers.
* `docker build <path/to/Dockerfile>`: Builds a Docker image from a Dockerfile.
* `docker-compose up`: Starts services defined in a `docker-compose.yml` file.
