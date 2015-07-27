if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi

echo Installing...
cd /usr/local/bin
wget -O sinatra-shell.zip https://github.com/thatoddmailbox/sinatra-shell/archive/master.zip
unzip sinatra-shell.zip
cp sinatra-shell-master/sinatra-shell.rb /usr/local/bin/sinatra-shell
cp -r sinatra-shell-master/sinatra-shell-files /usr/local/bin/sinatra-shell-files
rm -r sinatra-shell.zip
rm -r sinatra-shell-master

echo Done! Run sinatra-shell to use it!