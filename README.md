# .my-configuration
Holds my dotfiles configurations files :)

## Migrate to a new system

1. Install [oh my zsh](https://ohmyz.sh/#install). Remove `.zshrc` config file.

2. Clone this bare repository to your new computer.
> $ git clone --bare git@github.com:juliabirkett/.my-configuration.git $HOME/.my-configuration

3. Define the alias in the current shell. This alias is defined in `.zshrc` defined as [dotfiles_config](https://github.com/juliabirkett/.my-configuration/blob/master/.zshrc#L97) to refer to your bare repository.

> $ alias dotfiles_config='/usr/bin/git --git-dir=$HOME/.my-configuration/ --work-tree=$HOME'
 
3. Checkout the files (it works as any other git repository):

> $ dotfiles_config config --local status.showUntrackedFiles no
> 
> $ dotfiles_config checkout
> 
> $ dotfiles_config status


For further details, please refer to this [Atlassian's link](https://www.atlassian.com/git/tutorials/dotfiles) that inspired me (I hope it still exists).

## Tools installation

`brew install tmux git-delta fzf ripgrep`

### Vim
1. Install [minpac](https://github.com/k-takata/minpac) (package manager).
2. Open `vim`.
3. Type `:PackUpdate`.
4. To search files inside vim, [this](https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko) can be useful.

### Purity zsh theme
1. Install it
   > npm install --global purity-prompt
2. Add a symlink (can change if you're using nvm or brew to handle node versions)
   > ln -s ~/.asdf/installs/nodejs/20.17.0/lib/node_modules/purity-prompt/purity.zsh ~/.oh-my-zsh/custom/purity.zsh-theme
3. > source ~/.zshrc
4. Done!
---

Running Python tests with `vim-test` without showing huge logs (workaround):
1. `vim ~/.vim/pack/minpac/start/vim-test/autoload/test/python/pytest.vim`
2. Add `--show-capture=no` to [this line.](https://github.com/vim-test/vim-test/blob/master/autoload/test/python/pytest.vim#L52)
