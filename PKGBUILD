# Maintainer: Joey Schaff <jschaff@proton.me>
pkgname=hp-omen-rgb-git
pkgver=1.0
pkgrel=1
pkgdesc="A way to change the RGB lighting of an HP Omen Laptop's keyboard."
arch=(x86_64)
url="https://github.com/Jaoheah/hp-omen-rgb.git"
license=('MIT')
depends=('zenity' 'gawk')
makedepends=('git' 'make')
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "${srcdir}/hp-omen-rgb"
	
	make -j1 DESTDIR="${pkgdir}" install
}

