alias vi="nvim"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias phpswitch="sudo update-alternatives --config php"
alias start_ssh='eval "$(ssh-agent -s)" && ssh-add'
alias vimode='set -o vi'
alias btc='sudo bluetoothctl connect 98:47:44:7C:84:EF && bluetoothctl info | grep "Battery"'

ffg() {
  local dir="${1:-.}" # Default to current directory if no argument is given
  cd "$dir" || return # Change directory, exit if it fails

  # Define an array of exclusion patterns
  local exclude_patterns=(
    "node_modules"
    "vendor"
    "/var/log"
    "/tmp/"
    "/usr/"
    "/run/"
    "/sys/"
    "/opt/"
    "/snap/"
    "/boot/"
    "/var/cache"
    "/var/crash"
    "/var/snap"
    "/var/lib"
    "/var/spool"
    "Android/Sdk"
    ".*"
    "$HOME/snap"
    "$HOME/Android/"
    "$HOME/.*"
    "$HOME/workspace"
    "/proc"
    "/etc"
    "build"
    "dist"
    "coverage"
    ".git"
    ".vscode"
    ".idea"
    "*.swp"
    "*.bak"
    "*.log.*" # Exclude rotated logs
    "*.gz"
    "*.zip"
    "*.tar.gz"
    "*.tgz"
    "*.rar"
    "*.7z"
    ".DS_Store"
    "Thumbs.db"
    "/dev"
  )

  # Create the exclusion arguments for fdfind from the array
  local exclude_args=()
  for pattern in "${exclude_patterns[@]}"; do
    exclude_args+=(--exclude "$pattern")
  done

  local file
  # Use fzf with Git-aware file listing (respects .gitignore if inside a Git repo)
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    file=$(git ls-files --cached --others --exclude-standard | fzf)
  else
    file=$(fdfind --hidden "${exclude_args[@]}" | fzf)
  fi

  # Exit if no file or directory was selected
  if [[ -z "$file" ]]; then
    echo "No file or directory selected, exiting."
    return # Exit the function without doing anything
  fi

  # If the selected item is a directory, change into it
  if [[ -d "$file" ]]; then
    cd "$file" || return
    echo "Changed directory to $file"
    return # Exit the function after changing the directory
  fi

  # If it's a file, open it in vim
  vim "$file"
}

ff() {
  vim $(fzf)
}
