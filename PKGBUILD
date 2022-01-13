# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='local-aur'
pkgver=0.0.1.r1.ge8eb1f5
pkgrel=1
epoch=
pkgdesc="Create a local pacman repo with the packages you want to use."
arch=('any')
url="https://github.com/rpkak/local-aur"
license=('Apache')
depends=('pacman' 'git' 'python' 'sudo')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=local-aur.install
changelog=
source=('local-aur')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	git describe | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 ./local-aur "$pkgdir/usr/bin/local-aur"
	mkdir -p "$pkgdir/var/lib/$pkgname/repo"
	echo '{"packages": {}}' > "$pkgdir/var/lib/$pkgname/local-aur.json"
	repo-add "$pkgdir/var/lib/$pkgname/repo/local-aur.db.tar.gz"
}
