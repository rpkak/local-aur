#!/bin/sh

set -e

BUILD_DIR="$(mktemp --tmpdir -d local-aur.XXXXXXXX)"

git clone --depth 1 "https://aur.archlinux.org/local-aur.git" "$BUILD_DIR"

cd "$BUILD_DIR"

makepkg --noconfirm -si

PKGFILE="$(makepkg --packagelist)"
TARGET="/var/lib/local-aur/repo/$(basename "$PKGFILE")"

sudo mv "$PKGFILE" "$TARGET"

sudo repo-add "/var/lib/local-aur/repo/local-aur.db.tar.gz" "$TARGET"

echo "
{
    \"packages\": {
        \"local-aur\": {
            \"commit_hash\": \"$(git rev-parse --verify HEAD)\",
            \"dest_files\": [
                \"$TARGET\"
            ]
        }
    }
}
" | sudo tee /var/lib/local-aur/local-aur.json

sudo pacman -Sy
