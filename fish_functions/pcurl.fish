function pcurl
	curl --silent --show-error --verbose $argv 3>&1 1>&2 2>&3 | rg '(^(<|>))'
end
