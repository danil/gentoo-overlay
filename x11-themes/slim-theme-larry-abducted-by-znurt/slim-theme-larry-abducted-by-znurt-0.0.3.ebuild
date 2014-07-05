# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils

DESCRIPTION="Larry abducted by Znurt theme for the SLiM"
HOMEPAGE="https://github.com/danil/slim-larry-abducted-by-znurt"
SRC_URI="https://github.com/danil/slim-larry-abducted-by-znurt/archive/v${PV}.zip"

LICENSE="CC-BY-SA-2.5"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-misc/slim"
DEPEND=""

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_compile() {
	:
}

src_install() {
	mv slim-larry-abducted-by-znurt-v${PV} slim-larry-abducted-by-znurt || die "mv directory"
	rm slim-larry-abducted-by-znurt/README.md || die "rm README"

	local themesdir="/usr/share/slim/themes"
	insinto ${themesdir}
	doins -r .
}
