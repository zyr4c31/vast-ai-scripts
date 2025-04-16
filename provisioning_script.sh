#!/bin/bash

apt install -y poppler-utils
pip install roboflow ultralytics vastai

# 
cd /workspace/
# Cause the script to exit on failure.
set -eo pipefail

# Install your packages
# pip install your-packages

# Download some useful files
wget -P "${WORKSPACE}/" https://raw.githubusercontent.com/zyr4c31/vast-ai-scripts/refs/heads/master/vastai-train.py
# wget -P "${WORKSPACE}/" https://example.org/my-application.tar.gz
# tar xvf ${WORKSPACE}/my-application.tar.gz"

# Set up any additional services
# echo "my-supervisor-config" > /etc/supervisor/conf.d/my-application.conf
# echo "my-supervisor-wrapper" > /opt/supervisor-scripts/my-application.sh
# chmod +x /opt/supervisor-scripts/my-application.sh

# Reconfigure the instance portal
rm -f /etc/portal.yaml
export PORTAL_CONFIG="localhost:1111:11111:/:Instance Portal|0.0.0.0:8000:12345:/:Roommejts AI"

# Reload Supervisor
supervisorctl reload

# python vastai-train.py
