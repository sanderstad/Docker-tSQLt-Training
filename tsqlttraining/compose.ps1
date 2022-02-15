<#
This script helps demonstrate how our images on docker hub are built.

Some commands, like docker push, require special permissions.

#>

# rebuild the whole thing with no caches
docker compose down --volumes
docker volume prune -f
docker image prune -f
docker builder prune -a -f
docker compose up --force-recreate --build --remove-orphans -d

# push out to docker hub
#docker push sanderstad/tsqlttraining:latest

# Remove manifest cache
#Remove-Item $HOME/.docker/manifests -Recurse -Force

# Create manifests that support  multiple architectures
#docker manifest create sanderstad/tsqlttraining:latest

# view it if you want
#docker manifest inspect docker.io/sanderstad/tsqlttraining:latest

# push out to docker
#docker manifest push docker.io/sanderstad/tsqlttraining:latest --purge

<#
# Clean up!
This is super destructive as it will remove all images and containers and volumes. You probably don't want to run this.

docker compose down
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
"y" | docker system prune -a
"y" | docker volume prune
"y" | docker builder prune -a

#>