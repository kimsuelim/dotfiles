eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -d ~/.local ]; then
  for script (~/.local/*) source "$script"
fi
