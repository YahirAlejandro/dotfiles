# Custom CloudShell with ZSH

This is my personal setup for using Cloud Shell without creating a Docker image.

Is probably best to use the image since Cloud Shell gets recreated every *$RANDOM* time, so this executes everytime. Usually takes about 2 minutes to complete plus machine allocation on Google Cloud.

Is probably best to have the files versioned somewhere since Cloud Shell can eventually evict the machine and its persistence layer. Never happened to me but probably will and fuck that.

### Installation script

    cs_startup.sh

Doesn't matter where it is as long as `~/.profile` can find it.  (but maybe */usr/local* is a good place?)

 - Will work on Debian-based only
 - Installs zsh, oh-my-zsh and powerline fonts, for theming
 - Installs other uninteresting things too
 - Automatically pulls SpaceShip theme into the themes folder of ZSH
 - Replaces the theme line in ~/.zshrc
 - Since the replacement is a regular expression, commenting or modifying the line might bypass theme switching
 - **Hardcoded the username when changing shell** (`chsh`) because some reason I don't remember, however, this repo will contain a variable that might not work so me from the future might want to check that part ;)

### Shell switching
	.profile 
The `~/.profile` file will check whether zsh is installed or not. If it is, will execute zsh to swith from the default shell, if not, will run the aforementioned, underdocumented installation script.

### Oh-My-ZSH configuration
	.zshrc
Since everything is preconfigured, the `~/.zshrc` file should be downloaded in order to keep everything customized.
I did some changes that **did not added to the installation script** and **will do someday**. Following are the commands to install the two remaining ZSH plugins that are dope AF.
#### 1. zsh-syntax-highlighting
Turns red if you're typing the command wrong and green when you've unfucked it.

	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#### 2. zsh-autosuggestions
Suggests results without having to press `TAB` and looks kinda cool. Also arrowing -> completes the command.

	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
