# install all of the ppas for the packages we will install later
while read p; do
  add-apt-repository ppa:"${p}"
done <ppas.txt

apt update

# Install the packages
while read p; do
	apt install "${p}"
done <packages.txt

# install neovim
-u ${logname} mkdir -p ~/.config/nvim/
-u ${logname} cp ./init.vim ~/.config/nvim/

#install vim-plug for neovim
-u ${logname} curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install yarn
-u ${logname} curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
