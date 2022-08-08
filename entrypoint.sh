#!/bin/sh

[ -z "$uid" ] && "This script needs \$uid to be set." >&2 && exit 1
[ -z "$gid" ] && "This script needs \$gid to be set." >&2 && exit 1

HOME=/home/user
USER=user

groupadd -o --gid "$uid" "$USER"
useradd -o --uid "$uid" --gid "$gid" --home-dir "$HOME" "$USER"

exec gosu "$USER" "java -jar /app/plantuml.jar"
