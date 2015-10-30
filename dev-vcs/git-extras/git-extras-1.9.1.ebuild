# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit bash-completion-r1

DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/visionmedia/git-extras"
SRC_URI="https://github.com/visionmedia/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git"

src_compile() {
	:;
	# we skip this because the first target of the
	# Makefile is "install" and plain "make" would
	# actually run "make install"
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
	nonfatal dodoc Readme.md
	nonfatal newbashcomp "${D}"/etc/bash_completion.d/${PN} ${PN}
}
