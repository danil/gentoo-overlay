# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Danil Kutkevich's <danil@kutkevich.org> dotfiles"
HOMEPAGE="http://git.kutkevich.org/gentoo-overlay.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

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

	if [ -r ~/org/a/a ]; then
		source ~/org/a/a
	else
		die "~/org/a/a does not exist or does not have read permission."
	fi
}

src_install() {
	insinto /home/danil

	newins "${FILESDIR}"/.bash_aliases .bash_aliases
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.bash_aliases

	newins "${FILESDIR}"/.emacs .emacs
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.emacs

	newins "${FILESDIR}"/.emacs-aliases.el .emacs-aliases.el
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.emacs-aliases.el

	newins "${FILESDIR}"/.gitconfig .gitconfig
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.gitconfig

	newins "${FILESDIR}"/.gtkrc-2.0 .gtkrc-2.0
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.gtkrc-2.0

	newins "${FILESDIR}"/.inputrc .inputrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.inputrc

	newins "${FILESDIR}"/.mailcap .mailcap
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.mailcap

	newins "${FILESDIR}"/.msmtprc .msmtprc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.msmtprc
	sed -i \
		-e "s/gmail_com_danil_kutkevich_org/${gmail_com_danil_kutkevich_org}/g" \
		"${D}"/home/danil/.msmtprc

	newins "${FILESDIR}"/.muttrc .muttrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.muttrc

	newins "${FILESDIR}"/.newsrc .newsrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.newsrc

	newins "${FILESDIR}"/.newsrc.eld .newsrc.eld
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.newsrc.eld

	newins "${FILESDIR}"/.offlineimaprc .offlineimaprc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.offlineimaprc
	sed -i \
		-e "s/gmail_com_danil_kutkevich_org/${gmail_com_danil_kutkevich_org}/g" \
		"${D}"/home/danil/.offlineimaprc

	newins "${FILESDIR}"/.ratpoisonrc .ratpoisonrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.ratpoisonrc

	newins "${FILESDIR}"/.rvmrc .rvmrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.rvmrc
	sed -i \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/home/danil/.rvmrc

	newins "${FILESDIR}"/.screenrc .screenrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.screenrc

	newins "${FILESDIR}"/.stumpwmrc .stumpwmrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.stumpwmrc

	newins "${FILESDIR}"/.urlview .urlview
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.urlview

	newins "${FILESDIR}"/.xbindkeysrc .xbindkeysrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.xbindkeysrc

	newins "${FILESDIR}"/.xinitrc .xinitrc
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.xinitrc

	newins "${FILESDIR}"/.Xmodmap .Xmodmap
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.Xmodmap

	newins "${FILESDIR}"/.Xresources .Xresources
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/.Xresources

	insinto /home/danil/bin

	newins "${FILESDIR}"/bin/epiphany.sh epiphany.sh
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/epiphany.sh

	newins "${FILESDIR}"/bin/show_battery_status.sh show_battery_status.sh
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/show_battery_status.sh

	newins "${FILESDIR}"/bin/show_cpu_load.sh show_cpu_load.sh
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/show_cpu_load.sh

	insinto /home/danil/.irssi

	newins "${FILESDIR}"/.irssi/config config
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/config
	sed -i \
		-e "s/BitlBee_danil/${BitlBee_danil}/g" \
		-e "s/Freenode_danilkutkevich/${Freenode_danilkutkevich}/g" \
		"${D}"/home/danil/.irssi/config

	insinto /home/danil/.moc

	newins "${FILESDIR}"/.moc/config config
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/config

	newins "${FILESDIR}"/.moc/keymap keymap
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/keymap

	insinto /home/danil/.mplayer

	newins "${FILESDIR}"/.mplayer/config config
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/config
	sed -i \
		-e "s/^#${MY_HOST}:[ ]*//g" \
		"${D}"/home/danil/.mplayer/config

	insinto /home/danil/.mutt

	newins "${FILESDIR}"/.mutt/mailboxes mailboxes
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/mailboxes

	insinto /home/danil/.newsbeuter

	newins "${FILESDIR}"/.newsbeuter/urls urls
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/urls

	insinto /home/danil/.w3m

	newins "${FILESDIR}"/.w3m/config config
	fowners ${MY_OWNER}:${MY_OWNER} "${INSDESTTREE}"/config
}

pkg_postinst() {
	elog "CONFIG_PROTECT variable should contain /home/danil"
	elog "You can find out about the current CONFIG_PROTECT setting"
	elog "from the emerge --info output:"
	elog "  `emerge --info | grep 'CONFIG_PROTECT='`."
	elog "<http://gentoo.org/doc/en/handbook/handbook-x86.xml?style=printable&part=3&chap=2#doc_chap3>,"
	elog "man emerge(1) CONFIGURATION FILES."
}
