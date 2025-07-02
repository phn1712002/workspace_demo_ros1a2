# Ros-Serial
sudo apt-get update
sudo apt-get install ros-$ROS_DISTRO-rosserial-python
sudo apt-get install ros-$ROS_DISTRO-rosserial
sudo apt-get install ros-$ROS_DISTRO-arduino

# Update dependencies using rosdep
sudo apt update && rosdep update
rosdep install --from-paths src --ignore-src -y
