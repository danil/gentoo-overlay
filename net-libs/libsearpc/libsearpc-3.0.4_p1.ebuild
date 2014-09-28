# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils python

DESCRIPTION="Simple and easy-to-use C language RPC framework"
HOMEPAGE="http://seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v3.0-latest.tar.gz -> ${PN}-${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"

DEPEND=">=dev-lang/python-2.5
	>=dev-libs/glib-2.0
	dev-libs/jansson
	virtual/pkgconfig"

RDEPEND=""

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	./autogen.sh || die "src_prepare failed"
}

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install() {
	#Fix wrong prefix in libsearpc.pc file
	cat "${S}/libsearpc.pc" | sed 's/(DESTDIR)//' > "${S}/libsearpc.pc_m"
	mv "${S}/libsearpc.pc_m" "${S}/libsearpc.pc"

	emake DESTDIR="${D}" install

	local d
	for d in README* ChangeLog AUTHORS NEWS TODO CHANGES THANKS BUGS \
			FAQ CREDITS CHANGELOG ; do
		[[ -s "${d}" ]] && dodoc "${d}"
	done
}
