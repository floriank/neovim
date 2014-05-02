vimfiles
========

baseline vim setup 

customization
=============

There are 2 files where you can easily add you own configuration without having to commit anything.

The first file is ~/.vim/mybundles

If such a file exists it gets sourced while checking for NeoBundle packages.
The contents of this file should look like 

```vim
Neobundle 'tpope/foobar'
... even more awesome packages
```

The second file is ~/.vim/myvimrc

which is the place for your own configuration. This gets sourced at the end of ~/.vim/vimrc
