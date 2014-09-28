# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils cmake-utils

DESCRIPTION="Flexible replacement for libevent's httpd API"
HOMEPAGE="https://github.com/ellzey/libevhtp"
SRC_URI="https://github.com/ellzey/libevhtp/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/libevent-2"
RDEPEND=""

src_install() {
	cmake-utils_src_install

	# prevent collision with oniguruma
	test -f /usr/include/onigposix.h
	if [ $? -eq 0 ]; then
		rm "${D}"/usr/include/onigposix.h
	fi
}
