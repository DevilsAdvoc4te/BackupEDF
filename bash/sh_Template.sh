# The activation code found in N-central
# This is located on the EDF tab on the device edit page
ACTIVATIONCODE=__ACTIVATIONCODE__

# This is your first scan detail, as specified in your XML service file.
SCANDETAIL1NAME="__SCANDETAIL00NAME__"
SCANDETAIL1VALUE=__SCANDETAIL00VALUE__

# This is your second scan detail, as specified in your XML service file.
SCANDETAIL2NAME="__SCANDETAIL01NAME__"
SCANDETAIL2VALUE=__SCANDETAIL01VALUE__

# This is your third scan detail, as specified in your XML service file.
SCANDETAIL3NAME="__SCANDETAIL02NAME__"
SCANDETAIL3VALUE=__SCANDETAIL02VALUE__"

# Add additional scan detail as necessary


# Debugging statements
#echo Activation Code: $ACTIVATIONCODE
#echo "$SCANDETAIL1NAME":\"$SCANDETAIL1VALUE\"
#echo "$SCANDETAIL2NAME":\"$SCANDETAIL2VALUE\"
#echo "$SCANDETAIL3NAME":\"$SCANDETAIL3VALUE\"

# the class path for java
CPATH=axis/WEB-INF/lib/commons-collections-2.1.1.jar:axis/WEB-INF/lib/jline.jar:axis/WEB-INF/lib/axis.jar:axis/WEB-INF/lib/commons-digester.jar:axis/WEB-INF/lib/log4j-1.2.8.jar:axis/WEB-INF/lib/bcprov-jdk14-126.jar:axis/WEB-INF/lib/commons-discovery.jar:axis/WEB-INF/lib/jaxrpc.jar:axis/WEB-INF/lib/saaj.jar:axis/WEB-INF/lib/commons-beanutils.jar:axis/WEB-INF/lib/commons-logging.jar:axis/WEB-INF/lib/wsdl4j.jar:axis/WEB-INF/lib/dmsapi.jar:jar/EDFGenApp.jar:resources

# go!  any additional scandetails can be added to the end of the line in a simillar manner
java -cp $CPATH com.nable.server.edf.GenericApp.EDFGenericApp $ACTIVATIONCODE "$SCANDETAIL1NAME:$SCANDETAIL1VALUE" "$SCANDETAIL2NAME:$SCANDETAIL2VALUE" "$SCANDETAIL3NAME:$SCANDETAIL3VALUE"

