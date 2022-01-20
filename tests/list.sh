#/bin/sh

set -e

! sudo -u nobody local-aur list -pP

sudo -u nobody local-aur list
sudo -u nobody local-aur list -p
sudo -u nobody local-aur list -P

[ -z "$(sudo -u nobody local-aur list)" ]
[ -z "$(sudo -u nobody local-aur list -p)" ]
[ -z "$(sudo -u nobody local-aur list -P)" ]

sudo -u nobody local-aur build --noconfirm pandoc-bin

sudo -u nobody local-aur list
sudo -u nobody local-aur list -p
sudo -u nobody local-aur list -P

[[ "$(sudo -u nobody local-aur list)" == "aur pandoc-bin "* ]]
[[ "$(sudo -u nobody local-aur list -p)" == "aur    pandoc-bin "*"
pacman pandoc-bin "* ]]
[[ "$(sudo -u nobody local-aur list -P)" == "pacman pandoc-bin "* ]]

sudo -u nobody local-aur remove pandoc-bin

sudo -u nobody local-aur list
sudo -u nobody local-aur list -p
sudo -u nobody local-aur list -P

[ -z "$(sudo -u nobody local-aur list)" ]
[ -z "$(sudo -u nobody local-aur list -p)" ]
[ -z "$(sudo -u nobody local-aur list -P)" ]
