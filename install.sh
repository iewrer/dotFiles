#!/bin/sh
DOTDIR="$PWD"
echo "dotFiles: root dir is $DOTDIR"


#1.vim installation
VIMNEW="$DOTDIR/vim/.vimrc"
VIMRC="$HOME/.vimrc"
VIMBAK=$VIMRC.orig

LinkWithBak()
{
	mv "$VIMRC" "$VIMBAK" 
	ln -sf "$VIMNEW" "$VIMRC" 
	echo "the vimrc has been successfully linked"
}
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
	esac
fi
#1.2.Vundle Plungin Installation
echo "installing Plugins by Vundle..."
vim +PluginInstall +qall
echo "the vim dotFiles has been successfully installed...\ncontinue next part..."
