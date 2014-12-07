# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools-utils

MY_VERSION="0.1"

DESCRIPTION="An ncurses-based text editor for Unix systems"
HOMEPAGE="http://hisham.hm/dit"
SRC_URI="https://github.com/hishamhm/${PN}/archive/v${MY_VERSION}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/lua"

S="${WORKDIR}/${PN}-${MY_VERSION}"
