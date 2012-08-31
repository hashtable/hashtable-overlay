# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit java-pkg-2 versionator

DESCRIPTION="XMLmind XML Editor allows to author large, complex, modular, XML documents"
HOMEPAGE="http://www.xmlmind.com/xmleditor/"

MY_PV=$(replace_all_version_separators '_')
MY_P="${PN}-perso-${MY_PV}"

SRC_URI="http://www.xmlmind.net/xmleditor/_download/${MY_P}.tar.gz"
LICENSE="xxe-perso"
# license does not allow redistributing, and they seem to silently update
# distfiles...
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.6
	dev-java/javahelp:0
	dev-java/saxon:6.5
	dev-java/saxon:9
	dev-java/xml-commons-resolver:0
"

S="${WORKDIR}/${MY_P}"

pkg_setup() { :; }

src_compile() { :; }

src_install() {
	local dir="/opt/${PN}"

	# buggy binary crap also requires the demo dir ??
	insinto "${dir}"
	doins -r addon demo

	# Xerces has been patched hope this gets upstream was version 2.9.1
	# relaxng is a heavely modified version of jing 20030619
	java-pkg_jarinto "${dir}"/lib
	java-pkg_dojar bin/${PN}.jar bin/${PN}_help.jar bin/${PN}_tool.jar \
		bin/xsc.jar bin/relaxng.jar bin/xerces.jar
	local dep="javahelp,saxon-6.5,saxon-9,xml-commons-resolver"
	java-pkg_register-dependency ${dep}

	# put launchers into the xxe/bin dir as expected by the xxe.jar
	into "${dir}"
	java-pkg_dolauncher convertdoc \
		--main "com.xmlmind.xmleditapp.convert.StartConvertDoc" \
		--java_args "-Xss4m -Xmx512m"
	java-pkg_dolauncher csscheck \
		--main "com.xmlmind.xmledit.stylesheet.StyleSheetLoader" \
		--java_args "-Dxml.catalog.files=\"${dir}/addon/config/catalog.xml\""
	java-pkg_dolauncher deploywebstart \
		--main "com.xmlmind.xmledittool.deploy.DeployWebStart"
	java-pkg_dolauncher translatexxe \
		--main "com.xmlmind.xmledittool.translate.TranslateXXE" \
		--java_args "-Xss4m -Xmx512m"
	java-pkg_dolauncher xmltool \
		--main "com.xmlmind.xml.xmltool.Main" \
		--java_args "-Dxml.catalog.files=\"${dir}/addon/config/catalog.xml\" -Xss4m -Xmx512m"
	java-pkg_dolauncher ${PN} \
		--main "com.xmlmind.xmleditapp.start.Start" \
		--java_args "-Xss4m -Xmx512m"

	# for direct run without creating an env.d file link them
	dodir /opt/bin
	dosym ${dir}/bin/convertdoc /opt/bin/convertdoc
	dosym ${dir}/bin/csscheck /opt/bin/csscheck
	dosym ${dir}/bin/deploywebstart /opt/bin/deploywebstart
	dosym ${dir}/bin/translatexxe /opt/bin/translatexxe
	dosym ${dir}/bin/xmltool /opt/bin/xmltool
	dosym ${dir}/bin/xxe /opt/bin/xxe

	dohtml -r doc/*
	dodoc legal/ditac.* legal/expr.* legal/icons.* legal/relaxng.* \
		legal/xerces.* legal/xsdregex.* legal/xxe-* legal.txt

	doicon bin/icon/xxe.png
	make_desktop_entry xxe "XMLmind XML Editor Personal Edition" xxe "Development;TextEditor;"
}
