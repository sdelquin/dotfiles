cat ~/.dotfiles/common/starship.toml | perl -pe 's/(truncation_length) *= (.*)/$1 = 3/' > /tmp/starship.toml
export STARSHIP_CONFIG=/tmp/starship.toml
