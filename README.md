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
1. `docker build --build-arg USER_NAME=hogehoge -t rails:dev .` ※hogehogeを変更
1. `docker run`
1. `cd `
1. `source ~/.bash_profile`
1. `cd /home/$USER_NAME`
1. `gem install bundler`
1. `npm install -g coffee-script`
1. `git clone COWCAMO_GITHUB_URL`



### 参考URL

http://qiita.com/kohey18/items/b7e48ad70f97680041e5
