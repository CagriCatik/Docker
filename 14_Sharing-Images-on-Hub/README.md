## Sharing Docker Images on Docker Hub

In this tutorial, we'll walk through the process of sharing Docker images on Docker Hub. Docker Hub is a cloud-based repository service provided by Docker for sharing container images.

### Prerequisites:

- Basic understanding of Docker concepts.
- Docker installed on your local machine.
- Docker Hub account (you can sign up for free at [hub.docker.com](https://hub.docker.com)).

### Steps:

#### 1. Sign up for Docker Hub

- Visit [hub.docker.com](https://hub.docker.com) and sign up for a free account if you haven't already. Log in to your account.

#### 2. Create a Repository on Docker Hub

- Once logged in, navigate to the dashboard.
- Click on the "Create Repository" button.
- Specify the repository details:
  - **Name:** Choose a name for your repository (e.g., `my-api`).
  - **Description:** Optionally, add a description.
  - **Visibility:** Choose between public and private (for this tutorial, we'll keep it public).
- Click on "Create" to create the repository.

#### 3. Build your Docker Image

- Make sure you're in the directory containing the Dockerfile for the image you want to share.
- Build the Docker image using the `docker build` command:

  ```
  docker build -t <username>/<repository_name>:<tag> .
  ```

  Replace `<username>` with your Docker Hub username, `<repository_name>` with the name of your repository (e.g., `my-api`), and `<tag>` with a tag for your image (e.g., `latest`).

#### 4. Push the Image to Docker Hub

- Log in to Docker Hub from the command line:

  ```
  docker login
  ```

  Enter your Docker Hub username and password when prompted.
- Push the image to Docker Hub using the `docker push` command:

  ```
  docker push <username>/<repository_name>:<tag>
  ```

  Replace `<username>`, `<repository_name>`, and `<tag>` with the corresponding values used during image creation.

#### 5. Verify the Image on Docker Hub

- After pushing the image, navigate to your repository on Docker Hub in your web browser.
- You should see your pushed image listed with details like the name, tags, and last pushed time.

#### 6. Pull and Run the Image

- Test the shared image by pulling it from Docker Hub to your local machine:
  ```
  docker pull <username>/<repository_name>:<tag>
  ```
- Once the image is pulled successfully, you can run it like any other Docker image:
  ```
  docker run <username>/<repository_name>:<tag>
  ```

### Additional Resources:

- [Docker Documentation](https://docs.docker.com/)
- [Docker Hub Documentation](https://docs.docker.com/docker-hub/)
- [Docker YouTube Channel](https://www.youtube.com/c/Docker) for more tutorials and guides.
