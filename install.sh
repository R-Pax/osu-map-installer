#!/usr/bin/env bash
set -euo pipefail

while IFS= read -r line; do
    id=$(grep -oE 'beatmapsets/[0-9]+' <<< "$line" | grep -oE '[0-9]+')
    curl -fL -o "${id}.osz" "https://osu.sayobot.cn/Action/DownloadFile?Beatmapset=${id}&0"
done < maps.txt
