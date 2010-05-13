# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lua Orbit initscripts"
HOMEPAGE="http://kutkevich.org/gentoo#orbit-daemon"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-lang/luarocks"

src_install() {
	newinitd "${FILESDIR}"/orbit.init orbit
	newconfd "${FILESDIR}"/orbit.confd orbit

	keepdir /var/log/orbit

	# Logrotate.
	insinto /etc/logrotate.d
	newins "${FILESDIR}/orbit.logrotate" orbit
}
