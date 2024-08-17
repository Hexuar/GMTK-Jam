#!/bin/sh
echo -ne '\033c\033]0;GMTK-Jam\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/GMTK-Jam.x86_64" "$@"
