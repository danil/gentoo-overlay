# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Chained keybindings for X11"
HOMEPAGE="http://code.google.com/p/xchainkeys"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
