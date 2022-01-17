
# My custom dotfiles for Linux and Mac

This repo contains my dotfiles and config files for Bash, ZSH, Git and Vim, for
Unix-ish systems.

## Download / Installation

Clone the repo, then run `./install.sh [--shush]` to copy files into your home
directory. (The `--shush` option omits prompts and friendly
make-sure-you-pulled-the-latest-version reminders.) 
 - When you're done, log out and back in to use the new config.
 - To use the CoC vim plugin, run `:CocInstall coc-marketplace` and then
   `:CocList marketplace`. Then search and navigate around, and hit enter to
   install language-specific plugins.
   - Useful CoC plugins include `coc-snippets` (for text snippets),
     `coc-tsserver` and `coc-json` (JS/TS), `coc-html` and `coc-emmet` (HTML)
     and `coc-metals` (Scala).
 
## Configuration
 - `touch ~/.nokeychain` to disable running `keychain` on login.
 - `touch ~/.profilezsh` to profile zsh startup time on login.

## More documentation to come

