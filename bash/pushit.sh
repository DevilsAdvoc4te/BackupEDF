# The activation code found in N-central
ACTIVATIONCODE=2de3096d-15d84c

# Count the number of instances found
SCANDETAIL1NAME="SD1431628_EDF_1"
SCANDETAIL1VALUE="0"

# The string that was found
SCANDETAIL2NAME="SD1431628_EDF_2"
SCANDETAIL2VALUE=`date`

# Debugging statements
echo Activation Code: $ACTIVATIONCODE
echo "$SCANDETAIL1NAME":\"$SCANDETAIL1VALUE\"
echo "$SCANDETAIL2NAME":\"$SCANDETAIL2VALUE\"

localPath=/mnt/c/Bitbucket/edf

# the class path for java
CPATH=$localPath/axis/WEB-INF/lib/commons-collections-2.1.1.jar:$localPath/axis/WEB-INF/lib/jline.jar:$localPath/axis/WEB-INF/lib/axis.jar:$localPath/axis/WEB-INF/lib/commons-digester.jar:$localPath/axis/WEB-INF/lib/log4j-1.2.8.jar:$localPath/axis/WEB-INF/lib/bcprov-jdk14-126.jar:$localPath/axis/WEB-INF/lib/commons-discovery.jar:$localPath/axis/WEB-INF/lib/jaxrpc.jar:$localPath/axis/WEB-INF/lib/saaj.jar:$localPath/axis/WEB-INF/lib/commons-beanutils.jar:$localPath/axis/WEB-INF/lib/commons-logging.jar:$localPath/axis/WEB-INF/lib/wsdl4j.jar:$localPath/axis/WEB-INF/lib/dmsapi.jar:$localPath/jar/EDFGenApp.jar:$localPath/resources
#CPATH=axis/WEB-INF/lib/commons-collections-2.1.1.jar:axis/WEB-INF/lib/jline.jar:axis/WEB-INF/lib/axis.jar:axis/WEB-INF/lib/commons-digester.jar:axis/WEB-INF/lib/log4j-1.2.8.jar:axis/WEB-INF/lib/bcprov-jdk14-126.jar:axis/WEB-INF/lib/commons-discovery.jar:axis/WEB-INF/lib/jaxrpc.jar:axis/WEB-INF/lib/saaj.jar:axis/WEB-INF/lib/commons-beanutils.jar:axis/WEB-INF/lib/commons-logging.jar:axis/WEB-INF/lib/wsdl4j.jar:axis/WEB-INF/lib/dmsapi.jar:bin

# go!  any additional scandetails can be added to the end of the line in a simillar manner
java -cp $CPATH "com.nable.server.edf.GenericApp.EDFGenericApp" $ACTIVATIONCODE "$SCANDETAIL1NAME:$SCANDETAIL1VALUE" "$SCANDETAIL2NAME:$SCANDETAIL2VALUE"

