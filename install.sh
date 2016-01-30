#!/bin/sh

LinkWithBak()
{
	mv "$VIMRC" "$VIMBAK" 
	ln -sf "$VIMNEW" "$VIMRC" 
	echo "the vimrc has been successfully linked"
}

exists()
{
	type -t $1 > /dev/null 2>& 1
}

brewInstall()
{
	brew install $1
}

DOTDIR="$PWD"
echo "dotFiles: root dir is $DOTDIR"


#1.vim installation
VIMNEW="$DOTDIR/vim/.vimrc"
VIMRC="$HOME/.vimrc"
VIMBAK=$VIMRC.orig

#1.1.check if there is a bak rc file && the VIMRC is already a symbolic link file
#if so,ask if continue or skip
if ! [ -L "$VIMRC" ] && ! [ -a "$VIMBAK" ]
then 	
	LinkWithBak
else
	if [ -L "$VIMRC" ] 
	then echo "the $VIMRC is already been linkded"
	fi
	if [ -a "$VIMBAK" ] 
	then echo "the $VIMBAK already exists" 
	fi
	echo "if replace $VIMRC && $VIMBAK ? [y/n]"
	read next
	case next in
		y | yes | Y | YES )
			LinkWithBak
			;;
		n | no | N | NO )
			echo "$VIMRC && $VIMBAK will not be replaced."
			;;
		* )
			echo "invalid input...will not be replaces."
	esac
fi
#1.2.Vundle Plungin Installation
echo "installing Plugins by Vundle..."
vim +PluginInstall +qall
echo "the vim dotFiles has been successfully installed...\ncontinue next part..."

#2.install homebrew for mac
echo "installing homebrew for mac..."
HOMEBREW="/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)""
case OSTYPE in
	*darwin*)
		if exists brew ; then
			echo "homebrew is already installed!"
		else
			if exists ruby ; then
				$HOMEBREW
			else
				echo "ruby is not installed!"
			fi
		fi
		;;
	*)
		;;
esac


#3.zsh installation
echo "installing zsh && oh-my-zsh"
ZSH="sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)""
ZSHRC="$HOME/.zshrc"
ZSHNEW="./zsh/.zshrc"
LinkZSH()
{
		if ! exists zsh ; then
			$ZSH
		fi
		if [ -L $ZSHRC ] ; then
			echo "zsh is already installed!"
		else
			mv $ZSHRC $ZSHRC.orig
			ln -sf $ZSHNEW $ZSHRC
			echo "$ZSHRC is successfully linked."
		fi
}
case $OSTYPE in
	*darwin*)
		#need to update vim version && set alias
		LinkZSH
		;;
	*linux*)
		LinkZSH
		;;
	*)
		echo "wrong system version!"
		;;
esac





