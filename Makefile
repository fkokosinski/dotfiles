STOW_SYMLINKS += less

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
