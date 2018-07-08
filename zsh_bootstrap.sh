sudo apt install zsh git fonts-powerline guake -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"/' ~/.zshrc

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.local/share/fonts/ && mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

if [ ! -f ~/.profile ]; then
    touch ~/.profile
    echo "exec zsh" >> ~/.profile
fi
sudo chsh -s $(which zsh) $USER

source ~/.profile
