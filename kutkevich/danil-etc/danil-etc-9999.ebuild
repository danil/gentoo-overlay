# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> configuration files"
HOMEPAGE="http://git.kutkevich.org/gentoo-overlay.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_install() {
	insinto /etc
	newins "${FILESDIR}"/make.conf make.conf
	newins "${FILESDIR}"/locale.gen locale.gen
}
