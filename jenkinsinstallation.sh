#!/bin/bash

set -e

echo "======================================"
echo "Updating package list..."
echo "======================================"
sudo apt update

echo "======================================"
echo "Installing Java (OpenJDK 21)..."
echo "======================================"
sudo apt install -y fontconfig openjdk-21-jre

echo "Java Version:"
java -version

echo "======================================"
echo "Installing Jenkins..."
echo "======================================"

# Add Jenkins repository key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

echo "======================================"
echo "Jenkins Version"
echo "======================================"
jenkins --version

echo "======================================"
echo "Jenkins Service Status"
echo "======================================"
sudo systemctl status jenkins --no-pager

echo "Stopping Jenkins..."
sudo systemctl stop jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins

echo "Enabling Jenkins at boot..."
sudo systemctl enable jenkins

echo "Final Jenkins Status:"
sudo systemctl status jenkins --no-pager

echo "======================================"
echo "Installation Completed Successfully!"
echo "======================================"