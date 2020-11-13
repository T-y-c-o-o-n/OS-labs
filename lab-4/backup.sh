#!/bin/bash

###### Key directories and files ######

srcDir="$HOME/source"
report="$HOME/backup-report"


###### Checking last backup ######

date=$(date +%F)
backupSuffix=Backup-$date

canUpdate=false
for (( i=0; i<7; i++ )); do
	lastBackupDir="$HOME/Backup-$(date --date="-$i days ago" +%F)"
	if [[ -d "$lastBackupDir" ]]; then
		canUpdate=true
		break;
	fi
done

###### reporting backup ifmormation ######

if $canUpdate; then
	backupDir=$lastBackupDir
	printf "Updated Backup directory in $HOME: " >> $report
else
	backupDir=$HOME/$backupSuffix
	mkdir $backupDir
	printf "Created new Backup directory in $HOME: " >> $report
fi
echo "name=$(basename $backupDir) date=$date" >> $report
echo "List of files:" >> $report

###### Copying key files and directories ######

cd $srcDir

find * | {
	while read file; do
		if [[ -f "$file" ]]; then
			if [[ -f "$backupDir/$file" ]]; then	
				if [[ $(stat -c %s "$backupDir/$file") -eq $(stat -c %s "$file") ]]; then
					continue;
				else
					mv "$backupDir/$file" "$backupDir/$file.$backupSuffix" >> $report
				fi
			fi
			cp -v --parent "$file" $backupDir >> $report
		fi
	done
}
echo "" >> $report

