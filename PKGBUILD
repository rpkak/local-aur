# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='local-aur'
pkgver=0.0.2.r27.g7fbec9d
pkgrel=1
epoch=
pkgdesc="Create a local pacman repo with the packages you want to use."
arch=('any')
url="https://github.com/rpkak/local-aur"
license=('Apache')
depends=('pacman' 'git' 'python3' 'sudo' $(pacman -Sgq base-devel))
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
source=('local-aur' 'pacman-config')
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=()

pkgver() {
	git describe | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 ./local-aur "$pkgdir/usr/bin/local-aur"
	install -Dm644 ./pacman-config "$pkgdir/usr/share/local-aur/pacman-config"
	mkdir -p "$pkgdir/var/lib/$pkgname/repo"
	echo '{"packages": {}}' > "$pkgdir/var/lib/$pkgname/local-aur.json"
}
