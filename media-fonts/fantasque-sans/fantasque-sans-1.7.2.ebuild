# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Programming font designed with with some handwriting-like fuzziness"
HOMEPAGE="https://github.com/belluzj/fantasque-sans"
SRC_URI="
	!noloopk? ( https://github.com/belluzj/${PN}/releases/download/v${PV}/FantasqueSansMono-Normal.tar.gz -> ${P}.tar.gz )
	noloopk?  ( https://github.com/belluzj/${PN}/releases/download/v${PV}/FantasqueSansMono-NoLoopK.tar.gz -> ${P}.tar.gz )"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="noloopk"

DEPEND=""
RDEPEND=""

# Because vendor archive place files without directory.
S="${WORKDIR}"

FONT_S="${S}/OTF"
FONT_SUFFIX="otf"

DOCS="README.md"
