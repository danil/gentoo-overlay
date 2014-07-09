# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit font

DESCRIPTION="A font family with a great monospaced variant for programmers"
HOMEPAGE="http://openfontlibrary.org/en/font/fantasque-sans-mono https://github.com/belluzj/fantasque-sans"
SRC_URI="https://github.com/belluzj/${PN}/releases/download/v1.7-alpha.1/FantasqueSansMono.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="ttf"
DOCS="README.md"

# Because vendor archive place files without directory.
S="${WORKDIR}"
