# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_VERSION=v${PV}
inherit perl-module

DESCRIPTION="Historical lecture catalogue database web app"
SRC_URI="http://hashtable.de/histvv-v${PV}.tar.gz"
HOMEPAGE="http://histvv.uni-leipzig.de/"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gndlink test"

RDEPEND="
	www-apache/libapreq2[perl]
	>=dev-perl/XML-LibXML-1.69
	dev-perl/XML-LibXSLT
	>=dev-libs/dbxml-2.4.13
	>=dev-perl/File-ShareDir-1.00
	gndlink? (
		dev-perl/Config-GitLike
		>=dev-perl/Data-Beacon-0.2.5
		dev-perl/libwww-perl
		dev-perl/DBD-SQLite
		dev-perl/JSON
	)
"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.36
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)
"

SRC_TEST=do
