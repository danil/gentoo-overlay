# This file is part of Danil Kutkevich <danil@kutkevich.org> home.

# Merge in defaults and keymaps.
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Turn off bell.
xset b off

# Set the keyboard auto repeat parameters.
xset r rate 300 30

# xbindkeys.
# The first line makes sure any running xbindkeys is killed. The
# second starts and backgrounds xscreensaver.
killall xbindkeys 2>/dev/null
xbindkeys

# Screensaver.
# xlock and xautolock
# <http://onyon.net/index.php/2006-11-26_22.40.07_irssiandXawareautoaway>.
xautolock -exit
killall xautolock 2>/dev/null
killall xlock 2>/dev/null
xautolock -time 10 -locker "xlock -mode deco -lockdelay 60" &
# # Xscreensaver
# # <http://en.wikibooks.org/wiki/Using_Ratpoison/Example_Config>,
# # <http://en.wikipedia.org/wiki/User:Gwern/.stumpwmrc>.
# # I use Xscreensaver as a screensaver. The first line makes sure any
# # running Xscreensaver is killed.  The second run regardless of the
# # success of the first & starts a background Xscreensaver daemon.
# xscreensaver-command -exit
# killall xscreensaver 2>/dev/null
# xscreensaver -nosplash &

# Slim
# <http://en.gentoo-wiki.com/wiki/SLiM#Preparing_for_multiple_sessions>.
DEFAULT_SESSION="stumpwm"

case $1 in
stumpwm)
    exec stumpwm
    ;;
ratpoison)
    exec ratpoison
    ;;
fluxbox)
    exec startfluxbox
    ;;
*)
    exec $DEFAULT_SESSION
    ;;
esac
