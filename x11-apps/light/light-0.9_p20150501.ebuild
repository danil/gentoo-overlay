# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="control backlights"
HOMEPAGE="http://haikarainen.github.io/light"
COMMIT="77e89d1d341181af5e7cfc62e1299a68aabf440b"
SRC_URI="https://github.com/haikarainen/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${PN}-${COMMIT}"
