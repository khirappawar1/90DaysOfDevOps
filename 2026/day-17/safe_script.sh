#!/bin/bash

set -e #Exit on error

mkdir -p /tmp/devops-test || echo "Failed to created the dir"

cd /tmp/devops-test || echo "failed to navigate"

touch file.txt || echo "Failed to create file"

echo "Script completed successfully"
