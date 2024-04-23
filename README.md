# ROS Kinetic with Bebop Autonomy Docker Setup

This repository provides a Docker setup for running ROS Kinetic with Bebop Autonomy. It includes a Dockerfile for building the Docker image and a script for running the Docker container with GUI support.

## Prerequisites ✅

- [Docker](https://docs.docker.com/install/)

## Getting Started 🚀

1. Clone this repository:

```bash
git clone https://github.com/MAMV3x3/ros_bebop_autonomy_docker.git
cd ros_bebop_autonomy_docker
```

2. Build the Docker image:

```bash
docker build -t ros_bebop_autonomy .
```

3. Run the Docker container with GUI support:

```bash
./run_docker.sh
```

### Notes 📝

- If you encounter issues, try running the script as root or running `sudo rm -rf /tmp/.docker.xauth`
- This setup assumes that you have X server running on your host machine.
- For more information about ROS Kinetic and Bebop Autonomy, refer to their respective documentation.

## License 📜

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Contributing 🤝

Contributions, issues and feature requests are welcome.