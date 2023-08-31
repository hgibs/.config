#!/usr/bin/env fish

# rsync -a \
#   --info=progress2 \
#   --exclude="lost+found" \
#   --exclude=".cache" \
#   --exclude=".m2/repository" \
#   --exclude=".config/google-chrome/Default/Service Worker/CacheStorage" \
#   /home/hgibson/ \
#   -e ssh hgibson@nas0.ccri.com:/mnt/tank/backups/hgibson/laptop/main/


# rolling backups, in reverse order
set existing_rolling_dates (ssh hgibson@nas0.ccri.com 'ls -1 -r /mnt/tank/backups/hgibson/laptop' | grep 'laptop-rolling' | grep -Eo '20[0-9]{2}-[0-9]{2}-[0-9]{2}')

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

if test $count -ge 3;
  # add new backup
  set -l output_dirname (date +%F)
  set -l output_path "/mnt/tank/backups/hgibson/laptop/laptop-rolling-$output_dirname/"
  set -l already_exists (ssh hgibson@nas0.ccri.com "bash -c 'test -d $output_path; echo \$?'")

  if test "$already_exists" -eq 0;
    echo "$output_path already exists, stopping."
    exit 1
  end

  echo "Rolling backup to $output_path"

  rsync -a \
    --progress \
    --exclude="lost+found" \
    --exclude=".cache"
    --exclude=".m2/repository" \
    /home/hgibson/ \
    -e ssh hgibson@nas0.ccri.com:$output_path
end