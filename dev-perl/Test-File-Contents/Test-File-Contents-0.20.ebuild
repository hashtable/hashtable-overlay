# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MODULE_AUTHOR="DWHEELER"

inherit perl-module

DESCRIPTION="Test routines for examining the contents of files"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-perl/Text-Diff-1.410.0
	dev-lang/perl"
DEPEND="${RDEPEND}"
