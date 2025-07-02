#!/bin/bash

REQUIREMENTS_DIR="list_requirements"

echo "Checking for requirements files in $REQUIREMENTS_DIR/..."

# Find all .txt files in requirements directory
files=$(find "$REQUIREMENTS_DIR" -name "*.txt" 2>/dev/null)

if [ -z "$files" ]; then
    echo "No .txt requirements files found in $REQUIREMENTS_DIR/"
    exit 0
fi

# Install each requirements file
for file in $files; do
    echo "Installing requirements from $file..."
    pip install -r "$file"
done

echo "All requirements installed successfully"
