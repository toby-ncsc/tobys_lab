#! /bin/sh
echo "--- Starting instance bootstrap ---"
echo "Updating"
sudo apt-get update
echo "adding docker repo"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
echo "updating"
sudo apt-get update -y
echo "Installing docker ce"
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
sudo su - ${USER}
echo "Testing docker"
docker run hello-world