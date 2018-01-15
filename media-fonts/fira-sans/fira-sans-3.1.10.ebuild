# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit font

MY_PV="${PV//./}"

DESCRIPTION="Mozilla's new typeface, used in Firefox OS"
HOMEPAGE="http://carrois.com/fira-3-1 https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface http://mozilla.github.io/Fira"
SRC_URI="http://www.carrois.com/wordpress/downloads/fira_3_1/FiraFonts${MY_PV}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="ttf"
S="${WORKDIR}/FiraFonts${MY_PV}"
FONT_S="${WORKDIR}/FiraFonts${MY_PV}/FiraSans${MY_PV}/WEB"
