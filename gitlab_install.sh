sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl openssh-server tzdata
sudo apt update
sudo apt install curl debian-archive-keyring lsb-release ca-certificates apt-transport-https software-properties-common -y
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt update
# serch version with apt-cache madison gitlab-ce
sudo apt install gitlab-ce=16.11.2-ce.0
