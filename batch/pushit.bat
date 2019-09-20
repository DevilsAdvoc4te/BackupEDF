@echo off
rem The activation code found in N-central
rem This is located on the EDF tab on the device edit page
set ACTIVATIONCODE=2de3096d-15d84c

rem Is it running?
rem 0 = true, 1 = false, or you can switch by thresholds.
set SCANDETAIL1NAME=SD1431628_EDF_1
set SCANDETAIL1VALUE=0

rem Date
set SCANDETAIL2NAME=SD1431628_EDF_2
set SCANDETAIL2VALUE=%date%

rem Reported as Disk Usage in the XML
::set SCANDETAIL3NAME=SD1641748_EDF_6
::SET SCANDETAIL3VALUE=12
::dir "c:\windows\sol.exe"
::set TEST=%ERRORLEVEL%
::IF %TEST% == 1 SET SCANDETAIL3VALUE=0
::IF %TEST% == 0 SET SCANDETAIL3VALUE=1

set CPATH=axis\WEB-INF\lib\commons-collections-2.1.1.jar;axis\WEB-INF\lib\jline.jar;axis\WEB-INF\lib\axis.jar;axis\WEB-INF\lib\commons-digester.jar;axis\WEB-INF\lib\log4j-1.2.8.jar;axis\WEB-INF\lib\bcprov-jdk14-126.jar;axis\WEB-INF\lib\commons-discovery.jar;axis\WEB-INF\lib\jaxrpc.jar;axis\WEB-INF\lib\saaj.jar;axis\WEB-INF\lib\commons-beanutils.jar;axis\WEB-INF\lib\commons-logging.jar;axis\WEB-INF\lib\wsdl4j.jar;axis\WEB-INF\lib\dmsapi.jar;jar\EDFGenApp.jar;resources

echo Activation Key = %ACTIVATIONCODE%
echo %SCANDETAIL1NAME%:%SCANDETAIL1VALUE%
echo %SCANDETAIL2NAME%:%SCANDETAIL2VALUE%
::echo %SCANDETAIL3NAME%:%SCANDETAIL3VALUE%

java -cp %CPATH% com.nable.server.edf.GenericApp.EDFGenericApp %ACTIVATIONCODE% "%SCANDETAIL1NAME%":"%SCANDETAIL1VALUE%" "%SCANDETAIL2NAME%":"%SCANDETAIL2VALUE%" 

::"%SCANDETAIL3NAME%":"%SCANDETAIL3VALUE%"


