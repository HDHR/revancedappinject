# Checking for installation environment
# Abort TWRP installation with error message when user tries to install this module in TWRP

if [ $BOOTMODE = false ]; then
	ui_print "- Installing through TWRP Not supported!"
	ui_print "- Install this module via APatch/KSU/Magisk Manager"
	abort "- Aborting installation !!"
fi
api_level_arch_detect

PKGNAME="$(grep_prop package "$MODPATH/module.prop")"
STOCKAPPVER=$(dumpsys package $PKGNAME | grep versionName | cut -d= -f 2 | sed -n '1p')
RVAPPVER="$(grep_prop version "$MODPATH/module.prop")"


if [ ! -d "/proc/1/root/data/data/$PKGNAME" ]
then
	ui_print "- $PKGNAME app is not installed"
	abort "- Aborting installation !!"
fi

[ ! -d "/data/adb/modules/magisk_proc_monitor" ] && {
    MURL=http://github.com/HuskyDG/magisk_proc_monitor
    ui_print "- Process monitor tool is not installed"
    ui_print "  Please install it from $MURL"
    am start -a android.intent.action.VIEW -d "$MURL" &>/dev/null
}


if [ "$STOCKAPPVER" != "$RVAPPVER" ]
then
	ui_print "- Installed $PKGNAME version = $STOCKAPPVER"
	ui_print "- $PKGNAME Revanced version = $RVAPPVER"
	ui_print "- App Version Mismatch !!"
	abort "- Aborting installation !!"
fi

ui_print "- Install Successful !!"
