## 手順

1. `brew update`
1. `brew tap homebrew/binary`
1. `brew install docker docker-machine`
1. `docker-machine create --driver virtualbox dev`
1. `docker-machine env dev`
1. `eval "$(docker-machine env dev)"`
1. `docker-machine ssh dev`
1. `git clone https://github.com/takujifunao/docker_dev.git`
1. `cd docker_dev`
1. `docker build -t rails:dev .`
1. `docker run`




### 参考URL

http://qiita.com/kohey18/items/b7e48ad70f97680041e5
