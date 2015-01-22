#!/bin/sh
set -e

fast=false

# gradle-bootstrap-modules is generated with gradle_topo_sort.py
modules=$(cat gradle-bootstrap-modules)

echo '#module definition
#Wed Jan 21 06:15:54 UTC 2015
projects=gradle-core
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-announce-classpath.properties
echo '#module definition
#Wed Jan 21 06:29:45 UTC 2015
projects=gradle-core,gradle-plugins
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,ant-antlr-1.9.3.jar,antlr-2.7.7.jar,ant-1.9.4.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-launcher-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-antlr-classpath.properties
echo '#module definition
#Wed Jan 21 06:16:33 UTC 2015
projects=gradle-base-services
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-base-services-groovy-classpath.properties
echo '#module definition
#Wed Jan 21 06:15:54 UTC 2015
projects=
runtime=guava-jdk5-17.0.jar,slf4j-api-1.7.7.jar' >gradle-base-services-classpath.properties
echo '#module definition
#Wed Jan 21 06:39:00 UTC 2015
projects=gradle-resources,gradle-core,gradle-tooling-api,gradle-reporting,gradle-plugins,gradle-ear
runtime=groovy-all-2.3.6.jar,guava-jdk5-17.0.jar,slf4j-api-1.7.7.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-build-comparison-classpath.properties
echo '#module definition
#Wed Jan 21 06:42:30 UTC 2015
projects=gradle-core,gradle-plugins,gradle-wrapper
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-build-init-classpath.properties
echo '#module definition
#Wed Jan 21 06:17:33 UTC 2015
projects=
runtime=' >gradle-cli-classpath.properties
echo '#module definition
#Wed Jan 21 06:43:18 UTC 2015
projects=gradle-core,gradle-plugins,gradle-reporting
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-code-quality-classpath.properties
echo '#module definition
#Wed Jan 21 06:17:44 UTC 2015
projects=gradle-docs,gradle-model-core,gradle-model-groovy,gradle-cli,gradle-native,gradle-base-services,gradle-base-services-groovy,gradle-messaging,gradle-resources
runtime=groovy-all-2.3.6.jar,asm-all-5.0.3.jar,commons-collections-3.2.1.jar,commons-io-1.4.jar,commons-lang-2.6.jar,logback-core-1.0.13.jar,logback-classic-1.0.13.jar,guava-jdk5-17.0.jar,jcip-annotations-1.0.jar,jul-to-slf4j-1.7.7.jar,jarjar-1.3.jar,javax.inject-1.jar,slf4j-api-1.7.7.jar,log4j-over-slf4j-1.7.7.jar,jcl-over-slf4j-1.7.7.jar,ant-1.9.4.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-core-classpath.properties
echo '#module definition
#Wed Jan 21 06:44:37 UTC 2015
projects=gradle-core,gradle-platform-native,gradle-language-native
runtime=' >gradle-cunit-classpath.properties
echo '#module definition
#Wed Jan 21 06:31:25 UTC 2015
projects=gradle-core,gradle-resources-http
runtime=jarjar-wagon-http-shared-2.8.jar,jarjar-aether-util-1.0.0.v20140518.jar,jarjar-maven-plugin-api-3.1.1.jar,jarjar-maven-aether-provider-3.1.1.jar,jarjar-maven-model-builder-3.1.1.jar,jarjar-maven-repository-metadata-3.1.1.jar,jarjar-plexus-interpolation-1.14.jar,jarjar-plexus-utils-2.0.6.jar,jarjar-maven-model-3.1.1.jar,jarjar-plexus-classworlds-2.4.jar,jarjar-plexus-cipher-1.7.jar,jarjar-plexus-component-annotations-1.5.5.jar,jarjar-maven-compat-3.1.1.jar,jarjar-wagon-http-2.8.jar,jarjar-maven-core-3.1.1.jar,jarjar-maven-settings-builder-3.1.1.jar,jarjar-aether-impl-1.0.0.v20140518.jar,jarjar-aether-api-1.0.0.v20140518.jar,jarjar-aether-transport-wagon-1.0.0.v20140518.jar,jarjar-aether-connector-basic-1.0.0.v20140518.jar,jarjar-wagon-provider-api-2.8.jar,jarjar-plexus-sec-dispatcher-1.3.jar,jarjar-maven-artifact-3.1.1.jar,jarjar-aether-spi-1.0.0.v20140518.jar,jarjar-maven-settings-3.1.1.jar,jarjar-plexus-container-default-1.5.5.jar,commons-lang-2.6.jar,commons-io-1.4.jar,slf4j-api-1.7.7.jar,aether-ant-tasks-1.0.0.v20140518.jar,jsch-0.1.51.jar,gson-2.2.4.jar,xbean-reflect-3.4.jar,bcprov-jdk15-1.46.jar,ivy-2.3.0.jar,jcl-over-slf4j-1.7.7.jar,httpcore-4.2.2.jar,commons-codec-1.6.jar,jcifs-1.3.17.jar,httpclient-4.2.2.jar,org.eclipse.sisu.plexus-0.1.1.jar,aether-transport-classpath-1.0.0.v20140518.jar,maven-repository-metadata-3.1.1.jar,maven-aether-provider-3.1.1.jar,aether-transport-file-1.0.0.v20140518.jar,aether-api-1.0.0.v20140518.jar,aether-spi-1.0.0.v20140518.jar,maven-model-3.1.1.jar,maven-settings-builder-3.1.1.jar,plexus-utils-2.1.jar,aether-connector-basic-1.0.0.v20140518.jar,maven-settings-3.1.1.jar,aether-util-1.0.0.v20140518.jar,maven-model-builder-3.1.1.jar,plexus-cipher-1.7.jar,aether-impl-1.0.0.v20140518.jar,plexus-sec-dispatcher-1.3.jar,aether-transport-http-1.0.0.v20140518.jar,plexus-interpolation-1.16.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar' >gradle-dependency-management-classpath.properties
echo '#module definition
#Wed Jan 21 06:46:58 UTC 2015
projects=gradle-core,gradle-reporting,gradle-plugins,gradle-platform-native,gradle-language-native,gradle-dependency-management
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-diagnostics-classpath.properties
echo '#module definition
#Wed Jan 21 06:24:51 UTC 2015
projects=
runtime=' >gradle-docs-classpath.properties
echo '#module definition
#Wed Jan 21 06:39:03 UTC 2015
projects=gradle-core,gradle-plugins
runtime=javax.inject-1.jar' >gradle-ear-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:01 UTC 2015
projects=gradle-scala,gradle-core,gradle-launcher,gradle-plugins,gradle-ear,gradle-tooling-api
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,javax.inject-1.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,xercesImpl-2.10.0.jar,jdom-1.0.jar,jaxen-1.1.4.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-ide-classpath.properties
echo '#module definition
#Wed Jan 21 06:54:00 UTC 2015
projects=gradle-core,gradle-ide,gradle-platform-native,gradle-language-native
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-ide-native-classpath.properties
echo '#module definition
#Wed Jan 21 06:55:04 UTC 2015
projects=gradle-core,gradle-publish,gradle-plugins,gradle-dependency-management
runtime=' >gradle-ivy-classpath.properties
echo '#module definition
#Wed Jan 21 06:56:06 UTC 2015
projects=gradle-core,gradle-plugins,gradle-reporting
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-jacoco-classpath.properties
echo '#module definition
#Wed Jan 21 06:56:57 UTC 2015
projects=gradle-core,gradle-plugins,gradle-dependency-management
runtime=groovy-all-2.3.6.jar,rhino-1.7R3.jar,gson-2.2.4.jar,simple-4.1.21.jar,javax.inject-1.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-javascript-classpath.properties
echo '#module definition
#Wed Jan 21 06:58:00 UTC 2015
projects=gradle-core,gradle-plugins
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,jetty-server-9.2.0.v20140526.jar,jetty-util-9.2.0.v20140526.jar,javax.servlet-api-3.1.0.jar,jetty-plus-9.2.3.v20140905.jar,jetty-jsp-9.2.0.v20140526.jar,jetty-annotations-9.2.0.v20140526.jar,geronimo-annotation_1.0_spec-1.0.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar,jetty-webapp-9.2.0.v20140526.jar,jetty-xml-9.2.0.v20140526.jar,jetty-security-9.2.0.v20140526.jar,jetty-servlet-9.2.0.v20140526.jar,core-3.1.1.jar' >gradle-jetty-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:00 UTC 2015
projects=gradle-platform-jvm,gradle-language-java
runtime=' >gradle-language-groovy-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:03 UTC 2015
projects=gradle-core,gradle-platform-jvm,gradle-language-jvm
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-language-java-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:05 UTC 2015
projects=gradle-platform-jvm,gradle-platform-base
runtime=' >gradle-language-jvm-classpath.properties
echo '#module definition
#Wed Jan 21 06:44:40 UTC 2015
projects=gradle-core,gradle-platform-native
runtime=' >gradle-language-native-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:04 UTC 2015
projects=gradle-base-services,gradle-core,gradle-cli,gradle-ui,gradle-tooling-api,gradle-native
runtime=slf4j-api-1.7.7.jar' >gradle-launcher-classpath.properties
echo '#module definition
#Wed Jan 21 06:58:53 UTC 2015
projects=gradle-core,gradle-dependency-management,gradle-plugins,gradle-publish
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,aether-ant-tasks-1.0.0.v20140518.jar,pmaven-common-0.8-20100325.jar,pmaven-groovy-0.8-20100325.jar,plexus-component-annotations-1.5.2.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar,org.eclipse.sisu.plexus-0.1.1.jar,aether-transport-classpath-1.0.0.v20140518.jar,maven-repository-metadata-3.1.1.jar,maven-aether-provider-3.1.1.jar,jcl-over-slf4j-1.7.7.jar,httpcore-4.2.2.jar,jcifs-1.3.17.jar,httpclient-4.2.2.jar,aether-transport-file-1.0.0.v20140518.jar,aether-api-1.0.0.v20140518.jar,aether-spi-1.0.0.v20140518.jar,maven-model-3.1.1.jar,maven-settings-builder-3.1.1.jar,plexus-utils-2.1.jar,aether-connector-basic-1.0.0.v20140518.jar,maven-settings-3.1.1.jar,aether-util-1.0.0.v20140518.jar,maven-model-builder-3.1.1.jar,plexus-cipher-1.7.jar,aether-impl-1.0.0.v20140518.jar,plexus-sec-dispatcher-1.3.jar,aether-transport-http-1.0.0.v20140518.jar,plexus-interpolation-1.16.jar' >gradle-maven-classpath.properties
echo '#module definition
#Wed Jan 21 06:17:45 UTC 2015
projects=gradle-base-services
runtime=slf4j-api-1.7.7.jar,guava-jdk5-17.0.jar,kryo-2.20.jar,asm-all-5.0.3.jar,reflectasm-1.07.jar,minlog-1.2.jar,objenesis-1.2.jar' >gradle-messaging-classpath.properties
echo '#module definition
#Wed Jan 21 06:18:24 UTC 2015
projects=gradle-base-services
runtime=slf4j-api-1.7.7.jar,commons-lang-2.6.jar' >gradle-model-core-classpath.properties
echo '#module definition
#Wed Jan 21 06:18:49 UTC 2015
projects=gradle-base-services-groovy,gradle-model-core
runtime=slf4j-api-1.7.7.jar,groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-model-groovy-classpath.properties
echo '#module definition
#Wed Jan 21 06:19:05 UTC 2015
projects=gradle-base-services
runtime=commons-io-1.4.jar,slf4j-api-1.7.7.jar,jna-3.2.7.jar,native-platform-0.10.jar,jansi-1.11.jar,guava-jdk5-17.0.jar,jcip-annotations-1.0.jar' >gradle-native-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:04 UTC 2015
projects=
runtime=' >gradle-open-api-classpath.properties
echo '#module definition
#Wed Jan 21 06:59:51 UTC 2015
projects=gradle-core,gradle-plugins
runtime=groovy-all-2.3.6.jar,slf4j-api-1.7.7.jar,bndlib-1.50.0.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-osgi-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:08 UTC 2015
projects=gradle-core
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-platform-base-classpath.properties
echo '#module definition
#Wed Jan 21 06:34:51 UTC 2015
projects=gradle-platform-base,gradle-core
runtime=' >gradle-platform-jvm-classpath.properties
echo '#module definition
#Wed Jan 21 06:44:43 UTC 2015
projects=gradle-core,gradle-platform-base
runtime=groovy-all-2.3.6.jar,commons-io-1.4.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-platform-native-classpath.properties
echo '#module definition
#Wed Jan 21 07:00:21 UTC 2015
projects=gradle-core,gradle-plugins
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-plugin-development-classpath.properties
echo '#module definition
#Wed Jan 21 06:36:21 UTC 2015
projects=gradle-core,gradle-dependency-management,gradle-reporting,gradle-platform-jvm,gradle-language-jvm,gradle-language-java,gradle-language-groovy
runtime=groovy-all-2.3.6.jar,asm-all-5.0.3.jar,commons-io-1.4.jar,commons-lang-2.6.jar,junit-4.11.jar,slf4j-api-1.7.7.jar,commons-cli-1.2.jar,testng-6.8.8.jar,ant-1.9.4.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-junit-1.9.3.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,hamcrest-core-1.3.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,bsh-2.0b4.jar' >gradle-plugins-classpath.properties
echo '#module definition
#Wed Jan 21 07:00:41 UTC 2015
projects=gradle-core,gradle-dependency-management,gradle-resources-http
runtime=' >gradle-plugin-use-classpath.properties
echo '#module definition
#Wed Jan 21 06:55:07 UTC 2015
projects=gradle-core,gradle-dependency-management
runtime=' >gradle-publish-classpath.properties
echo '#module definition
#Wed Jan 21 06:36:24 UTC 2015
projects=gradle-core
runtime=groovy-all-2.3.6.jar,jatl-0.2.2.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar,commons-lang-2.6.jar' >gradle-reporting-classpath.properties
echo '#module definition
#Wed Jan 21 06:31:26 UTC 2015
projects=gradle-resources,gradle-base-services
runtime=httpclient-4.2.2.jar,commons-lang-2.6.jar,nekohtml-1.9.14.jar,httpcore-4.2.2.jar,commons-codec-1.6.jar,slf4j-api-1.7.7.jar,jcl-over-slf4j-1.7.7.jar,jcifs-1.3.17.jar,xml-apis-1.4.01.jar,xercesImpl-2.10.0.jar' >gradle-resources-http-classpath.properties
echo '#module definition
#Wed Jan 21 06:19:14 UTC 2015
projects=gradle-base-services,gradle-messaging
runtime=slf4j-api-1.7.7.jar,commons-io-1.4.jar' >gradle-resources-classpath.properties
echo '#module definition
#Wed Jan 21 06:50:50 UTC 2015
projects=gradle-core,gradle-language-jvm,gradle-plugins
runtime=groovy-all-2.3.6.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-scala-classpath.properties
echo '#module definition
#Wed Jan 21 07:01:23 UTC 2015
projects=gradle-core,gradle-plugins,gradle-maven
runtime=groovy-all-2.3.6.jar,bcpg-jdk15-1.46.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar,bcprov-jdk15-1.46.jar' >gradle-signing-classpath.properties
echo '#module definition
#Wed Jan 21 07:02:04 UTC 2015
projects=gradle-core,gradle-plugins,gradle-jacoco
runtime=groovy-all-2.3.6.jar,guava-jdk5-17.0.jar,slf4j-api-1.7.7.jar,javax.inject-1.jar,sonar-batch-bootstrapper-2.9.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,xml-apis-1.4.01.jar,dom4j-1.6.1.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,jdom-1.0.jar,jaxen-1.1.4.jar,xercesImpl-2.10.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,hamcrest-core-1.3.jar,junit-4.11.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar,base64coder-2010-12-19.jar,commons-codec-1.6.jar,snakeyaml-1.12.jar,testng-6.8.8.jar' >gradle-sonar-classpath.properties
echo '#module definition
#Wed Jan 21 06:39:38 UTC 2015
projects=gradle-core,gradle-messaging,gradle-wrapper,gradle-base-services
runtime=slf4j-api-1.7.7.jar' >gradle-tooling-api-classpath.properties
echo '#module definition
#Wed Jan 21 06:48:14 UTC 2015
projects=gradle-core,gradle-open-api
runtime=groovy-all-2.3.6.jar,dom4j-1.6.1.jar,commons-io-1.4.jar,slf4j-api-1.7.7.jar,jaxen-1.1.4.jar,jcommander-1.35.jar,qdox-1.12.1.jar,ivy-2.3.0.jar,hawtjni-runtime-1.8.jar,jansi-native-1.5.jar,jansi-1.11.jar,jline-2.11.jar,multiverse-core-0.7.0.jar,extra166y-1.7.0.jar,jzlib-any.jar,netty-3.6.6.Final.jar,org.osgi.core-1.4.0.jar,jcsp-1.1-rc5.jar,gpars-1.2.1.jar,ant-antlr-1.9.3.jar,ant-launcher-1.9.4.jar,ant-1.9.4.jar,ant-junit-1.9.3.jar,hamcrest-core-1.3.jar,junit-4.11.jar,commons-codec-any.jar,base64coder-2010-12-19.jar,snakeyaml-1.12.jar,testng-6.8.8.jar,xml-apis-1.4.01.jar,jdom-1.1.3.jar,serializer-2.7.1.jar,xalan-2.7.1.jar,xercesImpl-2.10.0.jar,jdom-1.0.jar,jdom2-2.0.5.jar,joda-convert-1.2.jar,joda-time-1.6.jar,stax-api-1.0.1.jar,stax-1.2.0.jar,xml-resolver-any.jar,isorelax-20090621.jar,relaxngDatatype-20020414.jar,xsdlib-2013.6.1.jar,msv-core-any.jar,stax-api-1.0-2.jar,stax2-api-3.1.1.jar,woodstox-core-asl-3.2.7.jar,xom-1.1.jar,kxml2-min-2.3.0.jar,kxml2-2.3.0.jar,asm-all-5.0.3.jar,cglib-2.2.jar,jettison-1.2.jar,xstream-1.4.7.jar,bsf-2.4.0.jar,mail-1.5.3.jar,geronimo-jms_1.1_spec-1.0.jar,log4j-1.2.17.jar,commons-logging-1.1.1.jar' >gradle-ui-classpath.properties
echo '#module definition
#Wed Jan 21 06:38:22 UTC 2015
projects=gradle-cli
runtime=' >gradle-wrapper-classpath.properties

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
    sed -i /runtime=/d $resources_dir/$mod-classpath.properties
    echo "runtime=$dep_runtime" >>$resources_dir/$mod-classpath.properties
    (cd ./subprojects/${mod/gradle-/}/src/main/resources && jar uf $jar .)
    classpath=$classpath:$jar
done
