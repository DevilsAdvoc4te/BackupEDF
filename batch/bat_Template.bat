@echo off
rem The activation code found in N-central
rem This is located on the EDF tab on the device edit page
set ACTIVATIONCODE=__ACTIVATIONCODE__

rem This is your first scan detail, as specified in your XML service file.
set SCANDETAIL01NAME=__SCANDETAIL00NAME__
set SCANDETAIL01VALUE=__SCANDETAIL00VALUE__

rem This is your second scan detail, as specified in your XML service file.
set SCANDETAIL02NAME=__SCANDETAIL01NAME__
set SCANDETAIL02VALUE=__SCANDETAIL01VALUE__

rem This is your third scan detail, as specified in your XML service file.
set SCANDETAIL03NAME=__SCANDETAIL02NAME__
set SCANDETAIL03VALUE=__SCANDETAIL02VALUE__

set CPATH=axis\WEB-INF\lib\commons-collections-2.1.1.jar;axis\WEB-INF\lib\jline.jar;axis\WEB-INF\lib\axis.jar;axis\WEB-INF\lib\commons-digester.jar;axis\WEB-INF\lib\log4j-1.2.8.jar;axis\WEB-INF\lib\bcprov-jdk14-126.jar;axis\WEB-INF\lib\commons-discovery.jar;axis\WEB-INF\lib\jaxrpc.jar;axis\WEB-INF\lib\saaj.jar;axis\WEB-INF\lib\commons-beanutils.jar;axis\WEB-INF\lib\commons-logging.jar;axis\WEB-INF\lib\wsdl4j.jar;axis\WEB-INF\lib\dmsapi.jar;jar\EDFGenApp.jar;resources

echo Activation Key = %ACTIVATIONCODE%
echo %SCANDETAIL01NAME%:%SCANDETAIL01VALUE%
echo %SCANDETAIL02NAME%:%SCANDETAIL02VALUE%
echo %SCANDETAIL03NAME%:%SCANDETAIL03VALUE%

java -cp %CPATH% com.nable.server.edf.GenericApp.EDFGenericApp %ACTIVATIONCODE% "%SCANDETAIL01NAME%":"%SCANDETAIL01VALUE%" "%SCANDETAIL02NAME%":"%SCANDETAIL02VALUE%" "%SCANDETAIL03NAME%":"%SCANDETAIL03VALUE%"


