# Introduction
## How to Setup Config
```
# For example, setup nvim package
$ cd /path/to/repo/root
$ stow nvim
```

NOTE: If a target is encountered which already exists but is a plain fil, Stow will register this as a conflict and refuse to proceed.

If we don't want to override the existing files but still want to use stow:
```
$ stow nvim --adopt
```
This will change the stow directory instead and cleanup the local files. Then, you can stow it agian.

To "unstow" the package:
```
$stow -D nvim 
```
WARNING: This will delete all local plain files.
