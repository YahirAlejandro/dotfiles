MY_PATH="`dirname \"$0\"`"
MY_ZSHRC="/home/$USER/.zshrc"
ZSH_THEMES_FOLDER="/home/$USER/.oh_my_zsh/custom"

echo "Looks like this machine doesn't have ZShell installed."
echo "This will automatically install those packages ot use Oh My ZSH!"
echo "This script belongs to $MY_PATH"
echo "I fixed it so no need to restart the shell anymore! :)"

echo "-- Terraform: Terraforming..."
sudo cp ~/terraform/terraform /usr/local/bin

echo "Installing software packages: zsh, git, fonts-powerline, nmap, kubectl"
sudo apt install zsh git fonts-powerline nmap apt-transport-https -y

# install kubectl and kubernetes shit
echo "-- Kubernetes: Installing newest kubectl, krew and rbac-lookup..."
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl
echo "alias k8s="/usr/bin/kubectl"" >> $MY_ZSHRC

# install krew
bash $MY_PATH/krew.sh
echo "export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"" >> $MY_ZSHRC

# install rbac-lookup
/usr/bin/kubectl krew install rbac-lookup
echo "alias rbaclookup="/usr/bin/kubectl rbac-lookup"" >> $MY_ZSHRC

echo "-- OhMyZSH: Installing ZSH fonts and theme"
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_THEMES_FOLDER/themes/spaceship-prompt" &
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_THEMES_FOLDER/themes/spaceship.zsh-theme" &
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/' ~/.zshrc &
sudo chsh -s $(which zsh) $USER

echo "Going into ZSH..."
exec zsh
