# Parent Images & Docker Hub

In this tutorial, we will delve into understanding parent images, their significance in Docker, and how to utilize Docker Hub to fetch pre-made images. We will cover the process of pulling a parent image from Docker Hub and exploring its functionalities.

## Introduction to Parent Images

Images in Docker are constructed from layers, with each layer contributing incrementally to the final image. The initial layer, often referred to as the parent image, typically describes the operating system and runtime environment of the container.

### Docker Hub

[Docker Hub](https://hub.docker.com/) serves as an online repository for Docker images, akin to GitHub but tailored for Docker. It houses a vast collection of pre-made images that can be utilized as the foundational layer for custom images.

## Fetching a Parent Image from Docker Hub

Let's imagine we need to create a Docker image for a project requiring a Node.js environment. In such a scenario, the initial layer of our image would be a parent Node.js image obtained from Docker Hub.

1. **Search for Node.js Image**

   - Navigate to Docker Hub and search for Node.js images.
   - Find the official Node.js image, which serves as the base for our containerized environment.
2. **Explore Image Tags**

   - Each Docker image may have multiple tags specifying different versions and configurations.
   - Tags include specific Node.js versions and underlying Linux distributions (e.g., Alpine).
3. **Pull the Image**

   - Copy the `docker pull` command provided on Docker Hub for the desired Node.js image.
   - Execute the command in your terminal to download the image to your local machine.

## Running the Parent Image as a Container

Once the parent Node.js image is downloaded, it can be executed as a container to provide a Node.js runtime environment.

1. **Execute the Image**

   - Use the Docker command `docker run` to create a container from the downloaded Node.js image.
   - Optionally, specify any additional configurations or options.
2. **Interact with the Container**

   - Once the container is running, it can be interacted with through a command-line interface.
   - Execute Linux commands or utilize Node.js functionalities within the container environment.

## Conclusion

Understanding parent images and leveraging Docker Hub's repository of pre-made images is fundamental in Docker development. By fetching appropriate parent images, developers can streamline the process of creating custom Docker images tailored to their project requirements.

In the next lesson, we will delve into creating custom Docker images using a Node.js parent image as the base layer, utilizing a Dockerfile. Stay tuned for an in-depth exploration of Dockerfile configurations and image customization.
