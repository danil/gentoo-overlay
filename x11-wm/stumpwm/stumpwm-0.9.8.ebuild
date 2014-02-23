# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp eutils

DESCRIPTION="Stumpwm is a tiling, keyboard driven X11 Window Manager written entirely in Common Lisp."
HOMEPAGE="http://www.nongnu.org/stumpwm/index.html"
SRC_URI="https://github.com/sabetts/${PN}/archive/${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-lisp/common-lisp-controller
		virtual/commonlisp
		dev-lisp/cl-ppcre
		doc? ( sys-apps/texinfo virtual/texi2dvi )"
RDEPEND="${DEPEND}
		dev-lisp/sbcl dev-lisp/cl-clx"

src_configure() {
	sed "s,@PACKAGE_VERSION@,$PV,g" version.lisp.in > version.lisp
}

src_compile() {
	use doc && makeinfo stumpwm.texi.in
}

src_install() {
	common-lisp-install *.lisp stumpwm.asd
	common-lisp-system-symlink
	dodoc README NEWS ChangeLog "${FILESDIR}/README.Gentoo" || die
	use doc && doinfo stumpwm.info
}

pkg_postinst() {
	common-lisp_pkg_postinst
	cat "${FILESDIR}/README.Gentoo"
}
