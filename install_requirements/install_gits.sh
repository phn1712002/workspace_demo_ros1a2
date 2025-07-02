#!/bin/bash

# Check for git_clone.sh in colcon workspace first
if [ -f "colcon_ws/src/git_clone.sh" ]; then
    echo "Found colcon_ws git_clone.sh, executing..."
    bash colcon_ws/src/git_clone.sh
# If not found, check catkin workspace
elif [ -f "catkin_ws/src/git_clone.sh" ]; then
    echo "Found catkin_ws git_clone.sh, executing..."
    bash catkin_ws/src/git_clone.sh
else
    echo "Error: No git_clone.sh found in either workspace"
    exit 1
fi
