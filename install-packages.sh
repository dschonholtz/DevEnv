# install all of the ppas for the packages we will install later
#apt-get install software-properties-common
#apt-get update
while read p; do
  add-apt-repository ppa:"${p}"
done <ppas.txt

apt-get update

# Install the packages
while read p; do
	apt-get install "${p}"
done <packages.txt

# install neovim
su - ${LOGNAME} -c "mkdir -p ~/.config/nvim/"
su - ${LOGNAME} -c "cp ./init.vim ~/.config/nvim/"

#install vim-plug for neovim
su - ${LOGNAME} -c "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# install yarn
su - ${LOGNAME} -c "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg" | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# copy terminator config file
su - ${LOGNAME} -c "cp ./terminator -r ~/.config/"

