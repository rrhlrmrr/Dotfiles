ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

## Install FZF
zi ice from"gh-r" as"program"
zi light junegunn/fzf
eval "$(fzf --zsh)"

## Install mise
zi ice from"gh-r" as"program" mv"mise* -> mise"
zi light jdx/mise

## Install asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export PATH="$HOME/.asdf/shims:$PATH"

## Install Homebrew
export PATH=/opt/homebrew/bin:$PATH
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
