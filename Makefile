STOW_SYMLINKS := $(shell find -mindepth 1 -maxdepth 1 -type d -not -path '*/.*' -exec basename {} \;)

all: $(STOW_SYMLINKS)

# create symlinks for all dotfiles with stow
$(STOW_SYMLINKS): %:
	stow $*

clean:
	stow -D $(STOW_SYMLINKS)

.PHONY: all clean $(STOW_SYMLINKS)
