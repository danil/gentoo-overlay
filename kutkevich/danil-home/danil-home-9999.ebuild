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
	lalala="${INSDESTTREE}"/.emacs
}

pkg_postinst() {
	elog "${lalala}"
}
