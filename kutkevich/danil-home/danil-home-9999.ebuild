# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> dotfiles"
HOMEPAGE="http://git.kutkevich.org/gentoo-overlay.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_install() {
	insinto /home/danil
	newins "${FILESDIR}"/.emacs .emacs
	fowners danil:danil "${INSDESTTREE}"/.emacs
}

pkg_postinst() {
	elog "CONFIG_PROTECT variable should contain /home/danil"
	elog "You can find out about the current CONFIG_PROTECT setting"
	elog "from the emerge --info output:"
	elog "  `emerge --info | grep 'CONFIG_PROTECT='`."
	elog "<http://gentoo.org/doc/en/handbook/handbook-x86.xml?style=printable&part=3&chap=2#doc_chap3>,"
	elog "man emerge(1) CONFIGURATION FILES."
}
