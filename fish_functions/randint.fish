function randint --description "Generate random integers"
	argparse 'h/help' 'r/right-pad' 'z/zero-pad' -- $argv
	or return

	if set -q _flag_help
		echo "randint - print a random integer"
		echo ""
		echo "USAGE"
		echo "  randint [flags]          Print a random integer between 0 and 32768"
		echo "  randint [flags] MAX      Print a random integer between 0 and MAX"
		echo "  randint [flags] MIN MAX  Print a random integer between MIN and MAX"
		echo ""
		echo "FLAGS"
		echo "  -r, --right-pad  right-pad numbers"
		echo "  -z, --zero-pad   zero-pad numbers"
		echo ""
		return 0
	end

	set min 0
	set max 32768
	switch (count $argv)
		case 1
			set max $argv[1]
		case 2
			set min $argv[1]
			set max $argv[2]
	end


	if set -q _flag_r
		set format (string join '' "%" (string length $max) "d\n")
	else if set -q _flag_z
		set format (string join '' "%0" (string length $max) "d\n")
	else
		set format "%d\n"
	end

	set d (math $max - $min)
	set r (hexdump -v -e '"%u"' -n 4 /dev/urandom) % $d

	printf $format (math $min + $r)
end
