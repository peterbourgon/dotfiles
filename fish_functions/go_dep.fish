function go-dep-list
	go list -f '{{with .Module}}{{.Path}}{{end}}' -deps ./... | sort | uniq | xargs go mod why -m
end

function go-dep-graph
	echo "digraph G {"
	echo "	rankdir=LR;"
	echo "	node[shape=box];"
	go list -f '{{with .Module}}{{.Path}}{{end}}' -deps ./... | sort | uniq | while read d
		go mod why -m $d | rg -v '#' | string escape | sed -e 's/.*/"&"/' | string join ' -> ' | sed -e 's/.*/\t&;/'
	end
	echo "}"
end
