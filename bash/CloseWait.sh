# The activation code found in N-central
ACTIVATIONCODE=52a2385c-639e

# Count the number of instances found
SCANDETAIL1NAME="EDF_CW_FIRSTLINE"
SCANDETAIL1VALUE=`netstat -anp | grep CLOSE_WAIT | grep nagent | head -1 `

# The string that was found
SCANDETAIL2NAME="EDF_CW_LASTLINE"
SCANDETAIL2VALUE=`netstat -anp | grep CLOSE_WAIT | grep nagent | tail -1 `

# The string that was found
SCANDETAIL3NAME="EDF_CW_COUNT"
SCANDETAIL3VALUE=`netstat -anp | grep CLOSE_WAIT | grep nagent | wc -l | sed 's/^ *//' `

# Debugging statements
#echo Activation Code: $ACTIVATIONCODE
#echo "$SCANDETAIL1NAME":\"$SCANDETAIL1VALUE\"
#echo "$SCANDETAIL2NAME":\"$SCANDETAIL2VALUE\"
#echo "$SCANDETAIL3NAME":\"$SCANDETAIL3VALUE\"

# the class path for java
CPATH=axis/WEB-INF/lib/commons-collections-2.1.1.jar:axis/WEB-INF/lib/jline.jar:axis/WEB-INF/lib/axis.jar:axis/WEB-INF/lib/commons-digester.jar:axis/WEB-INF/lib/log4j-1.2.8.jar:axis/WEB-INF/lib/bcprov-jdk14-126.jar:axis/WEB-INF/lib/commons-discovery.jar:axis/WEB-INF/lib/jaxrpc.jar:axis/WEB-INF/lib/saaj.jar:axis/WEB-INF/lib/commons-beanutils.jar:axis/WEB-INF/lib/commons-logging.jar:axis/WEB-INF/lib/wsdl4j.jar:axis/WEB-INF/lib/dmsapi.jar:jar/EDFGenApp.jar:resources

# go!  any additional scandetails can be added to the end of the line in a simillar manner
java -cp $CPATH com.nable.server.edf.GenericApp.EDFGenericApp $ACTIVATIONCODE "$SCANDETAIL1NAME:$SCANDETAIL1VALUE" "$SCANDETAIL2NAME:$SCANDETAIL2VALUE" "$SCANDETAIL3NAME:$SCANDETAIL3VALUE"

