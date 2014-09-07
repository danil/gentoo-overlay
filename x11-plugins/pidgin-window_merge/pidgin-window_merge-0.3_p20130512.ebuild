# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A Pidgin plugin that merges the Buddy List window with a conversation window"
HOMEPAGE="https://github.com/dm0-/window_merge"
COMMIT="b4811ae1807a6c124fb06a717951bb2541be19f7"
SRC_URI="https://github.com/dm0-/${PN#pidgin-}/tarball/${COMMIT} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/glib:2
		net-im/pidgin[gtk]"
DEPEND="${RDEPEND}
		virtual/pkgconfig"

S="${WORKDIR}"/dm0--${PN#pidgin-}-${COMMIT:0:7}

src_prepare(){
	sed -e "/ACLOCAL_AMFLAGS/d" -i Makefile.am || die
	eautoreconf
}

pkg_postinst(){
	ewarn "This plugin and infopane plugin (purple-plugin_pack) activated"
	ewarn "at the same time cause a segfault in pidgin"
	ewarn "see https://github.com/dm0-/window_merge/issues/4"
}
