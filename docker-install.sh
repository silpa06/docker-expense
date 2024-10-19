# #!bin/bash
# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
# sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# sudo systemctl start docker
# sudo usermod -aG docker ec2-user
# exit 0

#!/bin/bash

# Ensure the script is executed as root or with sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or with sudo."
   exit 1
fi

# Function to check the exit status of the last command and handle errors
check_status() {
    if [[ $? -ne 0 ]]; then
        echo "Error: $1"
        exit 1
    fi
}

# Install yum-utils
echo "Installing yum-utils..."
sudo yum install -y yum-utils
check_status "Failed to install yum-utils."

# Add the Docker repository
echo "Adding Docker repository..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
check_status "Failed to add Docker repository."

# Install Docker packages
echo "Installing Docker packages..."
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
check_status "Failed to install Docker packages."

# Start the Docker service
echo "Starting Docker service..."
sudo systemctl start docker
check_status "Failed to start Docker service."

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker
check_status "Failed to enable Docker service on boot."

# Add the 'ec2-user' to the Docker group
echo "Adding 'ec2-user' to the Docker group..."
sudo usermod -aG docker ec2-user
check_status "Failed to add 'ec2-user' to the Docker group."

# Success message and prompt to log out and back in
echo "Docker installation completed successfully."
echo "Please log out and log back in to apply Docker group changes for 'ec2-user'."

# Exit the script
exit 0
