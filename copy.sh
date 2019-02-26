#!/bin/bash

set -e

format="$1"
if [[ "$format" != "wav" && "$format" != "sln16" ]]; then
	echo "Unsupported format: $1"
	exit
fi

copy=(
	"ascending-2tone"
	"beep"
	"beeperr"
	"confbridge-join"
	"confbridge-leave"
	"descending-2tone"
	"silence/10"
	"silence/1"
	"silence/2"
	"silence/3"
	"silence/4"
	"silence/5"
	"silence/6"
	"silence/7"
	"silence/8"
	"silence/9"
	"tt-monkeys"
)

rm -rf copied
mkdir copied

cp "../res/asterisk-core-sounds-en-$1-current/LICENSE-asterisk-core-en-*" "./copied/"
cp "../res/asterisk-core-sounds-en-$1-current/CREDITS-asterisk-core-en-*" "./copied/"

for x in "${copy[@]}"; do
	dir="$(dirname $x)"
	dst="./copied/$dir"
	mkdir -p "$dst"
	cp "../res/asterisk-core-sounds-en-$1-current/$x.$1" "./copied/$x.$1"
done
