#!/sbin/sh
# Heimdall For Android NDK
SKIPUNZIP=1

# Direct Install via Normal Mode
if [ $BOOTMODE ! = true ] ; then
    abort "! Please install in Magisk Manager"
fi

# Prepare Module Environment
ui_print "- Prepare module environment"
local TMPDIR=$MODPATH/tmp
unzip -o $ZIPFILE module.prop -d $MODPATH >&2
mkdir -p $TMPDIR
mkdir -p $MODPATH/system/bin

# Extract Binary Files
ui_print "- Extracting binaries for $ARCH"
unzip -o $ZIPFILE arch/$ARCH/* -d $TMPDIR >&2
mv -f $TMPDIR/arch/$ARCH/* $MODPATH/system/bin

# Cleaning Up
ui_print "- Cleaning up"
rm -rf $TMPDIR

# Setting Permissions
ui_print "- Setting permissions"
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/system/bin 0 0 0755 0755

ui_print "- Heimdall For Android NDK installed successfully."