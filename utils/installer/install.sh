#!bin/sh

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

moveoldnvim() {
	echo "Not installing LunarVim"
	echo "Please move your ~/.config/nvim folder before installing"
	exit
}

#
# Install Alacritty + OhMyZsh + Tmux
#
installohmyzshfedora() {
	sudo dnf install zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
installohmyzsharch() {
	sudo pacman -S zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
installohmyzsh() {
	echo "Installing Oh My Zsh..."
	# [ "$(uname)" == "Darwin" ] && installohmyzshmac
	# [ -n "$(uname -a | grep Ubuntu)" ] && installohmyzshubuntu
	[ -f "/etc/arch-release" ] && installohmyzsharch
	[ -f "/etc/fedora-release" ] && installohmyzshfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}
asktoinstallohmyzsh() {
	echo "Oh My Zsh not found"
	echo -n "Would you like to install Oh My Zsh now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installohmyzsh
}

installalacrittyfedora() {
	sudo dnf install cmake
	sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel g++
	cargo install alacritty
	sudo ln -s ~/.cargo/bin/alacritty /usr/bin/alacritty
	cd
	curl -O https://raw.githubusercontent.com/tk8226/VimVW/main/utils/installer/.alacritty.yml
	cp  ~/.alacritty.yml .
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .
	echo 'set-option -g default-shell /bin/zsh' >> ~/.tmux.conf.local
}
installalacrittyarch() {
	echo "Alacritty intalled by manual"
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local .
	echo 'set-option -g default-shell /bin/zsh' >> ~/.tmux.conf.local
}
installalacritty() {
	echo "Installing Alacritty..."
	# [ "$(uname)" == "Darwin" ] && installalacrittymac
	# [ -n "$(uname -a | grep Ubuntu)" ] && installalacrittyubuntu
	[ -f "/etc/fedora-release" ] && installalacrittyfedora
	[ -f "/etc/arch-release" ] && installalacrittyarch
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}
asktoinstallalacritty() {
	echo "Alacritty not found"
	echo -n "Would you like to install Alacritty now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installalacritty
}

#
# Install Node + NPM + Yarn
#
installnodemac() {
	brew install lua
	brew install node
	brew install yarn
}
installnodeubuntu() {
	sudo apt install nodejs
	sudo apt install npm
}
installnodefedora() {
    sudo dnf install -y nodejs 
    sudo dnf install -y npm
}
installnodearch() {
	sudo pacman -S nodejs
	sudo pacman -S npm
}
installnode() {
	echo "Installing node..."
	[ "$(uname)" == "Darwin" ] && installnodemac
	[ -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
	[ -f "/etc/fedora-release" ] && installnodefedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}
asktoinstallnode() {
	echo "node not found"
	echo -n "Would you like to install node now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnode
}

installyarn() {
	echo "Installing yarn..."
	sudo npm install --global yarn
}
asktoinstallyarn() {
	echo "yarn not found"
	echo -n "Would you like to install yarn now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installyarn
}

#
# Install Pip3
#
installpiponmac() {
	sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
}
installpiponubuntu() {
	sudo apt install python3-pip >/dev/null
}
installpiponfedora() {
	sudo dnf install -y pip >/dev/nul
}
installpiponarch() {
	pacman -S python-pip
}
installpip() {
	echo "Installing pip..."
	[ "$(uname)" == "Darwin" ] && installpiponmac
	[ -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
	[ -f "/etc/fedora-release" ] && installpiponfedora
	[ -f "/etc/arch-release" ] && installpiponarch
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}
returnifnotinstallpip3(){
	echo "Please install pip3 before continuing with install"
	exit
}
asktoinstallpip() {
	echo "pip not found"
	echo -n "Would you like to install pip now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installpip || returnifnotinstallpip3
	
}

installpynvim() {
	echo "Installing pynvim..."
	pip3 install pynvim --user
}


#
# Install NeoVim Nightly
#

installsupportneovimfedora() {
	sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext
}
installsupportneovimarch() {
	sudo pacman -S base-devel cmake unzip ninja tree-sitter
}
installneovimnightlyall() {
	cd ~
	sudo rm -rf neovim
	git clone https://github.com/neovim/neovim
	cd neovim
	sudo make CMAKE_BUILD_TYPE=Release install
	cd ~
	sudo rm -rf neovim

	echo 'alias n="nvim"' >> ~/.zshrc
	
	# install extra packages
	installextrapackages
}
installneovimnightly() {
	echo "Installing node..."
	# [ "$(uname)" == "Darwin" ] && installnodemac
	# [ -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
	[ -f "/etc/fedora-release" ] && installsupportneovimfedora
	[ -f "/etc/arch-release" ] && installsupportneovimarch
	installneovimnightlyall
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}
asktoinstallneovimnightly() {
	echo "NeoVim Nightly not found"
	echo -n "Would you like to install NeoVim Nightly (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installneovimnightly
}

#
# Install Packer NVim
#
installpacker() {
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

#
# Install Formatters And Linters
#
installformattersandlinters() {
	pip3 install --user flake8
	pip3 install --user yapfsystemctl hibernate
	sudo yarn global add prettier
}
asktoinstallformatterandlinters(){
	echo "Formatter And Linters not found"
	echo -n "Would you like to install Formatter And Linters (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installformattersandlinters
}

cloneconfig() {
	echo "Cloning VimVW configuration"
	git clone https://github.com/tk8226/vimvw.git ~/.config/nvim
	# mv $HOME/.config/nvim/init.lua $HOME/.config/nvim/init.lua.tmp
	# mv $HOME/.config/nvim/utils/init.lua $HOME/.config/nvim/init.lua
	nvim -u $HOME/.config/nvim/init.lua +PackerInstall
	# rm $HOME/.config/nvim/init.lua
	# mv $HOME/.config/nvim/init.lua.tmp $HOME/.config/nvim/init.lua
}





pipinstallueberzug() {
	which pip3 >/dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
}

installonmac() {
	brew install ripgrep fzf ranger
	npm install -g tree-sitter-cli
}

installonubuntu() {
	sudo apt install ripgrep fzf ranger
	sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev
	pip3 install ueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}

installonfedora() {
    sudo dnf groupinstall "X Software Development"
    sudo dnf install -y fzf ripgrep ranger
    pip3 install wheel ueberzug
}

installonarch() {
	sudo pacman -S ripgrep fzf ranger
	sudo pacman -S ueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}

installextrapackages() {
	[ "$(uname)" == "Darwin" ] && installonmac
	[ -n "$(uname -a | grep Ubuntu)" ] && installonubuntu
	[ -f "/etc/fedora-release" ] && installonfedora
	[ -f "/etc/arch-release" ] && installonarch
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

# Welcome
echo 'Installing VimVW'

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveoldnvim

# install ohmyzsh
which zsh >/dev/null && echo "Oh My Zsh installed, moving on..." || asktoinstallohmyzsh

# install alacritty
which alacritty >/dev/null && echo "Alacritty installed, moving on..." || asktoinstallalacritty

# install pip
which pip3 >/dev/null && echo "pip installed, moving on..." || asktoinstallpip

# install pynvim
pip3 list | grep pynvim >/dev/null && echo "pynvim installed, moving on..." || installpynvim

# install node and neovim support
which node >/dev/null && echo "node installed, moving on..." || asktoinstallnode


# install yarn and neovim support
which yarn >/dev/null && echo "yarn installed, moving on..." || asktoinstallyarn

# install neovim nightly
which nvim >/dev/null && echo "NeoVim Nightly installed, moving on..." || asktoinstallneovimnightly

# install formatters and linters
# asktoinstallformatterandlinters

if [ -a "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	echo 'packer already installed'
else
	installpacker
fi

if [ -a "$HOME/.config/nvim/init.lua" ]; then
	echo 'nvcode already installed'
else
	# clone config down
	cloneconfig
	# echo 'export PATH=$HOME/.config/nvim/utils/bin:$PATH' >>~/.zshrc
	# echo 'export PATH=$HOME/.config/nvcode/utils/bin:$PATH' >>~/.bashrc
fi

echo "I recommend you also install and activate a font from here: https://github.com/ryanoasis/nerd-fonts"

# echo "I also recommend you add 'set preview_images_method ueberzug' to ~/.config/ranger/rc.conf"

# echo 'export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH appending to zshrc/bashrc'/
