#!/bin/bash

# Detect installed ROS version
if [ -f "/opt/ros/noetic/setup.bash" ]; then
    ROS_VERSION="noetic"
    source "/opt/ros/$ROS_VERSION/setup.bash"
elif [ -f "/opt/ros/humble/setup.bash" ]; then
    ROS_VERSION="humble"
    source "/opt/ros/$ROS_VERSION/setup.bash"

else
    echo "ERROR: No ROS installation found in /opt/ros/"
    exit 1
fi

echo "ROS $ROS_VERSION environment sourced"
echo
echo "Please choose ROS version:"
echo "1) ROS 1"
echo "2) ROS 2"
read -p "Enter your choice (1 or 2): " ros_choice

case $ros_choice in
    1)
        echo "Selected ROS 1 - Removing colcon_ws folder"
        if [ -d "colcon_ws" ]; then
            rm -rf colcon_ws
            echo "colcon_ws removed"
        else
            echo "colcon_ws folder not found"
        fi
        echo "// TODO ROS 1"
        
        # Build ROS1 workspaces
        echo "Building ROS1 workspaces..."
        if [ -d "simulation_ws" ]; then
            cd simulation_ws && catkin_make
            cd ..
            echo "simulation_ws built successfully"
            echo "Sourced simulation_ws setup.bash"
        else
            echo "simulation_ws not found - skipping"
        fi
        
        if [ -d "catkin_ws" ]; then
            cd catkin_ws && catkin_make
            cd ..
            echo "catkin_ws built successfully"
            echo "Sourced catkin_ws setup.bash"
        else
            echo "catkin_ws not found - skipping"
        fi
        ;;
    2)
        echo "Selected ROS 2 - Removing catkin_ws folder"
        if [ -d "catkin_ws" ]; then
            rm -rf catkin_ws
            echo "catkin_ws removed"
        else
            echo "catkin_ws folder not found"
        fi
        echo "// TODO ROS 2"
        
        # Build ROS2 workspaces  
        echo "Building ROS2 workspaces..."
        if [ -d "simulation_ws" ]; then
            cd simulation_ws && colcon build
            cd ..
            echo "simulation_ws built successfully"
            echo "Sourced simulation_ws setup.bash"
        else
            echo "simulation_ws not found - skipping"
        fi
        
        if [ -d "colcon_ws" ]; then
            cd colcon_ws && colcon build
            cd ..
            echo "colcon_ws built successfully"
            echo "Sourced colcon_ws setup.bash"
        else
            echo "colcon_ws not found - skipping"
        fi
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac
