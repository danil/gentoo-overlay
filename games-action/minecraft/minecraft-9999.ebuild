# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=2

inherit games

DESCRIPTION="Minecraft is a game about placing blocks while running from skeletons"
HOMEPAGE="http://minecraft.net"

MY_PN="Minecraft"
URI="https://s3.amazonaws.com/${MY_PN}.Download/launcher/${MY_PN}.jar"

LICENSE="Minecraft"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="net-misc/wget"
RDEPEND="x11-apps/xrandr
	|| ( dev-java/icedtea-bin:6
		dev-java/icedtea:6[X]
		dev-java/oracle-jre-bin[X] )"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

src_prepare() {
	wget "${URI}" -O "${PN}.jar" || die
}

src_install() {
	insinto "${GAMEDIR}"

	doins "${PN}.jar"

	mkdir -p "${D}/${GAMES_BINDIR}"

	local wrapper="${D}/${GAMES_BINDIR}/${PN}"
	touch "${wrapper}"

	cat << EOF >> "${wrapper}"
#!/bin/sh
cd "${GAMEDIR}"
java -Xmx1024M -Xms512M -jar "${PN}.jar"
EOF

	doicon "${FILESDIR}/${PN}.png"
	make_desktop_entry "${PN}" "${MY_PN}"

	prepgamesdirs
}
