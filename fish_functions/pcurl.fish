function pcurl
	begin
		curl --silent --show-error --verbose $argv 2>| rg --color=never '^(<|>) [^\r]' >&2
	end >| cat
end
