# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4} )

inherit python-r1 distutils-r1

MY_VERSION="3.32"

DESCRIPTION="Replacement for i3status"
HOMEPAGE="http://docs.enkore.de/i3pystatus"
SRC_URI="https://github.com/enkore/${PN}/archive/${MY_VERSION}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa dbus psutil network parcel"
# IUSE="weather wifi pulseaudio"

DEPEND=""
RDEPEND="
	${PYTHON_DEPS}
	alsa? ( dev-python/pyalsaaudio )
	dbus? ( dev-python/dbus-python )
	psutil? ( dev-python/psutil )
	network? ( dev-python/netifaces )
	parcel? ( dev-python/beautifulsoup:4 dev-python/cssselect dev-python/lxml )"
# RDEPEND="
# 	weather? ( dev-python/pywapi )
# 	wifi? ( dev-python/netifaces dev-python/basiciw )
# 	pulseaudio? ( dev-python/colour )"

S="${WORKDIR}/${PN}-${MY_VERSION}"
