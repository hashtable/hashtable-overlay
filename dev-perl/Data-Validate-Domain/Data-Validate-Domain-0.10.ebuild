# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MODULE_AUTHOR="NEELY"

inherit perl-module

DESCRIPTION="Light weight module for validating domains"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-perl/Net-Domain-TLD-1.690.0
	dev-lang/perl"
DEPEND="${RDEPEND}"
