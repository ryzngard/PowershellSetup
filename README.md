## PowershellSetup

My personal powershell environment setup. All of the following I use:

* [Scoop](https://scoop.sh/)
* [hub](https://github.com/github/hub)
* [Powerline](https://github.com/Jaykul/PowerLine)
* [Powerline fonts](https://github.com/powerline/fonts)
* [PSGit](https://github.com/PoshCode/PSGit)
* [PSReadline](https://docs.microsoft.com/en-us/powershell/module/psreadline/?view=powershell-6)
* [Terminal](https://github.com/Microsoft/Terminal)
* Scripts from the scripts folder + auto load of those scripts

## To Use

Make sure submodules are synced using `git submodule update --init`

Run install.ps1. Requires [Powershell 6](https://aka.ms/ps6)

You can also follow the links to understand how to install each component individually

## Useful added commands

* `which` - similar to which in bash, unfolds the definition of something. `which which` will show the command definition of itself
* `$__` - displays the last output. See the `Out-Default.ps1` for more details
* `ctrl+r` will search through history of commands

## Other Steps

* Install.ps1 does not install terminal for you, follow the instructions from their github on how to build and install