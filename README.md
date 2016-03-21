# Vimrc

Referring to the project [spf13-vim](https://github.com/spf13/spf13-vim), I create this vimrc. It is pretty simple. So you can easily modify this vimrc for your like.

# Installation

## Linux, \*nix, Mac OSX Installation

```bash
curl https://raw.githubusercontent.com/luowanqian/vimrc/master/setup.sh > setup.sh && sh setup.sh
```

# Customization

## Config

Modify `~/.vim/vimrc.local` for any local customizations.

For example, to override the default color schemes:

```bash
echo colorscheme solarized >> ~/.vim/vimrc.local
```

## Plugins

### Add new plugins

Modify `~/.vim/vimrc.bundles.local` for any additional bundles.

To add a new bundle, just add one line for each bundle you want to install. The line should start
with the word "Plugin" followed by a string of either the vim.org project name or the githubusername/githubprojectname. For example, the github project
[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) can be added with the following command.

```bash
echo Plugin \'scrooloose/nerdtree\' >> ~/.vim/vimrc.bundles.local
```

### Remove an included plugin

Modify `~/.vim/vimrc.bundles.local` to remove an included plugin.

To remove an included plugin, just remove the line which the bundle you want to remove. Then
launch `vim` and run `:PluginClean`. To uninstall from command line, run `vim +PluginClean + qall`.
