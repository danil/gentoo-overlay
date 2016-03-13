# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit multilib unpacker

MY_PV=${PV/_p/-}
MY_PN=${PN%%-bin-debian}

DESCRIPTION="Chromium build from Debian unstable"
HOMEPAGE="http://packages.debian.org/sid/chromium"
SRC_URI="mirror://debian/pool/main/${PN:0:1}/${PN:0:8}-browser/${PN:0:8}_${MY_PV}_amd64.deb
	mirror://debian/pool/main/c/crystalhd/libcrystalhd3_0.0~git20110715.fdd2f19-11_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libavcodec-ffmpeg56_2.8.5-1+b1_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libavformat-ffmpeg56_2.8.5-1+b1_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libavutil-ffmpeg54_2.8.5-1+b1_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libswresample-ffmpeg1_2.8.5-1+b1_amd64.deb
	mirror://debian/pool/main/g/game-music-emu/libgme0_0.6.0-3_amd64.deb
	mirror://debian/pool/main/g/gnutls28/libgnutls30_3.4.8-2_amd64.deb
	mirror://debian/pool/main/k/krb5/libgssapi-krb5-2_1.13.2+dfsg-4_amd64.deb
	mirror://debian/pool/main/libs/libssh/libssh-gcrypt-4_0.6.3-4+deb8u1_amd64.deb
	mirror://debian/pool/main/s/shine/libshine3_3.1.0-2.1_amd64.deb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pulseaudio"

DEPEND="app-arch/dpkg"
RDEPEND="
	app-accessibility/speech-dispatcher
	app-arch/snappy
	app-crypt/mit-krb5
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libevent
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/nspr
	dev-libs/nss
	gnome-base/libgnome-keyring
	media-libs/flac
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libbluray
	>=media-libs/libjpeg-turbo-1.3.1
	media-libs/libvpx
	media-libs/openjpeg:0/5
	media-libs/schroedinger
	media-libs/soxr
	media-libs/x265
	media-libs/zvbi
	pulseaudio? ( media-sound/pulseaudio:= )
	>=media-libs/alsa-lib-1.0.19:=
	media-sound/twolame
	media-sound/wavpack
	<net-libs/libsrtp-1.5
	net-print/cups
	sys-apps/dbus
	>=sys-devel/gcc-4.9[cxx]
	sys-apps/pciutils
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libva
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/pango
	"

S=${WORKDIR}

QA_PREBUILT="usr/lib*/${MY_PN}/*"

src_install() {
	mv usr etc "${D}"/ || die

	local libdir=$(get_libdir)
	[[ "${libdir}" != lib ]] && {
		mv "${D}"/usr/{lib,"${libdir}"} || die
	}

	# Make it find ffmpeg
	mv "${D}"/usr/${libdir}/x86_64{-linux-gnu,} || die

	echo sid > "${D}"/etc/debian_version || die

	# Link to Flash (not in RDEPEND)
	local flash_plugin_dir=/usr/${libdir}/firefox/plugins
	dodir "${flash_plugin_dir}"
	ln -s ../../nsbrowser/plugins/libflashplayer.so "${D}"/${flash_plugin_dir}/libflashplayer.so || die

	# Otherwise:
	# [14345:14345:0708/125539:FATAL:zygote_host_impl_linux.cc(140)]
	# The SUID sandbox helper binary was found, but is not configured correctly.
	# Rather than run without sandboxing I'm aborting now. You need to make sure
	# that /usr/lib/chromium/chromium-sandbox is owned by root and has mode 4755.
	# Aborted
	chmod 4755 "${D}"/usr/${libdir}/${MY_PN}/chrome-sandbox || die
}
