# Getting Started with Docker

Now that you understand the basics, let's dive into installing Docker and getting started with using it.

## Installation

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

## Usage

Once Docker is installed, you can start using it to create and manage containers. Here are some common commands to get you started:

* `docker pull <image>`: Pulls a Docker image from a registry.
* `docker run <image>`: Runs a Docker container based on a specified image.
* `docker ps`: Lists running containers.
* `docker build <path/to/Dockerfile>`: Builds a Docker image from a Dockerfile.
* `docker-compose up`: Starts services defined in a `docker-compose.yml` file.
