#!/bin/sh
set -e

fast=false

# gradle-bootstrap-modules is generated with gradle_topo_sort.py
modules=$(cat gradle-bootstrap-modules)

# *-classpath.properties files generated with following snippet
# for jar in /usr/share/java/gradle/*.jar; do
#     propfile="$(basename -s .jar $jar)-classpath.properties"
#     echo "echo '$(unzip -q -c $jar $propfile|sed '/^runtime=/d')' >$propfile"
# done

echo '#module definition
#Wed Jan 21 06:15:54 UTC 2015
projects=gradle-core' >gradle-announce-classpath.properties
echo '#module definition
#Wed Jan 21 06:29:45 UTC 2015
projects=gradle-core,gradle-plugins' >gradle-antlr-classpath.properties
echo '#module definition
#Wed Jan 21 06:16:33 UTC 2015
projects=gradle-base-services' >gradle-base-services-groovy-classpath.properties
echo '#module definition
#Wed Jan 21 06:15:54 UTC 2015
projects=' >gradle-base-services-classpath.properties
echo '#module definition
#Wed Jan 21 06:39:00 UTC 2015
projects=gradle-resources,gradle-core,gradle-tooling-api,gradle-reporting,gradle-plugins,gradle-ear' >gradle-build-comparison-classpath.properties
echo '#module definition
#Wed Jan 21 06:42:30 UTC 2015
projects=gradle-core,gradle-plugins,gradle-wrapper' >gradle-build-init-classpath.properties
echo '#module definition
#Wed Jan 21 06:17:33 UTC 2015
projects=' >gradle-cli-classpath.properties
echo '#module definition
#Wed Jan 21 06:43:18 UTC 2015
projects=gradle-core,gradle-plugins,gradle-reporting' >gradle-code-quality-classpath.properties
echo '#module definition
#Wed Jan 21 06:17:44 UTC 2015
projects=gradle-docs,gradle-model-core,gradle-model-groovy,gradle-cli,gradle-native,gradle-base-services,gradle-base-services-groovy,gradle-messaging,gradle-resources' >gradle-core-classpath.properties
echo '#module definition
#Wed Jan 21 06:44:37 UTC 2015
projects=gradle-core,gradle-platform-native,gradle-language-native' >gradle-cunit-classpath.properties
echo '#module definition
#Wed Jan 21 06:31:25 UTC 2015
projects=gradle-core,gradle-resources-http' >gradle-dependency-management-classpath.properties
echo '#module definition
#Wed Jan 21 06:46:58 UTC 2015
projects=gradle-core,gradle-reporting,gradle-plugins,gradle-platform-native,gradle-language-native,gradle-dependency-management' >gradle-diagnostics-classpath.properties
echo '#module definition
#Wed Jan 21 06:24:51 UTC 2015
projects=' >gradle-docs-classpath.properties
echo '#module definition
#Wed Jan 21 06:39:03 UTC 2015
projects=gradle-core,gradle-plugins' >gradle-ear-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:01 UTC 2015
projects=gradle-scala,gradle-core,gradle-launcher,gradle-plugins,gradle-ear,gradle-tooling-api' >gradle-ide-classpath.properties
echo '#module definition
#Wed Jan 21 06:54:00 UTC 2015
projects=gradle-core,gradle-ide,gradle-platform-native,gradle-language-native' >gradle-ide-native-classpath.properties
echo '#module definition
#Wed Jan 21 06:55:04 UTC 2015
projects=gradle-core,gradle-publish,gradle-plugins,gradle-dependency-management' >gradle-ivy-classpath.properties
echo '#module definition
#Wed Jan 21 06:56:06 UTC 2015
projects=gradle-core,gradle-plugins,gradle-reporting' >gradle-jacoco-classpath.properties
echo '#module definition
#Wed Jan 21 06:56:57 UTC 2015
projects=gradle-core,gradle-plugins,gradle-dependency-management' >gradle-javascript-classpath.properties
echo '#module definition
#Wed Jan 21 06:58:00 UTC 2015
projects=gradle-core,gradle-plugins' >gradle-jetty-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:00 UTC 2015
projects=gradle-platform-jvm,gradle-language-java' >gradle-language-groovy-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:03 UTC 2015
projects=gradle-core,gradle-platform-jvm,gradle-language-jvm' >gradle-language-java-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:05 UTC 2015
projects=gradle-platform-jvm,gradle-platform-base' >gradle-language-jvm-classpath.properties
echo '#module definition
#Wed Jan 21 06:44:40 UTC 2015
projects=gradle-core,gradle-platform-native' >gradle-language-native-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:04 UTC 2015
projects=gradle-base-services,gradle-core,gradle-cli,gradle-ui,gradle-tooling-api,gradle-native' >gradle-launcher-classpath.properties
echo '#module definition
#Wed Jan 21 06:58:53 UTC 2015
projects=gradle-core,gradle-dependency-management,gradle-plugins,gradle-publish' >gradle-maven-classpath.properties
echo '#module definition
#Wed Jan 21 06:17:45 UTC 2015
projects=gradle-base-services' >gradle-messaging-classpath.properties
echo '#module definition
#Wed Jan 21 06:18:24 UTC 2015
projects=gradle-base-services' >gradle-model-core-classpath.properties
echo '#module definition
#Wed Jan 21 06:18:49 UTC 2015
projects=gradle-base-services-groovy,gradle-model-core' >gradle-model-groovy-classpath.properties
echo '#module definition
#Wed Jan 21 06:19:05 UTC 2015
projects=gradle-base-services' >gradle-native-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:04 UTC 2015
projects=' >gradle-open-api-classpath.properties
echo '#module definition
#Wed Jan 21 06:59:51 UTC 2015
projects=gradle-core,gradle-plugins' >gradle-osgi-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:08 UTC 2015
projects=gradle-core' >gradle-platform-base-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:51 UTC 2015
projects=gradle-platform-base,gradle-core' >gradle-platform-jvm-classpath.properties
echo '#module definition
#Wed Jan 21 06:44:43 UTC 2015
projects=gradle-core,gradle-platform-base' >gradle-platform-native-classpath.properties
echo '#module definition
#Wed Jan 21 07:00:21 UTC 2015
projects=gradle-core,gradle-plugins' >gradle-plugin-development-classpath.properties
echo '#module definition
#Wed Jan 21 06:36:21 UTC 2015
projects=gradle-core,gradle-dependency-management,gradle-reporting,gradle-platform-jvm,gradle-language-jvm,gradle-language-java,gradle-language-groovy' >gradle-plugins-classpath.properties
echo '#module definition
#Wed Jan 21 07:00:41 UTC 2015
projects=gradle-core,gradle-dependency-management,gradle-resources-http' >gradle-plugin-use-classpath.properties
echo '#module definition
#Wed Jan 21 06:55:07 UTC 2015
projects=gradle-core,gradle-dependency-management' >gradle-publish-classpath.properties
echo '#module definition
#Wed Jan 21 06:36:24 UTC 2015
projects=gradle-core' >gradle-reporting-classpath.properties
echo '#module definition
#Wed Jan 21 06:31:26 UTC 2015
projects=gradle-resources,gradle-base-services' >gradle-resources-http-classpath.properties
echo '#module definition
#Wed Jan 21 06:19:14 UTC 2015
projects=gradle-base-services,gradle-messaging' >gradle-resources-classpath.properties
echo '#module definition
#Wed Jan 21 06:50:50 UTC 2015
projects=gradle-core,gradle-language-jvm,gradle-plugins' >gradle-scala-classpath.properties
echo '#module definition
#Wed Jan 21 07:01:23 UTC 2015
projects=gradle-core,gradle-plugins,gradle-maven' >gradle-signing-classpath.properties
echo '#module definition
#Wed Jan 21 07:02:04 UTC 2015
projects=gradle-core,gradle-plugins,gradle-jacoco' >gradle-sonar-classpath.properties
echo '#module definition
#Wed Jan 21 06:39:38 UTC 2015
projects=gradle-core,gradle-messaging,gradle-wrapper,gradle-base-services' >gradle-tooling-api-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:14 UTC 2015
projects=gradle-core,gradle-open-api' >gradle-ui-classpath.properties
echo '#module definition
#Wed Jan 21 06:38:22 UTC 2015
projects=gradle-cli' >gradle-wrapper-classpath.properties


echo plugins=gradle-plugins,gradle-code-quality,gradle-jetty,gradle-antlr,gradle-wrapper,gradle-osgi,gradle-maven,gradle-ide,gradle-announce,gradle-scala,gradle-sonar,gradle-signing,gradle-ear,gradle-javascript,gradle-build-comparison,gradle-diagnostics,gradle-reporting,gradle-publish,gradle-ivy,gradle-jacoco,gradle-build-init,gradle-platform-base,gradle-platform-jvm,gradle-language-jvm,gradle-language-java,gradle-language-groovy,gradle-platform-native,gradle-language-native,gradle-ide-native,gradle-cunit,gradle-plugin-development,gradle-plugin-use >subprojects/core/src/main/resources/gradle-plugins.properties

cat <<EOF >subprojects/core/src/main/resources/org/gradle/build-receipt.properties
buildNumber=none
buildTimestamp=20141110133144+0000
commitId=aab8521f1fd9a3484cac18123a72bcfdeb7006ec
hostname=dev1.gradle.org
isSnapshot=false
javaVersion=1.7.0_02
osName=Linux
osVersion=3.2.0-57-generic
project=gradle
rcNumber=
username=tcagent1
versionBase=2.2
versionNumber=2.2
EOF

mkdir -p subprojects/docs/src/main/resources/
cat <<EOF >subprojects/docs/src/main/resources/default-imports.txt
import org.gradle.*
import org.gradle.api.*
import org.gradle.api.artifacts.*
import org.gradle.api.artifacts.cache.*
import org.gradle.api.artifacts.component.*
import org.gradle.api.artifacts.dsl.*
import org.gradle.api.artifacts.ivy.*
import org.gradle.api.artifacts.maven.*
import org.gradle.api.artifacts.query.*
import org.gradle.api.artifacts.repositories.*
import org.gradle.api.artifacts.result.*
import org.gradle.api.component.*
import org.gradle.api.distribution.*
import org.gradle.api.distribution.plugins.*
import org.gradle.api.dsl.*
import org.gradle.api.execution.*
import org.gradle.api.file.*
import org.gradle.api.initialization.*
import org.gradle.api.initialization.dsl.*
import org.gradle.api.invocation.*
import org.gradle.api.java.archives.*
import org.gradle.api.logging.*
import org.gradle.api.plugins.*
import org.gradle.api.plugins.announce.*
import org.gradle.api.plugins.antlr.*
import org.gradle.api.plugins.buildcomparison.gradle.*
import org.gradle.api.plugins.jetty.*
import org.gradle.api.plugins.osgi.*
import org.gradle.api.plugins.quality.*
import org.gradle.api.plugins.scala.*
import org.gradle.api.plugins.sonar.*
import org.gradle.api.plugins.sonar.model.*
import org.gradle.api.publish.*
import org.gradle.api.publish.ivy.*
import org.gradle.api.publish.ivy.plugins.*
import org.gradle.api.publish.ivy.tasks.*
import org.gradle.api.publish.maven.*
import org.gradle.api.publish.maven.plugins.*
import org.gradle.api.publish.maven.tasks.*
import org.gradle.api.publish.plugins.*
import org.gradle.api.reporting.*
import org.gradle.api.reporting.components.*
import org.gradle.api.reporting.dependencies.*
import org.gradle.api.reporting.plugins.*
import org.gradle.api.resources.*
import org.gradle.api.specs.*
import org.gradle.api.tasks.*
import org.gradle.api.tasks.ant.*
import org.gradle.api.tasks.application.*
import org.gradle.api.tasks.bundling.*
import org.gradle.api.tasks.compile.*
import org.gradle.api.tasks.diagnostics.*
import org.gradle.api.tasks.incremental.*
import org.gradle.api.tasks.javadoc.*
import org.gradle.api.tasks.scala.*
import org.gradle.api.tasks.testing.*
import org.gradle.api.tasks.testing.junit.*
import org.gradle.api.tasks.testing.testng.*
import org.gradle.api.tasks.util.*
import org.gradle.api.tasks.wrapper.*
import org.gradle.buildinit.plugins.*
import org.gradle.buildinit.tasks.*
import org.gradle.external.javadoc.*
import org.gradle.ide.cdt.*
import org.gradle.ide.cdt.tasks.*
import org.gradle.ide.visualstudio.*
import org.gradle.ide.visualstudio.plugins.*
import org.gradle.ide.visualstudio.tasks.*
import org.gradle.jvm.*
import org.gradle.jvm.platform.*
import org.gradle.jvm.plugins.*
import org.gradle.jvm.toolchain.*
import org.gradle.language.*
import org.gradle.language.assembler.*
import org.gradle.language.assembler.plugins.*
import org.gradle.language.assembler.tasks.*
import org.gradle.language.base.*
import org.gradle.language.base.artifact.*
import org.gradle.language.base.plugins.*
import org.gradle.language.c.*
import org.gradle.language.c.plugins.*
import org.gradle.language.c.tasks.*
import org.gradle.language.cpp.*
import org.gradle.language.cpp.plugins.*
import org.gradle.language.cpp.tasks.*
import org.gradle.language.java.*
import org.gradle.language.java.artifact.*
import org.gradle.language.java.plugins.*
import org.gradle.language.java.tasks.*
import org.gradle.language.jvm.*
import org.gradle.language.jvm.plugins.*
import org.gradle.language.jvm.tasks.*
import org.gradle.language.nativeplatform.*
import org.gradle.language.nativeplatform.tasks.*
import org.gradle.language.objectivec.*
import org.gradle.language.objectivec.plugins.*
import org.gradle.language.objectivec.tasks.*
import org.gradle.language.objectivecpp.*
import org.gradle.language.objectivecpp.plugins.*
import org.gradle.language.objectivecpp.tasks.*
import org.gradle.language.rc.*
import org.gradle.language.rc.plugins.*
import org.gradle.language.rc.tasks.*
import org.gradle.nativeplatform.*
import org.gradle.nativeplatform.platform.*
import org.gradle.nativeplatform.plugins.*
import org.gradle.nativeplatform.tasks.*
import org.gradle.nativeplatform.test.*
import org.gradle.nativeplatform.test.cunit.*
import org.gradle.nativeplatform.test.cunit.plugins.*
import org.gradle.nativeplatform.test.cunit.tasks.*
import org.gradle.nativeplatform.test.plugins.*
import org.gradle.nativeplatform.test.tasks.*
import org.gradle.nativeplatform.toolchain.*
import org.gradle.nativeplatform.toolchain.plugins.*
import org.gradle.platform.base.*
import org.gradle.platform.base.binary.*
import org.gradle.platform.base.component.*
import org.gradle.platform.base.test.*
import org.gradle.plugin.use.*
import org.gradle.plugins.ear.*
import org.gradle.plugins.ear.descriptor.*
import org.gradle.plugins.ide.api.*
import org.gradle.plugins.ide.eclipse.*
import org.gradle.plugins.ide.idea.*
import org.gradle.plugins.javascript.base.*
import org.gradle.plugins.javascript.coffeescript.*
import org.gradle.plugins.javascript.envjs.*
import org.gradle.plugins.javascript.envjs.browser.*
import org.gradle.plugins.javascript.envjs.http.*
import org.gradle.plugins.javascript.envjs.http.simple.*
import org.gradle.plugins.javascript.jshint.*
import org.gradle.plugins.javascript.rhino.*
import org.gradle.plugins.javascript.rhino.worker.*
import org.gradle.plugins.signing.*
import org.gradle.plugins.signing.signatory.*
import org.gradle.plugins.signing.signatory.pgp.*
import org.gradle.plugins.signing.type.*
import org.gradle.plugins.signing.type.pgp.*
import org.gradle.process.*
import org.gradle.sonar.runner.*
import org.gradle.sonar.runner.plugins.*
import org.gradle.sonar.runner.tasks.*
import org.gradle.testing.jacoco.plugins.*
import org.gradle.testing.jacoco.tasks.*
import org.gradle.util.*
EOF


external_deps="
aether-ant-tasks/aether-ant-tasks
aether/aether-api
aether/aether-connector-basic
aether/aether-impl
aether/aether-spi
aether/aether-transport-classpath
aether/aether-transport-file
aether/aether-transport-http
aether/aether-transport-wagon
aether/aether-util
ant/ant-antlr
ant/ant-junit
ant/ant-launcher
ant/ant
antlr
apache-commons-collections
apache-commons-lang
apache-ivy/ivy
aqute-bndlib
atinject
base64coder
bcpg
bcprov
bea-stax-api
bea-stax
beust-jcommander
bsf
bsh
cglib
commons-cli
commons-codec
commons-io
commons-logging
dom4j
ecj
extra166y
felix/org.osgi.core
geronimo-annotation
geronimo-jms
glassfish-servlet-api
google-gson/gson
gpars/gpars
groovy/groovy-all
guava
guava-jdk5
hamcrest/core
hawtjni/hawtjni-runtime
httpcomponents/httpclient
httpcomponents/httpcore
isorelax
jansi-native/jansi-native
jansi/jansi
jarjar/jarjar
jatl
javamail/javax.mail
jaxen
jcifs
jcip-annotations
jcsp
jdom
jdom2/jdom2
jettison/jettison
jetty/jetty-annotations
jetty/jetty-jsp
jetty/jetty-plus
jetty/jetty-security
jetty/jetty-server
jetty/jetty-servlet
jetty/jetty-util
jetty/jetty-webapp
jetty/jetty-xml
jline/jline
jna
joda-convert
joda-time
js
jsch
junit
jzlib
kryo
kxml-min
kxml
log4j-1.2.17
logback/logback-classic
logback/logback-core
maven-wagon/http-shared
maven-wagon/http
maven-wagon/provider-api
maven/maven-aether-provider
maven/maven-artifact
maven/maven-compat
maven/maven-core
maven/maven-model-builder
maven/maven-model
maven/maven-plugin-api
maven/maven-repository-metadata
maven/maven-settings-builder
maven/maven-settings
minlog
msv-core
multiverse/multiverse-core
native-platform
nekohtml
netty3-3.6.6
objectweb-asm/asm-all
objenesis/objenesis
org.eclipse.sisu.plexus
plexus-classworlds
plexus-containers/plexus-component-annotations
plexus-containers/plexus-container-default
plexus/interpolation
plexus/plexus-cipher
plexus/plexus-sec-dispatcher
plexus/utils
qdox
reflectasm
relaxngDatatype/relaxngDatatype
simple
slf4j/jcl-over-slf4j
slf4j/jul-to-slf4j
slf4j/log4j-over-slf4j
slf4j/slf4j-api
snakeyaml
sonar/sonar-batch-bootstrapper
stax2-api
tesla-polyglot/tesla-polyglot-common
tesla-polyglot/tesla-polyglot-groovy
testng
woodstox-core
xalan-j2-serializer
xalan-j2
xbean/xbean-reflect
xerces-j2
xml-commons-apis
xml-commons-resolver
xom
xsdlib
xstream/xstream

findbugs
sonar/sonar-batch
sonar/sonar-core
sonar/sonar-deprecated
sonar/sonar-java-api
sonar/sonar-plugin-api
sonar/sonar-squid
apache-commons-configuration
"

classpath=$(build-classpath $external_deps)

rm -rf bootstrap-home
mkdir -p bootstrap-home/lib/plugins

build-jar-repository -p bootstrap-home/lib/plugins $external_deps
for old in bootstrap-home/lib/plugins/*; do
    new=${old/.jar/}-00.jar
    new=${new///*_//lib/plugins/}
    mv $old $new 
done

dep_runtime=$(ls bootstrap-home/lib/plugins | xargs | sed s/\ /,/g)

rm -rf bootstrap-classes
mkdir bootstrap-classes

if $fast; then
    tar xf bootstrap-classes.tar.bz2
fi

for mod in $modules; do
    classes_dir=bootstrap-classes/$mod
    mkdir -p $classes_dir
    srcdirs=""
    for lang in groovy java; do
	dir=subprojects/${mod/gradle-/}/src/main/$lang
	[[ -d $dir ]] && srcdirs="$srcdirs $dir"
    done
    if [[ -n "$srcdirs" ]]; then
	echo "== groovyc $mod..."
	$fast || groovyc -cp $classpath -j -d $classes_dir $(find $srcdirs -name *.java -o -name *.groovy)
    fi
    jar=$PWD/bootstrap-home/lib/$mod-2.2.1.jar
    (cd ./$classes_dir && jar cf $jar .)
    resources_dir=subprojects/${mod/gradle-/}/src/main/resources
    mkdir -p $resources_dir
    cat $mod-classpath.properties >$resources_dir/$mod-classpath.properties
    echo "runtime=$dep_runtime" >>$resources_dir/$mod-classpath.properties
    (cd ./subprojects/${mod/gradle-/}/src/main/resources && jar uf $jar .)
    classpath=$classpath:$jar
done
