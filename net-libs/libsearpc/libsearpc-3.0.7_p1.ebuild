# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE="sqlite(+)"

inherit autotools-utils python-single-r1

MY_VERSION="3.0-latest"

DESCRIPTION="Simple and easy-to-use C language RPC framework"
HOMEPAGE="http://seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${MY_VERSION}.tar.gz -> ${PN}-${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-libs/glib-2.26
	>=dev-libs/jansson-2.2.1
	dev-python/pygobject:2[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND} virtual/pkgconfig"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

AUTOTOOLS_AUTORECONF=1

PATCHES=(
	"${FILESDIR}"/libsearpc.pc.patch
)

S="${WORKDIR}/${PN}-${MY_VERSION}"
