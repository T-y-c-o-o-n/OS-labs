#!/bin/bash

regexp="Backup-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}"

cd $HOME
if [[ $(ls -d */ | grep -c "$regexp/") -eq 0 ]]; then
	echo "There is no Backup directory in $HOME";
	exit 0
fi

backupDir=$(ls -t $HOME | grep "$regexp" | head --lines=1)

restoreDir="$HOME/restore"
if [[ ! -d "$restoreDir" ]]; then
	mkdir $restoreDir
fi

cd $backupDir
find * | {
	while read file; do
		if [[ -f "$file" ]]; then
			if [[ $(echo "$file" | grep -c -x ".\+\.$regexp") -eq 0 ]]; then
				cp --parent "$file" $restoreDir
			fi
		fi
	done
}

