FROM centos
MAINTAINER takuji funao

# install package
RUN yum update -y
RUN yum install -y vim git sudo passwd wget make gcc tar readline-devel
RUN yum install -y openssl-devel openssh openssh-server openssh-clients
RUN yum install -y ImageMagick ImageMagick-devel
RUN yum install -y install libxml2 libxml2-devel libxslt libxslt-devel

# install MySQL
# RUN yum install -y mysql mysql-server
# RUN chkconfig mysqld on
# ENTRYPOINT /etc/init.d/mysqld start && /bin/bash

# create user
RUN useradd -m -s /bin/bash takuji #各自変更
RUN echo 'set_pass_word' | passwd --stdin takuji #各自変更

# setup sudo config
RUN echo "takuji ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# setup rbenv
## rben install
RUN su takuji -c "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
RUN su takuji -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN exec $SHELL -l

RUN chown takuji:takuji /home/takuji/.bashrc
## ruby install
RUN su takuji -c "/home/takuji/.rbenv/bin/rbenv install 2.1.1"
RUN su takuji -c "/home/takuji/.rbenv/bin/rbenv global 2.1.1"
RUN su takuji -c "/home/takuji/.rbenv/shims/gem install bundle"

# setup nodebrew
RUN su takuji -c "curl -L https://raw.githubusercontent.com/hokaccha/nodebrew/master/nodebrew | perl - setup"
## node install
RUN su takuji -c "/home/takuji/.nodebrew/current/bin/nodebrew install-binary stable"
RUN su takuji -c "/home/takuji/.nodebrew/current/bin/nodebrew use stable"
RUN su takuji -c "/home/takuji/.nodebrew/current/bin/npm install -g coffee-script"

# setup SSH
RUN sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Init SSHD
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

EXPOSE 22 3000

CMD ["/usr/sbin/sshd","-D"]
