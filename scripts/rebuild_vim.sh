#!/bin/zsh
make distclean
LDFLAGS=-L$HOME/.local/conda/envs/devtools/lib/ ./configure \
    --with-features=huge --enable-multibyte --enable-rubyinterp=yes 
    --enable-python3interp=yes --enable-perlinterp=yes --enable-luainterp=yes 
    --enable-gui=gtk2 --enable-cscope 
    --prefix="$HOME/.local/" 
    --with-python3-config-dir=$(python3-config --configdir) > configure.log

make > make.log
make install > makeinstall.log
