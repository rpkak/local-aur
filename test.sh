#!/bin/sh

set -e

cd "$(dirname $0)"

if groups | grep -q '\bdocker\b'; then
    DOCKER_SUDO=""
else
    DOCKER_SUDO="sudo "
fi

${DOCKER_SUDO}docker run \
    -v "$1":/local-aur.pkg.tar.zst \
    --name local-aur-builder \
    archlinux /bin/sh -c "pacman -Syy; pacman -U --noconfirm /local-aur.pkg.tar.zst; echo 'nobody ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/nobody"

IMAGE_HASH="$(${DOCKER_SUDO}docker commit local-aur-builder)"

${DOCKER_SUDO}docker container rm local-aur-builder

for TEST_FILE in $(ls -d tests/*)
do
    echo
    echo
    echo "######## TEST_FILE=$TEST_FILE ########"
    echo

    ${DOCKER_SUDO}docker run \
        -v "$PWD/$TEST_FILE":/test \
        --rm \
        "$IMAGE_HASH" /bin/sh -c "/test"
done

${DOCKER_SUDO}docker image rm "$IMAGE_HASH"
