#!/bin/bash

# Check for run_bash.sh in colcon workspace first
if [ -f "colcon_ws/src/run_bash.sh" ]; then
    echo "Found colcon_ws run_bash.sh, executing..."
    bash colcon_ws/src/run_bash.sh
# If not found, check catkin workspace
elif [ -f "catkin_ws/src/run_bash.sh" ]; then
    echo "Found catkin_ws run_bash.sh, executing..."
    bash catkin_ws/src/run_bash.sh
else
    echo "Error: No run_bash.sh found in either workspace"
    exit 1
fi
