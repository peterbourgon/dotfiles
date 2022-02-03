function randhex --description "Generate random hex strings"
	argparse 'h/help' 'n/newline' -- $argv
	or return

	if set -q _flag_help
		echo "randhex - print random hex characters"
		echo ""
		echo "USAGE"
		echo "  randhex          Emit a stream of random hex characters"
		echo "  randhex COUNT    Print COUNT random hex characters"
		echo "  randhex MIN MAX  Print between MIN and MAX random hex characters"
		echo ""
		echo "FLAGS"
		echo "  -n, --newline  emit a newline at the end of output"
		echo ""
		return 0
	end

	switch (count $argv)
		case 0
			hexdump -v -e '"%x"' /dev/urandom
		case 1
			hexdump -v -e '"%x"' /dev/urandom | head -c $argv[1]
		case '*'
			hexdump -v -e '"%x"' /dev/urandom | head -c (randint $argv[1] $argv[2])
	end

	if set -q _flag_n
		echo
	end
end
