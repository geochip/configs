#!/bin/sh
picom --experimental-backends --backend glx --xrender-sync-fence &
nitrogen --restore &
volnoti &
