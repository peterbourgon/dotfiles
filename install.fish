#!/usr/bin/env fish

mkdir -p $HOME/.config/fish

for f in fish/*
	rm -f $HOME/.config/fish/(basename $f)
	ln -s $PWD/$f $HOME/.config/fish/(basename $f)
end

mkdir -p $HOME/.config/fish/functions

for f in fish_functions/*
	rm -f $HOME/.config/fish/functions/(basename $f)
	ln -s $PWD/$f $HOME/.config/fish/functions/(basename $f)
end

mkdir -p $HOME/.config/fish/env

for f in fish_env/*
	rm -f $HOME/.config/fish/env/(basename $f)
	ln -s $PWD/$f $HOME/.config/fish/env/(basename $f)
end

mkdir -p $HOME/bin

for f in bin/*
	rm -f $HOME/bin/(basename $f)
	ln -s $PWD/$f $HOME/bin/(basename $f)
end

rm -f $HOME/.gitconfig
ln -s $PWD/gitconfig $HOME/.gitconfig

rm -f $HOME/.vimrc
ln -s $PWD/vimrc $HOME/.vimrc

rm -f $HOME/.tmux.conf
ln -s $PWD/tmux.conf $HOME/.tmux.conf

if [ (uname) = "Darwin" ]
	if test ! -d "$HOME/Library/Application Support/Code/User"
		mkdir -p "$HOME/Library/Application Support/Code/User"
	end
	rm -f "$HOME/Library/Application Support/Code/User/settings.json"
	ln -s $PWD/vscode-settings.json "$HOME/Library/Application Support/Code/User/settings.json"
end
