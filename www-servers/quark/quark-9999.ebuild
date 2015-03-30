# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit savedconfig git-r3

DESCRIPTION="quark is an extremly small web server"
HOMEPAGE="http://tools.suckless.org/quark"
EGIT_REPO_URI="http://git.suckless.org/${PN}"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_prepare() {
	restore_config config.h
	epatch_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
	dodoc README
	save_config config.h
}
