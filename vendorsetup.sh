#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="raphael"

fox_get_target_device() {
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      AERA_BUILD_DEVICE="$FDEVICE";
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      AERA_BUILD_DEVICE="$FDEVICE";
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      AERA_BUILD_DEVICE="$FDEVICE";
  elif echo "$0" | grep -q "$FDEVICE"; then
      AERA_BUILD_DEVICE="$FDEVICE";
  fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   aera_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"
    export AERA_USE_BASH_SHELL=1
    export AERA_ASH_IS_BASH=1
    export AERA_USE_TAR_BINARY=1
    export AERA_USE_SED_BINARY=1
    export AERA_USE_XZ_UTILS=1
    export AERA_USE_LZ4_BINARY=1
    export AERA_USE_ZSTD_BINARY=1
    export AERA_DELETE_AROMAFM=1
    export AERA_USE_DATE_BINARY=1
    
    # EROFS support
    export AERA_USE_FSCK_EROFS_BINARY=1
    
    # Target Devices
    export TARGET_DEVICE_ALT="raphaelin"
    export AERA_TARGET_DEVICES="raphael,raphaelin"
    
    # AERA device build settings
	  export AERA_BUILD_STATUS=Unofficial
	  export AERA_BUILD_TYPE=Beta

    # AERA settings
	  export AERA_ENABLE_MOBILE_DATA=1
	  export AERA_SETTINGS_ROOT_DIRECTORY="/persist"
	  # AERA begins at R1.0; do not append legacy variant or patch suffixes.
	  unset AERA_VARIANT
	  unset AERA_MAINTAINER_PATCH_VERSION
	  export AERA_ALLOW_EARLY_SETTINGS_LOAD=1
	  export AERA_RESET_SETTINGS="disabled"
else
    echo "I: vendorsetup.sh skipped; device mismatch or environment issue."
    fi
fi
