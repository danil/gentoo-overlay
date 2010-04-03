# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit libtool eutils

DESCRIPTION="Unicode enabled sorting utility"
HOMEPAGE="http://billposer.org/Software/msort.html"
SRC_URI="http://billposer.org/Software/Downloads/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="
>=dev-libs/tre-0.8.0
dev-libs/icu"
RDEPEND=""

src_compile() {
	econf --disable-utf8proc --disable-uninum || die "econf failed!"
	emake || die "emake failed!"
}

src_install() {
	make DESTDIR="${D}" install
	dodoc README NEWS ChangeLog AUTHORS
}
