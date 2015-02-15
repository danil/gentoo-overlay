# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils savedconfig toolchain-funcs

MY_REV="c2a23fa06f2cbeda154b25254da9a18f15e21340"

DESCRIPTION="a generic, highly customizable, and efficient menu for the X Window System"
HOMEPAGE="http://tools.suckless.org/dmenu/"
SRC_URI="http://git.suckless.org/${PN}/snapshot/${PN}-${MY_REV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xinerama"

RDEPEND="
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
"
DEPEND="${RDEPEND}
	xinerama? ( virtual/pkgconfig )
"

S="${WORKDIR}/${PN}-${MY_REV}"

src_prepare() {
	# Respect our flags
	sed -i \
		-e '/^CFLAGS/{s|=.*|+= -ansi -pedantic -Wall $(INCS) $(CPPFLAGS)|}' \
		-e '/^LDFLAGS/s|= -s|+=|' \
		config.mk || die
	# Make make verbose
	sed -i \
		-e 's|^	@|	|g' \
		-e '/^	echo/d' \
		Makefile || die

	restore_config config.h
	epatch_user
}

src_configure() {
	tc-export PKG_CONFIG
}

src_compile() {
	emake \
		CC=$(tc-getCC) \
		"XINERAMAFLAGS=$(
			usex xinerama "-DXINERAMA $(
				${PKG_CONFIG} --cflags xinerama 2>/dev/null
			)" ''
		)" \
		"XINERAMALIBS=$(
			usex xinerama "$(
				${PKG_CONFIG} --libs xinerama 2>/dev/null
			)" ''
		)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
}
