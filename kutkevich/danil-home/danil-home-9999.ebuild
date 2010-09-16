# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git eutils

EGIT_REPO_URI="git://kutkevich.org/dotfiles.git"

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> dotfiles"
HOMEPAGE="http://git.kutkevich.org/dotfiles.git"
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
	dodir /home/danil
	cp -a "${S}/files" "${D}/home/danil" || die "failed to install files"
	fowners -R ${MY_OWNER}:${MY_OWNER} /home/danil

	find "${D}" -type f -exec \
		sed -i \
			-e "s/^#${MY_HOST}:[ ]*//g" \
			-e "s/@gmail_com_danil_kutkevich_org@/${gmail_com_danil_kutkevich_org}/g" \
			-e "s/@gmail_com_danil_kutkevich_org@/${gmail_com_danil_kutkevich_org}/g" \
			-e "s/@BitlBee_danil@/${BitlBee_danil}/g" \
			-e "s/@Freenode_danilkutkevich@/${Freenode_danilkutkevich}/g" \
			'{}' \;
}

pkg_postinst() {
	elog "CONFIG_PROTECT variable should contain /home/danil"
	elog "You can find out about the current CONFIG_PROTECT setting"
	elog "from the emerge --info output:"
	elog "  `emerge --info | grep 'CONFIG_PROTECT='`."
	elog "<http://gentoo.org/doc/en/handbook/handbook-x86.xml?style=printable&part=3&chap=2#doc_chap3>,"
	elog "man emerge(1) CONFIGURATION FILES."
}
