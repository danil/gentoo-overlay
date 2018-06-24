# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils git-r3 multilib savedconfig toolchain-funcs

DESCRIPTION="Suckless lightweight status monitor uses WM_NAME"
HOMEPAGE="https://tools.suckless.org/slstatus"
SRC_URI=""
EGIT_REPO_URI="https://git.suckless.org/${PN}"
EGIT_COMMIT_DATE="${PV}"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa savedconfig"

RDEPEND="
	x11-libs/libX11
	alsa? ( media-libs/alsa-lib )
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	eapply_user
	sed -e '/^CFLAGS/s:[[:space:]]-O[^[:space:]]*[[:space:]]: :' \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-i config.mk || die
	sed -e '/@echo/!s:@::' \
		-e '/tic/d' \
		-i Makefile || die
	tc-export CC
	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
	einstalldocs
	save_config config.h
}
