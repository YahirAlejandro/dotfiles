# Install packages that'll be using probably
# TODO validate that these are installed. Fresh Ubuntu lacks curl for some reason and will fuck this up.
echo "This will install and configure the ZSH shell."

sudo apt install zsh fonts-powerline guake curl wget tree htop git -y

# Get Oh-My-Zsh with a nasty shell piping!
echo "[ZSH BOOTSTRAP] Fetching and installing Oh-My-Zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get PowerLevel
echo "[ZSH BOOTSTRAP] Cloning PowerLevel9k into the themes folder"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Replace default theme
echo "[ZSH BOOTSTRAP] Replacing the default theme for now"
echo "[ZSH BOOTSTRAP] Later, this will be overwritting it with this repo custom ~/.zshrc file"
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel9k\/powerlevel9k"/' ~/.zshrc

# Get the theme's fonts
echo "[ZSH BOOTSTRAP] Getting the Poweline Symbols OTF..."
wget -P ~/ https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
echo "[ZSH BOOTSTRAP] Getting the OTF configuration file..."
wget -P ~/ https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# Makes fonts things
echo "[ZSH BOOTSTRAP] << SUDO ahead! >>: Copying symbols into system-wide directory"
sudo mv ~/PowerlineSymbols.otf /usr/local/share/fonts/
if [ ! -d ~/.config/fontconfig/conf.d ]; then
    echo "[ZSH BOOTSTRAP] No local ~/.config directory, creating it..."
    mkdir -p ~/.config/fontconfig/conf.d
fi
echo "[ZSH BOOTSTRAP] Moving the symbols configuration into ~/.config"
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
#fc-cache -vf ~/.local/share/fonts/

echo "[ZSH BOOTSTRAP] The following two aren't necessary, however, I won't do it later so..."

# Install Awesome-fonts
echo "[ZSH BOOTSTRAP] Installing Awesome-Fonts"
echo "Cloning repo..."
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git ~/awesome-terminal-fonts

echo "[ZSH BOOTSTRAP] Copying build scripts into system-wide directory"
sudo cp -R ~/awesome-terminal-fonts/build /usr/local/share/fonts

if [ ! -d ~/.config ]; then
    echo "No local ~/.config directory found, creating it..."
    mkdir ~/.config
else
    echo "There is a local ~/.config directory!"
fi

echo "[ZSH BOOTSTRAP] You can now use Awesome fonts with Powerline: "
echo "Default terminal font will be used."
echo "To personalize, remember to change it at ~/.config/fontconfig/conf.d/10-symbols.conf"
cp ~/awesome-terminal-fonts/config/10-symbols.conf ~/.config/fontconfig/conf.d

echo "All set! Removing cloned repo from $HOME"
rm -rf ~/awesome-terminal-fonts
echo "WARNING: No sourcing is made here since it should have been included in the hardcoded .zshrc file in the repo!"
echo "IF NOT, use: $ echo 'source ~/.fonts/*.sh' >> ~/.zshrc"

# Install Nerd Fonts "Hack"
echo "[ZSH BOOTSTRAP] Installing Nerd Fonts \"Hack\""
echo "[ZSH BOOTSTRAP] Downloading TTF"
wget -P ~/ https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
echo "[ZSH BOOTSTRAP] Unzipping into /usr/local/share/fonts"
sudo unzip ~/Hack-v3.003-ttf.zip -d /usr/local/share/fonts
echo "[ZSH BOOTSTRAP] Running font caching, this might take a while and might look stale, let it run..."
sudo fc-cache -fv /usr/local/share/fonts

# Install Oh-My-Zsh plugins
echo "[ZSH BOOTSTRAP] Will install ZSH plugins..."

# Syntax highlighting
echo "[ZSH BOOTSTRAP] Installing syntax highlighter for ZSH"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Autocompletion
echo "[ZSH BOOTSTRAP] Installing cool autocompleter for ZSH"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# If profile file don't exists, create it and execute zsh
if [ ! -f ~/.profile ]; then
    touch ~/.profile
    echo "exec zsh" >> ~/.profile
fi

# Copy ZSH config
echo "[ZSH BOOTSTRAP] Now set the custom zshrc file from this repo!"
cp -f .zshrc ~/.zshrc

# Change shell for me (sometimes it doesn't work dunno why)
echo "[ZSH BOOTSTRAP] Setting zsh as default shell"
sudo chsh -s $(which zsh) $USER

# Apply!
source ~/.profile

# Let's go
zsh
