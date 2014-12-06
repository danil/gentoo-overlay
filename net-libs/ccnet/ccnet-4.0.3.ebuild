# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE="sqlite(+)"

inherit autotools-utils python-single-r1

DESCRIPTION="Framework for writing networked applications in C"
HOMEPAGE="http://seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE="client server ldap"

RDEPEND="
	>net-libs/libsearpc-3.0.7
	>=dev-libs/glib-2.16
	>=dev-lang/vala-0.8
	>=dev-db/libzdb-2.10.2
	${PYTHON_DEPS}
	>=dev-libs/libevent-2
	ldap? ( net-nds/openldap )"

DEPEND="${RDEPEND} virtual/pkgconfig"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1

PATCHES=(
	"${FILESDIR}"/libccnet.pc.patch
	"${FILESDIR}"/0001-Add-autoconfiguration-for-libjansson.patch
)

src_configure() {
	local myeconfargs=(
		$(use_enable server)
		$(use_enable client)
		$(use_enable ldap)
		)
	autotools-utils_src_configure
}

src_compile() {
	# dev-lang/vala does not provide a valac symlink
	mkdir "${S}"/tmpbin
	ln -s $(echo $(whereis valac-) \
		| grep -oE "[^[[:space:]]*$") "${S}"/tmpbin/valac
	export PATH="${S}/tmpbin/:$PATH"

	autotools-utils_src_compile
}
