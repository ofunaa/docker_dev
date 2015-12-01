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
1. `docker build --build-arg USER_NAME=hogehoge -t rails_dev:dev .` ※hogehogeを変更
1. `docker run -d -P --name test_sshd rails_dev:dev`
1. `docker port test_sshd 22`
1. `docker-machine ip dev`
1. `ssh root@xxx.xxx.xx.xxx -p xxxxx`
1. `source ~/.bash_profile`
1. `cd /home/$USER_NAME`
1. `gem install bundler --version=1.10.3`
1. `gem install rbenv-rehash`
1. `npm install -g coffee-script`
1. `bundle config build.nokogiri --use-system-libraries`
1. `git clone COWCAMO_GITHUB_URL`
1. `bundle install`
1. `bundle exec sidekiq -d -q default event`
1. `cp .env.sample .env`
1. `vim .env`
1. `DATABASE_HOST='0.0.0.0'` に変更する
1. `rake db:create` *動かない場合は`/etc/init.d/mysqld restart`
1. `rake db:migrate`
1. `rails s`

### 参考URL

http://qiita.com/kohey18/items/b7e48ad70f97680041e5
