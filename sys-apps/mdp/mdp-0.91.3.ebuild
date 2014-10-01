# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A command-line based markdown presentation tool"
HOMEPAGE="https://github.com/visit1985/mdp"
SRC_URI="https://github.com/visit1985/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	# Remove the CFLAGS and LDFLAGS defination in Makefile,
	# use default option in make.conf as the binary will be stripped
	# automatically.
	sed -i -e '/CFLAGS[[:space:]]*=/d' -e '/LDFLAGS[[:space:]]*=/d' Makefile
}

src_install() {
	dobin mdp
}
