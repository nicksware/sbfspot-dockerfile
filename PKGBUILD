# Maintainer: Nick <aur at noobping dot dev>
pkgname=sbfspot-mysql-git
pkgver=3.7.0
pkgrel=1
pkgdesc='Yet another tool to read power production of SMA(R) solar inverters'
url='https://github.com/SBFspot/SBFspot'
arch=('any')
license=('cc-by-nc-sa-3.0')
groups=('base-devel')
depends=('bluez' 'bluez-libs' 'bluez-utils' 'libusb-compat' 'mariadb-libs' 'boost-libs')
makedepends=('make' 'git' 'gcc' 'boost' 'mysql')
conflicts=()
source=('sbfspot.sh'
        'sbfspot-daydata.service'
        'sbfspot-daydata.timer'
        'sbfspot-monthdata.service'
        'sbfspot-monthdata.timer'
        'git+https://github.com/SBFspot/SBFspot.git')
md5sums=('70847fe52649cddad371f227ed0ce1a5'
         'aa7efbcd06a02ae4450ec3b39238f0aa'
         '2208ff6d2569d95f473b57019f7fe7a1'
         'f43b59bf4e2c653a59a2d9a86f0b5a55'
         '1af3ed6abaa92aaf931b0c92b180fa96'
         'SKIP')

build() {
  cd SBFspot/SBFspot
  make mysql
}

package() {
  install -Dm755 'sbfspot.sh' '${pkgdir}/usr/bin/sbfspot'
	install -Dm644 'sbfspot-daydata.service' '${pkgdir}/usr/lib/systemd/system/sbfspot-daydata.service'
	install -Dm644 'sbfspot-daydata.timer' '${pkgdir}/usr/lib/systemd/system/sbfspot-daydata.timer'
  install -Dm644 'sbfspot-monthdata.service' '${pkgdir}/usr/lib/systemd/system/sbfspot-monthdata.service'
	install -Dm644 'sbfspot-monthdata.timer' '${pkgdir}/usr/lib/systemd/system/sbfspot-monthdata.timer'
  
  mkdir -p "${pkgdir}/opt/sbfspot.3"

  cd SBFspot/SBFspot
	install -Dm755 mysql/bin/SBFspot "${pkgdir}/opt/sbfspot.3/"
  install -Dm644 TagList*.txt "${pkgdir}/opt/sbfspot.3/"
	install -Dm644 date_time_zonespec.csv "${pkgdir}/opt/sbfspot.3/"
	install -Dm644 SBFspot.cfg "${pkgdir}/etc/default/SBFspot.cfg"
	install -Dm644 *MySQL.sql "${pkgdir}/opt/sbfspot.3/"
}
