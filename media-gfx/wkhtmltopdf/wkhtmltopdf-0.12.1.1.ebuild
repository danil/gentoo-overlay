# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit qt4-r2 multilib

DESCRIPTION="Convert html to pdf (and various image formats) using webkit"
HOMEPAGE="http://wkhtmltopdf.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

RDEPEND="dev-qt/qtgui:4
	dev-qt/qtwebkit:4
	dev-qt/qtcore:4
	dev-qt/qtsvg:4
	dev-qt/qtxmlpatterns:4"
DEPEND="${RDEPEND}"

# Tests pull data from websites and require a
# special patched version of qt so many fail
RESTRICT="test"

src_prepare() {
	sed -i -e "s:\(INSTALLBASE/\)lib:\1$(get_libdir):" src/lib/lib.pro || die
}

src_configure() {
	eqmake4 INSTALLBASE="${D}"/usr
}

src_test() {
	./scripts/test.sh || die "Tests failed"
}

src_install() {
	default

	if use examples ; then
		docinto examples
		dodoc examples/*
	fi
}
