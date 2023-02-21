##!/bin/zsh

# get updates
sudo apt update && sudo apt upgrade -y

# set up ssh keys
# mkdir ~/.ssh
# cp /mnt/c/Users/thiss/Downloads/id_* ~/.ssh/
# cp /mnt/c/Users/thiss/Downloads/*.pem ~/
# chmod 700 ~/.ssh
# chmod 644 ~/.ssh/*.pub
# chmod 600 ~/.ssh/id_rsa
# chmod 400 ~/*.pem

# install zsh plugins
git clone git@github.com:zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone git@github.com:marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git@github.com:changyuheng/zsh-interactive-cd.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-interactive-cd

# install fzf required for interactive-cd
sudo apt install fzf -y

# update zsh plugin list
sed -i 's/plugins=(git)/plugins=(\ncolored-man-pages\ncolorize\ndocker\ngit\nnpm\nnvm\nsudo\nzsh-autosuggestions\nzsh-interactive-cd\nzsh-syntax-highlighting\n)/g' ~/.zshrc

# set git global config
git config --global user.name "Narendra"
git config --global user.email "narengupta84@gmail.com"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# install node
nvm install 12.11.1

# install docker
sudo apt update
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

# install docker-compose
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# start docker daemon on start
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# make sure everything configured correctly
docker run hello-world


# clone work projects
mkdir -p ~/everything/code/work/jagota && cd ~/everything/code/work/jagota
git clone git@github.com:jagota/crm.git
git clone git@github.com:jagota/jagota-node-api.git
git clone git@github.com:jagota/Product-Mapping.git
git clone git@github.com:jagota/eLogistic-driver-pwa.git
git clone git@github.com:jagota/Customer-Portal.git
git clone git@github.com:jagota/logiliteadmin.git
git clone git@github.com:JagotaCRMPWA/api.git
git clone git@github.com:JagotaCRMPWA/frontend.git
git clone git@github.com:JagotaCRMPWA/postmancolllection.git
cd ~narendra

