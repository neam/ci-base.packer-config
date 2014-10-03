#!/bin/bash

cd /root
mkdir provisioning
cd provisioning

# configure default locale to prevent perl warnings - http://stackoverflow.com/questions/2499794/how-can-i-fix-a-locale-warning-from-perl
echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale
locale-gen en_US.UTF-8

apt-get update

apt-get install -y -q memcached

apt-get install -y -q sudo

apt-get install -y -q git-flow

cd /volumes/provisioning-shell-scripts/debian-wheezy/

./git-1.9.sh

./nodejs.sh

npm install -g grunt-cli bower yo

./mosh.sh

gem install compass --no-rdoc --no-ri

# deps for npm install
apt-get install -y -q bzip2 build-essential

# deps for grunt build
apt-get install -y -q openjdk-6-jre ruby-full rubygems1.8
gem install compass --no-rdoc --no-ri

# necessary for php cli scripts
apt-get install -y -q php5-cli

# necessary for s3 deploy
./s3cmd.sh

cd /root
