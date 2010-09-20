# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git eutils

EGIT_REPO_URI="git://kutkevich.org/etc.git"

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> configuration files"
HOMEPAGE="http://git.kutkevich.org/gentoo-overlay.git"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="frink homer milhouse revlovejoy"

MY_OWNER="danil"

pkg_setup() {
	if use !frink && use !milhouse; then
		die 'You must select host. For axample USE="homer"'
	fi

	if use frink && use milhouse; then
		die "You may select only one host"
	fi

	if use frink; then
		MY_HOST="frink"
		MY_ARCH="amd64"
	elif use homer || use milhouse || use revlovejoy; then
		MY_HOST="milhouse"
		MY_ARCH="x86"
	fi

	if [ -r /home/${MY_OWNER}/org/a/a ]; then
		source /home/${MY_OWNER}/org/a/a
	else
		die "/home/${MY_OWNER}/org/a/a does not exist or does not have read permission."
	fi
}

src_install() {
	dodir /boot
	cp -ra "${S}/files/boot" "${D}/" || die "failed to install files"

	dodir /etc
	cp -ra "${S}/files/etc" "${D}/" || die "failed to install files"

	dodir /usr
	cp -ra "${S}/files/usr" "${D}/" || die "failed to install files"

	newconfd "${FILESDIR}"/conf.d/consolefont consolefont
	newconfd "${FILESDIR}"/conf.d/emacs.danil emacs.danil
	newconfd "${FILESDIR}"/conf.d/keymaps keymaps
	newconfd "${FILESDIR}"/conf.d/net net
	newconfd "${FILESDIR}"/conf.d/postgresql-8.4 postgresql-8.4
	newconfd "${FILESDIR}"/conf.d/rc rc
	newconfd "${FILESDIR}"/conf.d/xdm xdm

	newenvd "${FILESDIR}"/env.d/02locale 02locale

	insinto /etc
	newins "${FILESDIR}"/make.conf make.conf

	insinto /etc/portage
	newins "${FILESDIR}"/portage/package.keywords package.keywords
	newins "${FILESDIR}"/portage/package.mask package.mask
	newins "${FILESDIR}"/portage/package.unmask package.unmask
	newins "${FILESDIR}"/portage/package.use package.use

	insinto /etc/layman
	newins "${FILESDIR}"/layman/layman.cfg layman.cfg

	# Removal.

	rm -r "${D}"/etc/modprobe.d

	if use !milhouse; then
		rm -r "${D}"/etc/acpi
	fi

	find "${D}" -type f -exec \
		sed -i \
			-e "s/^#${MY_HOST}:[ ]*//g" \
			-e "s/@arch@/${MY_ARCH}/g" \
			-e "s|@wpa_supplicant_30_5_407_psk@|${wpa_supplicant_30_5_407_psk}|g" \
			-e "s|@wpa_supplicant_AP_Gunner_SES_psk@|${wpa_supplicant_AP_Gunner_SES_psk}|g" \
			-e "s|@wpa_supplicant_JohnWiFi_wep_key@|${wpa_supplicant_JohnWiFi_wep_key}|g" \
			-e "s|@wpa_supplicant_iClubPublic_psk@|${wpa_supplicant_iClubPublic_psk}|g" \
			-e "s|@wpa_supplicant_kuzmin_wep_key@|${wpa_supplicant_kuzmin_wep_key}|g" \
			-e "s|@wpa_supplicant_linksys_g_wep_key@|${wpa_supplicant_linksys_g_wep_key}|g" \
			-e "s|@wpa_supplicant_tatyana_wep_key@|${wpa_supplicant_tatyana_wep_key}|g" \
			-e "s|@wpa_supplicant_yurij_wep_key@|${wpa_supplicant_yurij_wep_key}|g" \
			'{}' \;
}

pkg_postinst() {
	elog "CONFIG_PROTECT variable should contain /etc/env.d,"
	elog "/boot and /usr/lib/urxvt/perl"
	elog "You can find out about the current CONFIG_PROTECT setting"
	elog "from the emerge --info output:"
	elog "  `emerge --info | grep CONFIG_PROTECT`."
	elog "<http://gentoo.org/doc/en/handbook/handbook-x86.xml?style=printable&part=3&chap=2#doc_chap3>,"
	elog "man emerge(1) CONFIGURATION FILES."
}
