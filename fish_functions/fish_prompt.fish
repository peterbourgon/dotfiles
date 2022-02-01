set -g __fish_git_prompt_show_informative_status 'yes'
set -g __fish_git_prompt_char_stateseparator     ''
set -g __fish_git_prompt_char_cleanstate         ''
set -g __fish_git_prompt_char_upstream_ahead     ' ⬈'
set -g __fish_git_prompt_char_upstream_behind    ' ⬋'
set -g __fish_git_prompt_char_dirtystate         ' *'
set -g __fish_git_prompt_char_stagedstate        ' ·'
set -g __fish_git_prompt_char_untrackedfiles     ' :'

function fish_prompt
	if fish_is_root_user ; set_color red ; end
	printf '%s ' (hostname|cut -d . -f 1)
	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal
	printf '%s ' (__fish_git_prompt)
end

