@echo off
rem The activation code found in N-central
rem This is located on the EDF tab on the device edit page
set ACTIVATIONCODE=52a2385c-63a1

rem This is your first scan detail, as specified in your XML service file.
set SCANDETAIL1NAME=EDF25505_DATE
set SCANDETAIL1VALUE=%date%

rem This is your second scan detail, as specified in your XML service file.
set SCANDETAIL2NAME=EDF25505_TIME
set SCANDETAIL2VALUE=%time%

rem This is your third scan detail, as specified in your XML service file.
set SCANDETAIL3NAME=EDF25505_SOLITAIRE
dir "c:\windows\sol.exe"
set TEST=%ERRORLEVEL%
IF %TEST% == 1 SET SCANDETAIL3VALUE=0
IF %TEST% == 0 SET SCANDETAIL3VALUE=1

set CPATH=axis\WEB-INF\lib\commons-collections-2.1.1.jar;axis\WEB-INF\lib\jline.jar;axis\WEB-INF\lib\axis.jar;axis\WEB-INF\lib\commons-digester.jar;axis\WEB-INF\lib\log4j-1.2.8.jar;axis\WEB-INF\lib\bcprov-jdk14-126.jar;axis\WEB-INF\lib\commons-discovery.jar;axis\WEB-INF\lib\jaxrpc.jar;axis\WEB-INF\lib\saaj.jar;axis\WEB-INF\lib\commons-beanutils.jar;axis\WEB-INF\lib\commons-logging.jar;axis\WEB-INF\lib\wsdl4j.jar;axis\WEB-INF\lib\dmsapi.jar;jar\EDFGenApp.jar;resources

echo Activation Key = %ACTIVATIONCODE%
echo %SCANDETAIL1NAME%:%SCANDETAIL1VALUE%
echo %SCANDETAIL2NAME%:%SCANDETAIL2VALUE%
echo %SCANDETAIL3NAME%:%SCANDETAIL3VALUE%

java -cp %CPATH% com.nable.server.edf.GenericApp.EDFGenericApp %ACTIVATIONCODE% "%SCANDETAIL1NAME%":"%SCANDETAIL1VALUE%" "%SCANDETAIL2NAME%":"%SCANDETAIL2VALUE%" "%SCANDETAIL3NAME%":"%SCANDETAIL3VALUE%"


