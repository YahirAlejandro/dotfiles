MY_PATH="`dirname \"$0\"`"
echo "Looks like this machine doesn't have ZShell installed."
echo "This will automatically install those packages ot use Oh My ZSH!"
echo "This script belongs to $MY_PATH"

sudo apt install zsh git fonts-powerline nmap -y
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" &
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme &
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/' ~/.zshrc" &
sudo chsh -s $(which zsh) $USER
exec zsh
