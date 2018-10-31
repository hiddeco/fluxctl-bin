# Maintainer: Hidde Beydals <hello@hidde.co>

pkgname=fluxctl-bin
pkgdesc="Weave Flux client binary"
pkgver=1.8.0
pkgrel=1
arch=('x86_64')
url="https://github.com/weaveworks/flux"
license=('apache')
conflicts=('fluxctl')
provides=('fluxctl=$pkgver')
_fluxctl_file=fluxctl-$pkgver
source_x86_64=($_fluxctl_file::https://github.com/weaveworks/flux/releases/download/$pkgver/fluxctl_linux_amd64)
sha256sums_x86_64=('8e1b766d1dab42527893c4529b93f7a00ee83b5fe50beff736b1bf19158db201')

package() {
  install -Dm 755 "$srcdir/$_fluxctl_file" "$pkgdir/usr/bin/fluxctl"
}

