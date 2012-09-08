# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MODULE_AUTHOR="NEELY"

inherit perl-module

DESCRIPTION="Lightweight IPv4 and IPv6 validation module."

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Net-Netmask
	dev-lang/perl"
DEPEND="${RDEPEND}"
