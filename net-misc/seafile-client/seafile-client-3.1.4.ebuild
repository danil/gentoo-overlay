# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils python qt4-r2

DESCRIPTION="Seafile desktop client"
HOMEPAGE="http://seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# RDEPEND=">=net-misc/seafile-${PV}[client] dev-libs/jansson"
RDEPEND="
	>=net-misc/seafile-${PV}[client]
	dev-libs/jansson
	dev-qt/qtdbus:4
	dev-qt/qtwebkit:4"
DEPEND="${RDEPEND}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_compile() {
	cmake . || die "src_compile failed"
	emake -j1 || die "emake failed"
}
