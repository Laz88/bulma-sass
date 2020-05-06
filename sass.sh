#!/bin/bash

##########################
# README FOR NEW USERS   #
##########################
#
#	Run this command:
# 	bash <(wget -O - https://raw.githubusercontent.com/Laz88/bulma-sass/sass.sh)
#
##########################
# SCRIPT BEGINS HERE     #
##########################

# Step 0: verify the user is not root (or else the script will fail)

if [ "$USER" == root ]; then
	echo "[USER check] = Failed"
	echo "Error -- this script cannot be executed with sudo. Try ./ instead."
	echo "Exiting..."
	exit
else
	echo "[USER check] = $USER"
fi


sudo apt update
sudo apt install sass
sudo apt install gem
sudo apt install ruby-dev
sudo apt install ruby-listen
sudo gem install sass-listen

cd ~
mkdir sass
cd sass
wget https://github.com/jgthms/bulma/releases/download/0.8.2/bulma-0.8.2.zip
unzip \*.zip
rm bulma-0.8.2.zip
mkdir sass
cd sass
touch mystyles.scss
echo '@charset "utf-8";' >> mystyles.scss
echo '@import "../bulma-0.8.2/bulma.sass";' >> mystyles.scss
cd ..
mkdir css
cd css
sudo chmod 777 mystyles.css
cd ..
wget https://raw.githubusercontent.com/jgthms/bulma/master/docs/_includes/snippets/mypage.html
sudo sass --sourcemap=none sass/mystyles.scss:css/mystyles.css
echo "ATTENTION NOOB: To continue, visit http://bulma.io/documentation/customize/with-sass-cli/"
echo "ATTENTION NOOB: SEE STEP 6"
echo "ATTENTION NOOB: Open 'home/user/sass/mystyle.scss' and modify it"
echo "ATTENTION NOOB: remember to change 'node_modules/bulma' to 'bulma-0.8.2'"
sudo sass --watch --sourcemap=none sass/mystyles.scss:css/mystyles.css
