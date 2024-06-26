STOW_SYMLINKS += foot
STOW_SYMLINKS += gdb
STOW_SYMLINKS += i3-gaps
STOW_SYMLINKS += less
STOW_SYMLINKS += neovim
STOW_SYMLINKS += polybar
STOW_SYMLINKS += ranger
STOW_SYMLINKS += readline
STOW_SYMLINKS += redshift
STOW_SYMLINKS += scripts
STOW_SYMLINKS += sway
STOW_SYMLINKS += x11
STOW_SYMLINKS += zathura
STOW_SYMLINKS += zsh

all: $(STOW_SYMLINKS) $(HOME)/.less

# create symlinks for all dotfiles with stow
$(STOW_SYMLINKS): %:
	stow $*

# generate .less binary with lesskey
$(HOME)/.less: less/.lesskey
	lesskey

clean:
	stow -D $(STOW_SYMLINKS)

.PHONY: all clean $(STOW_SYMLINKS)
