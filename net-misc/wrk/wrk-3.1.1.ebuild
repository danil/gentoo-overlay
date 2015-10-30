# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit eutils flag-o-matic

DESCRIPTION="Modern HTTP benchmarking tool"
HOMEPAGE="https://github.com/wg/wrk"
SRC_URI="https://github.com/wg/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=""
DEPEND="${RDEPEND}
	sys-libs/zlib"

src_compile() {
	tc-export CC
	emake CFLAGS="${CFLAGS} -std=gnu99 -Wall -Wno-implicit-function-declaration -D_REENTRANT" || die "Make failed!"
}

src_install() {
	dobin ${PN} || die
}
