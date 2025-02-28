# ===== Vim-like key binding =====
set -o vi
bindkey -v 
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward
bindkey -M viins 'jk' vi-cmd-mode
