# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit libtool eutils

DESCRIPTION="Unicode enabled sorting utility"
HOMEPAGE="http://billposer.org/Software/msort.html"
SRC_URI="http://billposer.org/Software/Downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
>=dev-libs/tre-0.8.0
dev-libs/icu"
RDEPEND="${DEPEND}"

src_compile() {
	econf --disable-utf8proc --disable-uninum
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "install failed"
	dodoc README NEWS ChangeLog AUTHORS || die "dodoc failed"
}
