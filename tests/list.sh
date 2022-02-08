#/bin/sh

set -e

! local-aur list -pP

local-aur list
local-aur list -p
local-aur list -P

[ -z "$(local-aur list)" ]
[ -z "$(local-aur list -p)" ]
[ -z "$(local-aur list -P)" ]

local-aur build pandoc-bin

local-aur list
local-aur list -p
local-aur list -P

[[ "$(local-aur list)" == "aur pandoc-bin "* ]]
[[ "$(local-aur list -p)" == "aur    pandoc-bin "*"
pacman pandoc-bin "* ]]
[[ "$(local-aur list -P)" == "pacman pandoc-bin "* ]]

local-aur remove pandoc-bin

local-aur list
local-aur list -p
local-aur list -P

[ -z "$(local-aur list)" ]
[ -z "$(local-aur list -p)" ]
[ -z "$(local-aur list -P)" ]
