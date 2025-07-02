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

case $ROS_VERSION in
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

# Export workspace environment variables
echo "Exporting workspace environment variables..."
export MY_WS="$(pwd)"
export AI_WS="$(pwd)/ai_ws"
export CATKIN_WS="$(pwd)/catkin_ws" 
export COLCON_WS="$(pwd)/colcon_ws"
export ECAD_WS="$(pwd)/ecad_ws"
export MCAD_WS="$(pwd)/mcad_ws"
export SIMULATION_WS="$(pwd)/simulation_ws"
export UI_WS="$(pwd)/ui_ws"
export SRC_ROS="$(pwd)/auto_source.sh"

echo "Environment variables exported:"
echo "MY_WS=$MY_WS"
echo "AI_WS=$AI_WS"
echo "CATKIN_WS=$CATKIN_WS"
echo "COLCON_WS=$COLCON_WS"
echo "ECAD_WS=$ECAD_WS"
echo "MCAD_WS=$MCAD_WS"
echo "SIMULATION_WS=$SIMULATION_WS"
echo "UI_WS=$UI_WS"
echo "SRC_ROS=$SRC_ROS"

# Ask about git repo handling
echo "Do you want to use this as a NEW project or REUSE/DEVELOP existing project?"
echo "1) NEW project (delete .git and initialize new repository)"
echo "2) REUSE/DEVELOP existing project (keep .git)"
read -p "Enter choice (1 or 2): " git_choice

case $git_choice in
    1)
        echo "Setting up as NEW project - removing .git and README.md, initializing new repository"
        rm -rf .git
        if [ -f "README.md" ]; then
            rm README.md
            echo "README.md removed"
        fi
        git init
        echo "New git repository initialized"
        ;;
    2)
        echo "Keeping existing .git for REUSE/DEVELOPMENT"
        ;;
    *)
        echo "Invalid choice - keeping existing .git"
        ;;
esac
