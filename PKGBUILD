# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='local-aur'
pkgver=0.5.0.r2.g4ca72c0
pkgrel=1
epoch=
pkgdesc="Download the AUR packages you trust and use pacman to install them."
arch=('any')
url="https://github.com/rpkak/local-aur"
license=('Apache')
depends=('pacman' 'git' 'python3' 'tar' 'zstd' 'gnupg' 'base-devel')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=local-aur.install
changelog=
source=('local-aur' 'pacman-config' 'local-aur.service' 'local-aur.timer' 'local-aur-sysusers.conf')
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
validpgpkeys=()

pkgver() {
	git describe | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 ./local-aur "$pkgdir/usr/bin/local-aur"
	install -Dm644 ./pacman-config "$pkgdir/usr/share/local-aur/pacman-config"
	install -Dm644 ./local-aur.service "$pkgdir/usr/lib/systemd/system/local-aur.service"
	install -Dm644 ./local-aur.timer "$pkgdir/usr/lib/systemd/system/local-aur.timer"
	install -Dm644 ./local-aur-sysusers.conf "$pkgdir/usr/lib/sysusers.d/local-aur.conf"
}
