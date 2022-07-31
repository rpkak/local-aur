#!/bin/sh

set -e

pacman -Sy --asdeps --noconfirm alsa-lib gtk3 libxss desktop-file-utils nss at-spi2-atk libcurl-gnutls libsm

! local-aur build spotify

local-aur gpg --recv-key 5E3C45D7B312C643

local-aur build spotify
