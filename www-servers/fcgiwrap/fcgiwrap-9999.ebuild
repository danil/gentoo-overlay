# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# <http://j3qq4.org/src/portage/www-apps/fcgiwrap/fcgiwrap-9999.ebuild>,
# <http://github.com/wmark/ossdl-overlay/blob/master/www-misc/fcgiwrap/fcgiwrap-9999.ebuild>.

inherit autotools eutils git

EAPI="2"
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

src_compile() {
	eautoconf
	econf
    emake || die "emake failed"
}

src_install() {
    dobin fcgiwrap || die "install failed"
}
