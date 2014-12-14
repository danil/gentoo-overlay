# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 autotools eutils

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
EGIT_REPO_URI="https://github.com/${PN}/core.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="x11-misc/xcb"

src_prepare() {
	epatch "${FILESDIR}"/fix-man-makefile.patch
}
