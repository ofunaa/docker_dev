docker build --build-arg USER_NAME=$0 -t rails_dev:dev .
docker run -v $1 -d -P --name rails_go rails_dev:dev