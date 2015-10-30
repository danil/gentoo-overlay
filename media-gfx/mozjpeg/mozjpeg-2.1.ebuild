# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools

DESCRIPTION="Improved JPEG encoder"
HOMEPAGE="https://github.com/mozilla/mozjpeg"
SRC_URI="https://github.com/mozilla/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf || die
}

src_compile() {
	emake || die
}

MY_EXECUTEABLE="mozcjpeg"

src_install() {
	newbin cjpeg ${MY_EXECUTEABLE} || die
}

pkg_postinst() {
	echo
	elog "You should use ${MY_EXECUTEABLE} like described in"
	elog "https://hacks.mozilla.org/2014/08/using-mozjpeg-to-create-efficient-jpegs"
	echo
}
