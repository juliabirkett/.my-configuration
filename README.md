# .my-configuration
Holds my dotfiles configurations files :)

## Migrate to a new system

1. Clone this bare repository to your new computer.
> $ git clone --bare git@github.com:juliabirkett/.my-configuration.git $HOME/.my-configuration

2. Install [oh my zsh](https://ohmyz.sh/#install). It will move your `.zshrc` to `.zshrc.pre-oh-my-zsh` as a backup. We want to use the one we had, so move it back to `.zshrc`.
 
3. There's an alias in `.zshrc` defined as [dotfiles_config](https://github.com/juliabirkett/.my-configuration/blob/master/.zshrc#L97) to refer to your bare repository. It works as any other git repository:

> $ dotfiles_config checkout
> 
> $ dotfiles_config status
> 
> $ dotfiles_config config --local status.showUntrackedFiles no

For further details, please refer to this [Atlassian's link](https://www.atlassian.com/git/tutorials/dotfiles) that inspired me (I hope it still exists).

## Installation

### Tmux
`brew install tmux`

### Delta (pretty git diffs)
`brew install git-delta` 

### Vim
1. Install [minpac](https://github.com/k-takata/minpac) (package manager).
2. Open `vim`.
3. Type `:PackUpdate`.
4. To make vim's finder work, install `fzf` and `ripgrep`: `brew install fzf ripgrep`. [This](https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko) can help using the finder.

---

Running Python tests with `vim-test` without showing huge logs (workaround):
1. `vim ~/.vim/pack/minpac/start/vim-test/autoload/test/python/pytest.vim`
2. Add `--show-capture=no` to [this line.](https://github.com/vim-test/vim-test/blob/master/autoload/test/python/pytest.vim#L52)
