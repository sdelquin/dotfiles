# Personalización del prompt
# La configuración está en ~/.dotfiles/common/starship.toml
show_newline() {
    # https://bit.ly/4dCTtVC
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}
PROMPT_COMMAND="show_newline"
if [ -n "$TEACHING" ]; then
    source $DOTFILES/common/shortprompt.sh
fi
eval "$(starship init bash)"
