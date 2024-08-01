#!/bin/bash

readonly APPNAME="nvim-2407"
TEMP_DIR=$(mktemp -d)

mv "$XDG_STATE_HOME/$APPNAME" "$TEMP_DIR/state"
mv "$XDG_CACHE_HOME/$APPNAME" "$TEMP_DIR/cache"
mv "$XDG_DATA_HOME/$APPNAME/.netrwhist" "$TEMP_DIR/data1"
mv "$XDG_DATA_HOME/$APPNAME/huez" "$TEMP_DIR/data2"
mv "$XDG_DATA_HOME/$APPNAME/smart_open.sqlite3" "$TEMP_DIR/data3"

mv "$XDG_DATA_HOME/$APPNAME/site/" "$TEMP_DIR/data4"

#/home/yuto/.local/share/nvim-2407/site/lazy/nvim-treesitter
