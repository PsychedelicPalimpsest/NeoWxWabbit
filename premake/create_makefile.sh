#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

########################
# Change directory
########################
cd "$SCRIPT_DIR"

########################
# Create Makefiles
########################
echo " ** Creating Makefiles..."
./premake4 gmake

########################
# Add wxWidgetsVer.make
########################
echo " ** Adding dynamic wxWidgets version detection..."
cp -f wxWidgetsVer.make ../build/wxWidgetsVer.make
echo "# NOTE - this file has been modified to allow building with 3.2, 3.0, and 2.8
# Regenerating the Makefile will overwrite this change!

include wxWidgetsVer.make

# End patch by patch_makefile.sh (patched on `date`)
" | cat - ../build/wxWabbitemu.make > wxWabbitemu.make.changed && mv wxWabbitemu.make.changed ../build/wxWabbitemu.make

########################
# Use wxWidgetsVer vars
########################
echo " ** Configuring Makefile to use dynamic wxWidgets versioning..."
perl -pi -e 's|`wx-config .*?--cxxflags.*?`|\$\(WX_CFLAGS\)|g' ../build/wxWabbitemu.make
perl -pi -e 's|`wx-config .*?--libs.*?`|\$\(WX_LDFLAGS\)|g' ../build/wxWabbitemu.make

echo " ** Done!"
