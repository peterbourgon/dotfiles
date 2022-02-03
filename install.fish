#!/usr/bin/env fish

mkdir -p $HOME/.config/fish

set basedir (realpath (dirname (status --current-filename)))

for f in $basedir/fish/*
	rm -f $HOME/.config/fish/(basename $f)
	ln -s $f $HOME/.config/fish/(basename $f)
end

mkdir -p $HOME/.config/fish/functions

for f in $basedir/fish_functions/*
	rm -f $HOME/.config/fish/functions/(basename $f)
	ln -s $f $HOME/.config/fish/functions/(basename $f)
end

mkdir -p $HOME/.config/fish/env

for f in $basedir/fish_env/*
	rm -f $HOME/.config/fish/env/(basename $f)
	ln -s $f $HOME/.config/fish/env/(basename $f)
end

mkdir -p $HOME/bin

for f in $basedir/bin/*
	rm -f $HOME/bin/(basename $f)
	ln -s $f $HOME/bin/(basename $f)
end

rm -f $HOME/.gitconfig
ln -s $basedir/gitconfig $HOME/.gitconfig

rm -f $HOME/.vimrc
ln -s $basedir/vimrc $HOME/.vimrc

rm -f $HOME/.tmux.conf
ln -s $basedir/tmux.conf $HOME/.tmux.conf

if [ (uname) = "Darwin" ]
	if test ! -d "$HOME/Library/Application Support/Code/User"
		mkdir -p "$HOME/Library/Application Support/Code/User"
	end
	rm -f "$HOME/Library/Application Support/Code/User/settings.json"
	ln -s $basedir/vscode-settings.json "$HOME/Library/Application Support/Code/User/settings.json"
	rm -f "$HOME/Library/Application Support/Code/User/tasks.json"
	ln -s $basedir/vscode-tasks.json "$HOME/Library/Application Support/Code/User/tasks.json"
	rm -f "$HOME/Library/Application Support/Code/User/keybindings.json"
	ln -s $basedir/vscode-keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
end
