# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Lightweight Ruby"
HOMEPAGE="https://github.com/mruby/mruby"
SRC_URI="https://github.com/mruby/mruby/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="local-mri"

DEPEND="sys-devel/bison"
RDEPEND="!local-mri? ( dev-lang/ruby )"

src_install() {
	dobin bin/{mirb,mrbc,mruby}
	dolib.a build/host/lib/{libmruby.a,libmruby_core.a}

	insinto /usr/include/
	doins -r include/{mrbconf.h,mruby,mruby.h}
}
