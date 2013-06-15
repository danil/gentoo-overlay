# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A nice dark metal brushed gtk theme"
HOMEPAGE="http://killhellokitty.deviantart.com/"
SRC_URI="http://ftp.disco.kutkevich.org/pub/gentoo/x11-themes/delorean-gtk-theme/delorean_dark_theme_3_6_vs_2_56_by_killhellokitty-d5fslhj.zip -> ${P}.zip
	green-theme? ( http://ftp.disco.kutkevich.org/pub/gentoo/x11-themes/delorean-gtk-theme/delorean_dark_theme_3_6_g__vs_2_56_by_killhellokitty-d5nnoxt.zip -> ${P/gtk/green}.zip )
	light-theme? ( http://ftp.disco.kutkevich.org/pub/gentoo/x11-themes/delorean-gtk-theme/delorean_light_theme_3_6___vs_1_01_by_killhellokitty-d5pp1w3.zip -> ${PN/gtk/light}-1.01.zip )
	chromium? ( http://ftp.disco.kutkevich.org/pub/gentoo/x11-themes/delorean-gtk-theme/delorean_dark_chromium_theme_by_killhellokitty-d5l6n8t.zip -> ${PN/gtk/chromium}-1.11.zip )
	firefox? ( http://ftp.disco.kutkevich.org/pub/gentoo/x11-themes/delorean-gtk-theme/delorean_dark_theme_3_6___firefox_theme_1_0_by_killhellokitty-d5muvkf.zip -> ${PN/gtk/firefox}-1.70.zip )
	thunderbird? ( http://ftp.disco.kutkevich.org/pub/gentoo/x11-themes/delorean-gtk-theme/delorean_dark_thunderbird_theme_1_10_by_killhellokitty-d5fd83p.zip -> ${PN/gtk/thunderbird}-1.10.zip )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="chromium cinnamon firefox gnome gtk green-theme light-theme
openbox thunderbird xfwm4"

REQUIRE_USE="gnome? ( gtk ) cinnamon? ( gtk )"
GTK_VERSION="3.6"

RDEPEND="chromium? ( www-client/chromium )
	cinnamon? ( gnome-extra/cinnamon )
	firefox? ( || ( www-client/firefox www-client/firefox-bin ) )
	gnome? ( x11-wm/metacity gnome-base/gnome-shell )
	gtk? ( =x11-themes/gnome-themes-standard-${GTK_VERSION}* )
	openbox? ( x11-wm/openbox )
	thunderbird? ( || ( mail-client/thunderbird mail-client/thunderbird-bin ) )
	xfwm4? ( xfce-base/xfwm4 )
	x11-themes/gtk-engines-unico
	x11-themes/gtk-engines
	>=x11-themes/gtk-engines-murrine-0.98.2"

DEPEND="app-arch/unzip"

S="${WORKDIR}"

src_install() {
	if use firefox; then
		mkdir -p delorean-dark/apps/firefox
		mv chrome delorean-dark/apps/firefox || die
	fi
	if use chromium; then
		mkdir -p delorean-dark/apps/chromium
		mv Chromium-Themes/DeLorean-Chromium.crx \
			delorean-dark/chromium/delorean.crx || die
		mv Chromium-Themes/DeLorean-Dark-Chromium.crx \
			delorean-dark/chromium/delorean-dark.crx || die
		mv Chromium-Themes/varNaM-Chromium.crx \
			delorean-dark/chromium/varnam.crx || die
	fi
	if use thunderbird; then
		mkdir -p delorean-dark/apps/thunderbird
		mv DeLorean-Dark-Thunderbird_1.10/chrome \
			delorean-dark/apps/thunderbird || die
		mv DeLorean-Dark-Thunderbird_1.10/EAD_ME-INSTALL \
			delorean-dark/apps/thunderbird/README || die
	fi
	use light-theme && mv delorean-light{-theme-3.6,}
	use green-theme && mv delorean-dark-{theme-3.6-G,green}
	use cinnamon || rm -r delorean-*/cinnamon
	use gnome || rm -r delorean-*/{gnome-shell,metacity-1}
	use openbox || rm -r delorean-*/openbox-3
	use xfwm4 || rm -r delorean-*/xfwm4
	insinto /usr/share/themes
	doins -r delorean-*
}
