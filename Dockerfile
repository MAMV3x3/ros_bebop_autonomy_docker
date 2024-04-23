# Install ROS Kinetic on Ubuntu 16.04
FROM osrf/ros:kinetic-desktop-full

# Install Bebop Autonomy dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    build-essential \
    python-rosdep \
    python-catkin-tools

# Create ROS workspace
RUN mkdir -p /root/bebop_ws/src
WORKDIR /root/bebop_ws

# Clone Bebop Autonomy repository
RUN git clone https://github.com/AutonomyLab/bebop_autonomy.git src/bebop_autonomy

# Revolve dependencies
RUN rosdep update --include-eol-distros && \
    rosdep resolve catkin && \
    rosdep resolve angles

# Install Bebop Autonomy dependencies
RUN rosdep install --from-paths src -i -y

# Build Bebop Autonomy
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash && \
    catkin build"

# Message to user
RUN echo "Bebop Autonomy installed successfully!"
