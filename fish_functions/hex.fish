

function hex
	argparse 'h/help' 'd/decode' -- $argv
	or return

	if set -q _flag_help
		echo "hex - hex encode or decode"
		echo ""
		echo "USAGE"
		echo "  hex STRING        Hex encode STRING"
		echo "  hex -d HEXSTRING  Hex decode HEXSTRING"
		echo ""
		echo "FLAGS"
		echo "  -d, --decode  hex decode rather than encode"
		echo ""
		return 0
	end

	if set -q _flag_d
		echo "-d, --decode not supported"
		return 0
	end

	switch (count $argv)
		case 0
			od -A n -t x1 | tr -dC [:alnum:]

		case '*'
			echo -n $argv | od -A n -t x1 | tr -dC [:alnum:] | xargs echo
	end
end
