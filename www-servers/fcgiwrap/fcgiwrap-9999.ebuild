# Copyright 2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils git

DESCRIPTION="Simple FastCGI wrapper for CGI scripts"
HOMEPAGE="http://nginx.localdomain.pl/wiki/FcgiWrap"
SRC_URI=""
EGIT_REPO_URI="git://github.com/gnosek/fcgiwrap.git"
RESTRICT=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="dev-libs/fcgi"
RDEPEND=""

src_compile() {
    emake
}

src_install() {
    dobin fcgiwrap
}
