# Install packages that'll be using probably
# TODO validate that these are installed. Fresh Ubuntu lacks curl for some reason and will fuck this up.
sudo apt install zsh git fonts-powerline guake curl -y

# Get Oh-My-Zsh with a nasty shell piping!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get PowerLevel
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Replace default theme
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"/' ~/.zshrc

# Get the theme's fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf

# Looks like an important config file but dunno what this fuckery does tbh
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# Makes fonts things
mkdir -p ~/.local/share/fonts/ && mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# If profile file don't exists, create it and execute zsh
if [ ! -f ~/.profile ]; then
    touch ~/.profile
    echo "exec zsh" >> ~/.profile
fi

# Change shell for me
sudo chsh -s $(which zsh) $USER

# Apply!
source ~/.profile
