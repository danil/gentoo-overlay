# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> configuration files"
HOMEPAGE="http://git.kutkevich.org/gentoo-overlay.git"

LICENSE="GPL-2"
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
}

src_install() {
	if use frink; then
		MY_HOST="frink"
		MY_ARCH="amd64"
	elif use homer || use milhouse || use revlovejoy; then
		MY_HOST="milhouse"
		MY_ARCH="x86"
	fi

	insinto /etc

	newins "${FILESDIR}"/make.conf make.conf
	sed -i \
		-e "s/@arch@/${MY_ARCH}/g" \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/make.conf

	newins "${FILESDIR}"/locale.gen locale.gen

	insinto /etc/portage

	newins "${FILESDIR}"/portage/package.keywords package.keywords
	sed -i \
		-e "s/@arch@/${MY_ARCH}/g" \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/etc/portage/package.keywords
}
