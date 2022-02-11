#!/bin/bash

# Script to start NeoVim with a custom config file
# and custom stdpath

export XDG_CONFIG_HOME=./stdpath
export XDG_DATA_HOME=./data
export GOPATH=/opt/homebrew
export GOBIN=/opt/homebrew/bin
nvim -u init.lua $@
