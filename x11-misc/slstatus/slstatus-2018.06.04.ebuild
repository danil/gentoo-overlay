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

	sed -i \
		-e '/^CFLAGS/{s: -Os::g; s:= :+= :g}' \
		-e '/^CFLAGS/{s: -Wall::g; s: -Wextra::g}' \
		-e '/^LDFLAGS/{s:-s::g; s:= :+= :g}' \
		-e '/^CC/d' \
		config.mk || die
	sed -i \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die

	tc-export CC
	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
	einstalldocs
	save_config config.h
}
