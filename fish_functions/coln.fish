function coln --description 'Take whitespace-delimited columns from each line of input'
	set a (for c in $argv ; echo "\$$c" ; end)
	set b (string join ', ' $a)
	awk '{print '$b'}' | column -t
end
