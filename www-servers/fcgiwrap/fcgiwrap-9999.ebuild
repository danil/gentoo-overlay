# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# <http://j3qq4.org/src/portage/www-apps/fcgiwrap/fcgiwrap-9999.ebuild>,
# <http://github.com/wmark/ossdl-overlay/blob/master/www-misc/fcgiwrap/fcgiwrap-9999.ebuild>.

EAPI="2"

inherit autotools eutils git

DESCRIPTION="Simple FastCGI wrapper for CGI scripts"
HOMEPAGE="http://nginx.localdomain.pl/wiki/FcgiWrap"
SRC_URI=""
EGIT_REPO_URI="git://github.com/gnosek/fcgiwrap.git"
RESTRICT=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/fcgi"

src_configure() {
	eautoconf || die "eautoconf failed"
	econf
}

# src_compile() {
# 	emake || die "emake failed"
# }

src_install() {
	dobin fcgiwrap || die "install failed"
}
