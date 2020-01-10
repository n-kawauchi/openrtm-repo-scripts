#!/bin/sh
#
# @file fedora_repo
# @brief yum repository database creation for Fedora
# @date $Date$
# @author Noriaki Ando <n-ando@aist.go.jp>
#
# Copyright (C) 2008
#     Noriaki Ando
#     Task-intelligence Research Group,
#     Intelligent Systems Research Institute,
#     National Institute of
#         Advanced Industrial Science and Technology (AIST), Japan
#     All rights reserved.
#
# $Id$
#

# Base directory of repository
basedir=/home/openrtm/public_html/pub/Linux/Fedora/releases/

# Fedora releases
versions="12 13 14 15 16 17 18 19 20"

# Fedora architectures
archs="i386 x86_64"

for version in $versions ; do
    for arch in $archs ; do
	rpmdir=$basedir/$version/Fedora/$arch/os/Packages/
	echo ""
	echo "Creating yum database under:"
	echo $rpmdir
	createrepo -v $rpmdir
    done
    srpmdir=$basedir/$version/Fedora/source/SRPMS/
    echo ""
    echo "Creating yum database under:"
    echo $rpmdir
    createrepo -v $srpmdir
done

