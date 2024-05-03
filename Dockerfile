# Install ROS Kinetic on Ubuntu 16.04
FROM osrf/ros:kinetic-desktop-full

# Install Bebop Autonomy dependencies
RUN apt-get update && apt-get install -y \
    git \
    nano \
    wget \
    python3 \
    python3-pip \
    build-essential \
    python-rosdep \
    python-catkin-tools

# Create ROS workspace
RUN mkdir -p /root/bebop_ws/src
WORKDIR /root/bebop_ws

# Clone Bebop Autonomy repository
RUN git clone https://github.com/AutonomyLab/bebop_autonomy.git src/bebop_autonomy

# Create scripts directory
RUN mkdir -p src/bebop_autonomy/scripts

# Clone joy2bebop.py script
RUN wget https://raw.githubusercontent.com/MAMV3x3/ros_bebop_autonomy_docker/main/source/joy2bebop.py -O src/bebop_autonomy/scripts/joy2bebop.py

# Revolve dependencies
RUN rosdep update --include-eol-distros && \
    rosdep resolve catkin && \
    rosdep resolve angles

# Install Bebop Autonomy dependencies
RUN rosdep install --from-paths src -i -y

# Build Bebop Autonomy
RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash && \
    catkin build"

# Add aliases to .bashrc
RUN echo "alias takeoff='rostopic pub --once /bebop/takeoff std_msgs/Empty'" >> ~/.bashrc
RUN echo "alias land='rostopic pub --once /bebop/land std_msgs/Empty'" >> ~/.bashrc
RUN echo "alias view_camera='rosrun image_view image_view image:=/bebop/image_raw'" >> ~/.bashrc

# Message to user
RUN echo "Bebop Autonomy installed successfully!"
