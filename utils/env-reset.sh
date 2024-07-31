#!/bin/bash

readonly APPNAME="nvim-2407"
TEMP_DIR=$(mktemp -d)

mv "$XDG_STATE_HOME/$APPNAME" "$TEMP_DIR"
mv "$XDG_CACHE_HOME/$APPNAME" "$TEMP_DIR"
mv "$XDG_DATA_HOME/$APPNAME/.netrwhist" "$TEMP_DIR"
mv "$XDG_DATA_HOME/$APPNAME/huez" "$TEMP_DIR"
mv "$XDG_DATA_HOME/$APPNAME/smart_open.sqlite3" "$TEMP_DIR"

mv "$XDG_DATA_HOME/$APPNAME/site/" "$TEMP_DIR"

#/home/yuto/.local/share/nvim-2407/site/lazy/nvim-treesitter
