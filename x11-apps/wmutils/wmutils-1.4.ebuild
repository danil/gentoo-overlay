# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"
SRC_URI="https://github.com/${PN}/core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="x11-misc/xcb"

# Because vendor archive contains "core-${PV}" directory instead of "wmutils-${PV}".
S="${WORKDIR}/core-${PV}"
