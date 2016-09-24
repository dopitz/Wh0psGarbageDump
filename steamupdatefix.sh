#!bin/bash
find $HOME/.steam/root/ubuntu12_32/steam-runtime/*/usr/lib/ -name "libstdc++.so.6" -exec mv "{}" "{}.bak" \; -print
