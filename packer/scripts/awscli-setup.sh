#!/bin/bash

# Update package lists
sudo apt update

# Install the AWS CLI dependencies
sudo apt install -y unzip curl

# Download the AWS CLI bundle
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the downloaded bundle
unzip awscliv2.zip

# Run the AWS CLI installation script
sudo ./aws/install

# Verify the installation
aws --version

# Clean up the downloaded bundle
rm -rf awscliv2.zip ./aws
