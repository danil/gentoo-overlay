# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PN="${PN/-daemon/}"
DESCRIPTION="Lua Orbit initscripts"
HOMEPAGE="http://kutkevich.org/gentoo#orbit-daemon"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-lang/luarocks"

pkg_setup() {
	# Creating nginx user and group.
	enewgroup ${MY_PN}
	enewuser ${MY_PN} -1 -1 -1 ${MY_PN}
}

src_install() {
	newinitd "${FILESDIR}"/${MY_PN}.init ${MY_PN}
	newconfd "${FILESDIR}"/${MY_PN}.confd ${MY_PN}

	keepdir /var/log/${MY_PN}

	# Logrotate.
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${MY_PN}.logrotate" ${MY_PN}
}
