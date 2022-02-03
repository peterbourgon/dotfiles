function coln --description "Take whitespace-delimited columns from each line of input"
	set prefixed (string replace --regex '^(.*)$' '\$$$1' $argv)
	set pattern  (string join ', ' $prefixed)
	awk '{print '$pattern'}'
end
