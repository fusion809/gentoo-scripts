export CHROOT=$HOME/chroot
export KERN=$(ls -ld /usr/src/linux | cut -d ' ' -f 11 | sed 's/linux\-//g')
export PATH=$PATH:/usr/local/bin
