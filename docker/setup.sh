#!/bin/bash
DOT=/data/dotFiles
DOCKER=$DOT/docker
sh ./neobundle_install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $DOCKER/.gdbinit.global $HOME/.gdbinit
ln -sf $DOCKER/.gdbinit.regression /regression/regression/regression/.gdbinit
ln -sf $DOCKER/.zshrc $HOME/.zshrc
ln -sf $DOCKER/gdbcommands /regression/regression/regression/adserver/commands
ln -sf /code/ads/common/build/ads/server/ads /regression/regression/regression/adserver/ads
ln -sf /code/ads/common/build/ads/server/ads /regression/regression/regression/adserver_m/ads
ln -sf $DOT/vim/.vimrc $HOME/.vimrc
source $HOME/.zshrc
