# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

DESCRIPTION="Linux tool to show progress for cp, rm, dd, ..."
HOMEPAGE="https://github.com/Xfennec/progress"
SRC_URI="https://github.com/Xfennec/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin progress
}
