#!/usr/bin/env fish

# rsync -a \
#   --info=progress2 \
#   --exclude="lost+found" \
#   --exclude=".cache" \
#   --exclude=".m2/repository" \
#   --exclude=".config/google-chrome/Default/Service Worker/CacheStorage" \
#   /home/hgibson/ \
#   -e ssh hgibson@nas0.ccri.com:/mnt/tank/backups/hgibson/laptop/main/

set -l basepath "$HOME/nas0_tank/backups/hgibson/laptop"

if test ! -e "$basepath"
  mountnas
end

# rolling backups, in reverse order
# set existing_rolling_dates (ssh hgibson@nas0.ccri.com "ls -1 -r $basepath" | grep 'laptop-rolling' | grep -Eo '20[0-9]{2}-[0-9]{2}-[0-9]{2}')
set existing_rolling_dates (ls -1 -r "$basepath" | grep 'laptop-rolling' | grep -Eo '20[0-9]{2}-[0-9]{2}-[0-9]{2}')

# if [ -z "$existing_rolling_dates" ]; then
#   echo "No rolling backups found!"
# fi

set count 0
set oldest_backup ""
echo "$existing_rolling_dates" | while read --line backup_date; 
  # echo "-> $backup_date"
  set oldest_backup "$backup_date"
  set count (math $count +1)
end

echo $count
echo $oldest_backup

# add new backup
set -l output_dirname (date +%F)
set -l output_path "$basepath/laptop-rolling-$output_dirname/"
# set -l already_exists (ssh hgibson@nas0.ccri.com "bash -c 'test -d $output_path; echo \$?'")

# if test "$already_exists" -eq 0;
if test -d "$output_path"
  echo "$output_path already exists, stopping."
  exit 1
end

echo "Rolling backup to $output_path"

# --links is implied by -P
rsync -aqP \
  --safe-links \
  --exclude="lost+found" \
  --exclude="nas0_tank" \
  --exclude=".tldr" \
  --exclude=".local/lib" \
  --exclude=".cache" \
  --exclude=".m2/repository" \
  /home/hgibson/ \
  $output_path

if test $count -ge 3;
  # remove oldest backup
  echo "Would remove $oldest_backup"
end

