function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
	if test "$PWD" != "$HOME"
		printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
	else
		echo '~'
	end
end


