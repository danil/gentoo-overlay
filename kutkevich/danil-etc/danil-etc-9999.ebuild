# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> configuration files"
HOMEPAGE="http://git.kutkevich.org/gentoo-overlay.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="frink homer milhouse revlovejoy"

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
}

src_install() {
	newconfd "${FILESDIR}"/conf.d/consolefont consolefont
	newconfd "${FILESDIR}"/conf.d/keymaps keymaps

	newenvd "${FILESDIR}"/env.d/02locale 02locale

	insinto /etc

	newins "${FILESDIR}"/fstab fstab
	sed -i \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/fstab

	newins "${FILESDIR}"/hosts hosts
	sed -i \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/hosts

	newins "${FILESDIR}"/locale.gen locale.gen

	newins "${FILESDIR}"/make.conf make.conf
	sed -i \
		-e "s/@arch@/${MY_ARCH}/g" \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/make.conf

	insinto /etc/portage

	newins "${FILESDIR}"/portage/package.keywords package.keywords
	sed -i \
		-e "s/@arch@/${MY_ARCH}/g" \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/portage/package.keywords

	newins "${FILESDIR}"/portage/package.unmask package.unmask
	sed -i \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/portage/package.unmask

	newins "${FILESDIR}"/portage/package.use package.use

	insinto /etc/layman

	newins "${FILESDIR}"/layman/layman.cfg layman.cfg
}

pkg_postinst() {
	elog "CONFIG_PROTECT variable should contain /etc/env.d"
	elog "You can find out about the current CONFIG_PROTECT setting"
	elog "from the emerge --info output:"
	elog "  `emerge --info | grep CONFIG_PROTECT`."
	elog "<http://gentoo.org/doc/en/handbook/handbook-x86.xml?style=printable&part=3&chap=2#doc_chap3>,"
	elog "man emerge(1) CONFIGURATION FILES."
}
