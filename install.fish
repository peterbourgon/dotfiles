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

