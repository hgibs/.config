#!/usr/bin/env fish

function docker-clean
  set -l running_containers (docker ps --format '{{.Names}}')
  echo "Stopping running containers:"
  for c in $running_containers
    docker stop $c
  end
  echo "System prune:"
  docker system prune -af --volumes

  set -l existing_volumes (docker volume ls --format '{{.Name}}')
  echo "Removing all volumes:"
  for v in $existing_volumes
    docker volume rm $v
  end
  
  set -l builders (docker buildx ls | cut -d' ' -f1 | grep -v -e "^\$" -e "^NAME/NODE\$" -e "^default\$")
  echo "Removing all non-default builders:"
  for b in $builders
    docker buildx rm $b
  end  
end
