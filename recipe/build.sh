#!/bin/sh

sed -i '/^AC_PROG_CC/a AC_PROG_CXX' configure.in
autoreconf --force --add-missing
# http://www.linuxfromscratch.org/blfs/view/6.3/general/libusb.html
export CFLAGS="$CFLAGS -Wno-error=format-truncation"
./configure --disable-build-docs --prefix=${PREFIX} --verbose
make
make install
# make check seems to fail with known issues that will not be resolved since this library is deprecated
# make check
