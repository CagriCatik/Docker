# Dockerizing ROS2

## Step 1: Set up ROS 2 Workspace

Assuming you have a ROS 2 workspace with your packages and dependencies configured, ensure that it is working correctly before proceeding.

## Step 2: Create a Dockerfile

Create a `Dockerfile` in the root directory of your ROS 2 workspace. This file will contain instructions for building your Docker image. Here's a detailed example:

```Dockerfile
# Use ROS 2 Foxy base image
FROM ros:foxy

# Install additional dependencies (if needed)
RUN apt-get update && apt-get install -y \
    ros-foxy-desktop \
    # Add your additional dependencies here \
    && rm -rf /var/lib/apt/lists/*

# Set up workspace
WORKDIR /ros2_ws
COPY . /ros2_ws

# Build ROS 2 workspace
RUN . /opt/ros/foxy/setup.sh && \
    colcon build --symlink-install

# Source ROS 2 setup file
RUN echo "source /ros2_ws/install/setup.bash" >> /root/.bashrc
```

Replace `ros:foxy` with the appropriate ROS 2 base image tag according to your ROS 2 version. Ensure to add any additional dependencies required by your ROS 2 packages in the `RUN apt-get install` command.

## Step 3: Build the Docker Image

Navigate to the directory containing your `Dockerfile` and run the following command to build your Docker image:

```bash
docker build -t my_ros2_image .
```

## Step 4: Run the Docker Container

Once the image is built, you can run a Docker container using the following command:

```bash
docker run -it --rm my_ros2_image
```

This command will start a new container based on your ROS 2 image, and you will be dropped into a shell inside the container.

## Step 5: Test Your ROS 2 Application

Inside the Docker container, navigate to your ROS 2 workspace and run your ROS 2 nodes or launch files as you would normally. Ensure that everything works as expected within the Docker environment.

## Step 6: Persisting Data (Optional)

If you need to persist data between container runs, such as log files or generated data, you can use Docker volumes or bind mounts to mount host directories into the container. Modify your `docker run` command to include volume mounts as needed.

## Step 7: Distribute Your Docker Image (Optional)

Once you have verified that your ROS 2 application works as expected within the Docker container, you can distribute your Docker image to others or deploy it to cloud platforms for production use.

That's it! You've successfully dockerized your ROS 2 application. Dockerizing your ROS 2 workflow provides several benefits, including portability, reproducibility, and scalability, making it easier to develop and deploy robotics applications in various environments.

## Tips & Tricks

When containerizing an application like ROS2 (Robot Operating System 2) using Docker, organizing your folder structure optimally can help maintain clarity, ease of management, and scalability. Here's a suggested folder structure:

```sh
ros2_docker_app/
│
├── Dockerfile
├── docker-compose.yml (optional, for multi-container setups)
│
├── app/
│   ├── src/             # ROS2 source code
│   ├── launch/          # ROS2 launch files
│   ├── config/          # Configuration files
│   └── ...
│
├── build/               # Build artifacts (optional, if building inside container)
└── ...
```

Explanation:

1. **Dockerfile**: This file contains instructions for building your Docker image. It specifies the base image, dependencies, environment variables, and commands needed to set up your ROS2 application within the container.
2. **docker-compose.yml** (optional): If your ROS2 application consists of multiple containers (e.g., separate containers for different nodes), you can use `docker-compose` to manage them. This YAML file defines the services, networks, and volumes needed for your multi-container setup.
3. **app/**: This directory contains your ROS2 application code.

   - **src/**: Place your ROS2 package(s) source code here. Organize packages as per ROS2 conventions.
   - **launch/**: Store ROS2 launch files here. Launch files define how nodes are executed and connected.
   - **config/**: Configuration files specific to your ROS2 application, such as YAML files defining parameters.
4. **build/** (optional): If you choose to build your ROS2 application inside the Docker container, you may want to have a directory to store build artifacts. This can help speed up subsequent builds by caching intermediate build layers.

Additional Tips:

- **Keep Dockerfile Minimal**: Try to keep your Dockerfile as minimal as possible by using a base image that includes ROS2 and installing only additional dependencies specific to your application.
- **Use Docker Volumes**: Utilize Docker volumes to mount host directories into the container, especially for development workflows. This allows you to edit code on your host machine and see changes reflected inside the container without rebuilding.
- **Separate Environments**: Consider having separate Dockerfiles or Docker Compose configurations for development, testing, and production environments to manage dependencies and configurations accordingly.
- **Version Control**: Ensure that your entire Docker setup, including Dockerfile(s), docker-compose.yml, and application code, is version controlled using a tool like Git. This helps in collaboration and reproducibility.

By following this folder structure and best practices, you can efficiently containerize your ROS2 application using Docker while maintaining scalability and ease of management.
