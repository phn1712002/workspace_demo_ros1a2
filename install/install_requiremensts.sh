#!/bin/bash

WS_DIRS=("colcon_ws" "catkin_ws")
found_packages=0

for ws in "${WS_DIRS[@]}"; do
    if [ ! -d "$ws" ]; then
        echo "Workspace $ws not found, skipping..."
        continue
    fi
    
    ws_dir="$ws/src"
    echo "Checking packages in $ws_dir..."
    
    # Find all package directories
    packages=$(find "$ws_dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)
    
    if [ -z "$packages" ]; then
        echo "No packages found in $ws_dir"
        continue
    fi

    # Process each package
    for package in $packages; do
        req_file="$package/requirements.txt"
        if [ -f "$req_file" ]; then
            echo "Installing requirements from $req_file..."
            pip install -r "$req_file"
            ((found_packages++))
        fi
    done
done

if [ "$found_packages" -eq 0 ]; then
    echo "No packages with requirements.txt found in any workspace"
    exit 0
fi

echo "Successfully processed requirements for $found_packages package(s)"
