# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="lightweight volume control that sits in your systray"
HOMEPAGE="http://www.softwarebakery.com/maato/volumeicon.html"
SRC_URI="http://www.softwarebakery.com/maato/files/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libnotify"

RDEPEND="media-libs/alsa-lib
	>=x11-libs/gtk+-2.16
	x11-terms/xterm
	libnotify? ( >=x11-libs/libnotify-0.7.4 )
"
DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_enable libnotify notify)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog README || die
}
