# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit eutils

DESCRIPTION="Improved colored diff"
HOMEPAGE="http://jefftk.com/icdiff"
SRC_URI="https://github.com/jeffkaufman/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${PYTHON_DEPS}"

S="${WORKDIR}/${PN}-release-${PV}"

src_install() {
	exeinto /usr/bin
	doexe ${PN}

	dodoc README.md ChangeLog
}
