#!/bin/bash

readonly APPNAME="nvim-2407"

rm -rf "$XDG_STATE_HOME/$APPNAME"
rm -rf "$XDG_CACHE_HOME/$APPNAME"
rm -rf "$XDG_DATA_HOME/$APPNAME/.netrwhist"
rm -rf "$XDG_DATA_HOME/$APPNAME/huez"
rm -rf "$XDG_DATA_HOME/$APPNAME/smart_open.sqlite3"

rm -rf "$XDG_DATA_HOME/$APPNAME/site/"

#/home/yuto/.local/share/nvim-2407/site/lazy/nvim-treesitter
