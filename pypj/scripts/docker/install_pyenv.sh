#!/bin/sh

pyenv_root="$HOME/.pyenv"
if [ "$1" != "" ]; then
    pyenv_root="$1/.pyenv"
fi
rm -rf $pyenv_root
git clone https://github.com/yyuu/pyenv.git $pyenv_root
git clone https://github.com/yyuu/pyenv-virtualenv.git $pyenv_root/plugins/pyenv-virtualenv

bashrc='
# added follows by custom pyenv installer
# BEGIN #
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# END #
'

echo "$bashrc" >> $HOME/.bashrc
eval "$bashrc"
sh make_pyenv.sh lab
