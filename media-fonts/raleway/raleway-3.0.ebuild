# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit font

DESCRIPTION="Raleway is an elegant sans-serif typeface, designed in a single thin weight."
HOMEPAGE="http://www.impallari.com/projects/overview/matt-mcinerneys-raleway-family http://theleagueofmoveabletype.com/raleway"
SRC_URI="http://www.impallari.com/media/uploads/prosources/update-100-source.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="ttf"
S="${WORKDIR}/${PN}-family-v${PV}"
