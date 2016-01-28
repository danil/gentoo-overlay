# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit multilib unpacker eutils

DESCRIPTION="A tool for building and distributing development environments"
HOMEPAGE="http://vagrantup.com"
SRC_URI_BASE="https://releases.hashicorp.com/vagrant/${PV}"
SRC_URI="x86? ( ${SRC_URI_BASE}/vagrant_${PV}_i686.deb -> ${P}_x86.deb )
		 amd64? ( ${SRC_URI_BASE}/vagrant_${PV}_x86_64.deb -> ${P}_amd64.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+virtualbox"
RESTRICT="test strip mirror"

DEPEND=""
RDEPEND="${RDEPEND}
	app-arch/libarchive
	net-misc/curl
	virtualbox? ( || ( app-emulation/virtualbox app-emulation/virtualbox-bin ) )"

S="${WORKDIR}/opt/vagrant"
QA_PREBUILT="*"

src_install() {
	local version flapper

	dodir /opt/vagrant
	cp -ar ./* "${ED}opt/vagrant"

	make_wrapper vagrant /opt/vagrant/bin/vagrant

	# directory for plugins.json
	dodir /var/lib/vagrant
}
