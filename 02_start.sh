docker-machine create --driver virtualbox dev
docker-machine env dev
eval "$(docker-machine env dev)"
docker-machine ssh dev
