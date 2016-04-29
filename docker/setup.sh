#!/bin/bash
ln -sf .gdbinit.global ~/.gdbinit
ln -sf .gdbinit.regression /regression/regression/regression/.gdbinit
ln -sf .zshrc ~zshrc/.zshrc
ln -sf commands /regression/regression/regression/adserver/commands
source ~/.zshrc
