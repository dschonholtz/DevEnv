while read p; do
  add-apt-repository ppa:gnome-terminator "${p}"
done <ppas.txt

apt update

while read p; do
	apt install "${p}"
done <packages.txt

