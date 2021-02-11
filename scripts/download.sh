#!/bin/bash
IFS=$'\n' read -d '' -r -a tokens < url_list.log

for V in "${tokens[@]}"
do
echo Processing $V
youtube-dl -f "bestaudio/best" -ciw -o "~/Music/%(title)s.%(ext)s" -v --extract-audio --audio-quality 0 --audio-format mp3  $V -k
done