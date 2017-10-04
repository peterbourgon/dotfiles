function godepz -d "list all deps for argv, and their import path"
	go list -f '{{join .Deps "\n"}}' $argv | xargs go list -f '{{if not .Standard}}{{.ImportPath}} {{.Dir}}{{end}}' | column -t
end

