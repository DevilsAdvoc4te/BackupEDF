# The activation code found in N-central
ACTIVATIONCODE=3036baf6-639d

# Count the number of instances found
SCANDETAIL1NAME="EDF_25501_REGCOUNT"
SCANDETAIL1VALUE=`grep -i warning ./security.log | wc -l | sed 's/^ *//'`

# The string that was found
SCANDETAIL2NAME="EDF_25501_REGLINE"
SCANDETAIL2VALUE=`grep -i warning ./security.log | head -1`

# Debugging statements
#echo Activation Code: $ACTIVATIONCODE
#echo "$SCANDETAIL1NAME":\"$SCANDETAIL1VALUE\"
#echo "$SCANDETAIL2NAME":\"$SCANDETAIL2VALUE\"

# the class path for java
CPATH=axis/WEB-INF/lib/commons-collections-2.1.1.jar:axis/WEB-INF/lib/jline.jar:axis/WEB-INF/lib/axis.jar:axis/WEB-INF/lib/commons-digester.jar:axis/WEB-INF/lib/log4j-1.2.8.jar:axis/WEB-INF/lib/bcprov-jdk14-126.jar:axis/WEB-INF/lib/commons-discovery.jar:axis/WEB-INF/lib/jaxrpc.jar:axis/WEB-INF/lib/saaj.jar:axis/WEB-INF/lib/commons-beanutils.jar:axis/WEB-INF/lib/commons-logging.jar:axis/WEB-INF/lib/wsdl4j.jar:axis/WEB-INF/lib/dmsapi.jar:jar/EDFGenApp.jar:resources
#CPATH=axis/WEB-INF/lib/commons-collections-2.1.1.jar:axis/WEB-INF/lib/jline.jar:axis/WEB-INF/lib/axis.jar:axis/WEB-INF/lib/commons-digester.jar:axis/WEB-INF/lib/log4j-1.2.8.jar:axis/WEB-INF/lib/bcprov-jdk14-126.jar:axis/WEB-INF/lib/commons-discovery.jar:axis/WEB-INF/lib/jaxrpc.jar:axis/WEB-INF/lib/saaj.jar:axis/WEB-INF/lib/commons-beanutils.jar:axis/WEB-INF/lib/commons-logging.jar:axis/WEB-INF/lib/wsdl4j.jar:axis/WEB-INF/lib/dmsapi.jar:bin

# go!  any additional scandetails can be added to the end of the line in a simillar manner
java -cp $CPATH com.nable.server.edf.GenericApp.EDFGenericApp $ACTIVATIONCODE "$SCANDETAIL1NAME:$SCANDETAIL1VALUE" "$SCANDETAIL2NAME:$SCANDETAIL2VALUE"

