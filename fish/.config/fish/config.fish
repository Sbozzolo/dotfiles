# Install fisher
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

## Aliases

alias l 'll'
alias md 'mkdir -p'
alias .. 'cd ..'
alias ... 'cd ../..'


# Generate aliases for remote servers from the .ssh/config
set remote_aliases_file "$XDG_CONFIG_HOME//fish/conf.d/remote_aliases.fish"
if not test -f "$remote_aliases_file"
    awk '/Host / {print "alias", $2, "\"ssh", $2"\""}' "$HOME/.ssh/config" > "$remote_aliases_file"
    echo "$remote_aliases_file generated"
    source "$remote_aliases_file"
end

## Vterm

function vterm_printf;
    if [ -n "$TMUX" ]
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

function vterm_prompt_end;
    vterm_printf '51;A'(whoami)'@'(hostname)':'(pwd)
end

functions -c fish_prompt vterm_old_fish_prompt

function fish_prompt --description 'Write out the prompt; do not replace this. Instead, put this at end of your file.'
    # Remove the trailing newline from the original prompt. This is done
    # using the string builtin from fish, but to make sure any escape codes
    # are correctly interpreted, use %b for printf.
    printf "%b" (string join "\n" (vterm_old_fish_prompt))
    vterm_prompt_end
end

function fish_title
    hostname
    echo ":"
    pwd
end

## Look

# Change color in the pure theme so that it is readable with Solarized
set -U pure_color_mute green

# Solarized theme (form fish_config)
set -U fish_color_autosuggestion 586e75
set -U fish_color_cancel -r
set -U fish_color_command 93a1a1
set -U fish_color_comment 586e75
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end 268bd2
set -U fish_color_error dc322f
set -U fish_color_escape 00a6b2
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator 00a6b2
set -U fish_color_param 839496
set -U fish_color_quote 87d7ff
set -U fish_color_redirection 6c71c4
set -U fish_color_search_match 'bryellow'  '--background=black'
set -U fish_color_selection 'white'  '--bold'  '--background=brblack'
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
