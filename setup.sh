#!/bin/zsh
#
# Assumes default Manjaro setup as a starting point.
#

ZSH_DONE=$1

if [ ! -n "$1" ]
	then
		echo "Starting from scratch..."
		echo "Setting zsh as default shell..."
		sudo chsh -s /bin/zsh $(whoami)

    yes | sudo pacman -S gnome-terminal tmux unzip rofi

		echo "Downloading oh-my-zsh and base16..."

    if [ ! -d $HOME/.oh-my-zsh ]
    then
        git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
		ln -s $HOME/.dotfiles/.oh-my-zsh/custom/themes/bullet-train.zsh-theme $HOME/.oh-my-zsh/custom/themes/
        sleep 2
    fi

    if [ ! -d $HOME/.config/base16-shell ]
    then
        git clone https://github.com/chriskempson/base16-shell $HOME/.config/base16-shell
        sleep 2
    fi

    echo "Installing fonts..."
    if [ ! -d $HOME/.fonts/iosevka ]
    then
        wget https://github.com/be5invis/Iosevka/releases/download/v2.2.0/02-iosevka-term-2.2.0.zip
        unzip 02-iosevka-term-2.2.0.zip -d iosevka
        mkdir -p $HOME/.fonts
        mv iosevka/ttf $HOME/.fonts/iosevka
        rm 02-iosevka-term-2.2.0.zip
        rm -r iosevka
        sleep 2
    fi

		if [ -f $HOME/.zshrc]
			then
				mv $HOME/.zshrc $HOME/.zshrc
		fi

		ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
		echo "Done!"
    echo "Restarting to install others..."
    sleep 2
		$HOME/.dotfiles/setup.sh "done"

else
		echo "Continuing installation..."
		echo "Setting up i3..."
		if [ -f $HOME/.i3/config ]
			then
				mv $HOME/.i3/config $HOME/.i3/config_backup
		fi
		if [ -f $HOME/.i3/i3status.conf ]
			then
				mv $HOME/.i3/i3status.conf $HOME/.i3/i3status.conf_backup
		fi

    mkdir -p $HOME/.config/polybar
    ln -s $HOME/.dotfiles/.config/polybar/config $HOME/.config/polybar/config
    
    mkdir -p $HOME/.config/alacritty
    ln -s $HOME/.dotfiles/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

		ln -s $HOME/.dotfiles/.i3rc $HOME/.i3/config
		ln -s $HOME/.dotfiles/.i3/i3status.conf $HOME/.i3/i3status.conf

    echo "Restarting i3..."
    sleep 2
		i3-msg restart
		echo "Done!"

		echo "Setting up Vim..."
		if [ -f $HOME/.vimrc ]
			then
				mv $HOME/.vimrc $HOME/.vimrc_backup
		fi
    mkdir -p $HOME/.backup

		ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
    echo "Installing Vundle..."
    if [ ! -d $HOME/.vim/bundle ]
    then
        mkdir -p $HOME/.vim/bundle
        git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
        vim -c 'VundleInstall'
		pkill vim
    fi
    echo "Done!"

		echo "Installing misc config files..."
		ln -s $HOME/.dotfiles/.dunstrc $HOME/.dunstrc
		ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
    ln -s $HOME/.dotfiles/.condarc $HOME/.condarc
		ln -s $HOME/.dotfiles/.profile $HOME/.profile
		ln -s $HOME/.dotfiles/.xinitrc $HOME/.xinitrc
		ln -s $HOME/.dotfiles/.Xresources $HOME/.Xresources

    ln -s $HOME/.dotfiles/.config/flake8 ~/.config/flake8
    ln -s $HOME/.dotfiles/.pylintrc ~/.pylintrc
    ln -s $HOME/.dotfiles/.hgrc ~/.hgrc
    ln -s $HOME/.dotfiles/.gitconfig ~/.gitconfig

fi
