#!/usr/bin/bash
#
# {{{ CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END }}}
#
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Copyright 2018 OmniOS Community Edition (OmniOSce) Association.
# Use is subject to license terms.
#
. ../../lib/build.sh

PROG=DTraceToolkit
VER=0.99
PKG=developer/dtrace/toolkit
SUMMARY="$PROG ($VER)"
DESC="$PROG - a collection of over 200 useful and documented DTrace scripts"

DEPENDS_IPS="runtime/python-27"

PREFIX=/opt/DTT

# The toolkit is just scripts, so there is nothing to compile
build_toolkit() {
    logmsg "Installing contents to packaging directory $DESTDIR/$PREFIX"
    logcmd mkdir -p $DESTDIR/$PREFIX \
        || logerr "--- Could not create packaging directory"
    logcmd cp -rpP $TMPDIR/$BUILDDIR/* $DESTDIR/$PREFIX/ \
        || logerr "--- Install failed."
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build_toolkit
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
