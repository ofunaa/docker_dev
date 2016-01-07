echo -n "あなたのローカルプロジェクトのフルパスを入力してください : "
read fullpath
echo -n "あなたのUSERNAMEを入力してください : "
read username
docker build --build-arg USER_NAME=$username -t rails_dev:dev .
docker run -v $fullpath:/home/$username -d -P --name rails_go rails_dev:dev