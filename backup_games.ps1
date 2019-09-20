# House keeping.
$hashTable = @{};
$logging = "C:\logging";
$activationcode = "2de3096d-15d84c";
$CPATH="axis\WEB-INF\lib\commons-collections-2.1.1.jar;axis\WEB-INF\lib\jline.jar;axis\WEB-INF\lib\axis.jar;axis\WEB-INF\lib\commons-digester.jar;axis\WEB-INF\lib\log4j-1.2.8.jar;axis\WEB-INF\lib\bcprov-jdk14-126.jar;axis\WEB-INF\lib\commons-discovery.jar;axis\WEB-INF\lib\jaxrpc.jar;axis\WEB-INF\lib\saaj.jar;axis\WEB-INF\lib\commons-beanutils.jar;axis\WEB-INF\lib\commons-logging.jar;axis\WEB-INF\lib\wsdl4j.jar;axis\WEB-INF\lib\dmsapi.jar;jar\EDFGenApp.jar;resources";
$argu = "{0} {1}:{2} {3}:{4}" -f $activationcode, $scanDetailName1, $scanDetailValue1, $scanDetailName2, $scanDetailValue2;
$fullArgs = "-cp $CPATH com.nable.server.edf.GenericApp.EDFGenericApp $argu";

###############################################################################
# DEBUG: Only used for DEBUG environment
# This clean up needs to be used for long term usage, delete based on high 
# count(1000) and age(6 months).
$cleanUp = Get-ChildItem $logging\robo_*
if ($cleanUp.Length -ge 4) {
    $cleanUp | Sort-Object -Property CreationTime | Select-Object -First 3 | Remove-Item
}
###############################################################################

function cleanUpString ($type) {
    $type = $type.Trim();
    $type = $type -replace ':','';
    $type = $type -replace '\s+',' ';
    return [array]$type -split ' ';
}

function subHashBuilder ($stats) {
    $tempHash = @{};
    for ($i = 1; $i -lt $stats.Count; $i++) {
        $tempHash.Add($headers[$i - 1], $stats[$i]);
    }
    $tempHash;
}

$roboLog = Get-Date -format "robo_yyyy-MM-dd_hh-mm-ss.lo\g";
$roboLog;

robocopy /MIR C:\Temp C:\Temp2 /BYTES /LOG:$logging\$roboLog 2>&1 | Out-Null

$hash = Get-Childitem $logging\$roboLog | Get-FileHash -Algorithm SHA1;

If (Test-Path "$logging\$roboLog") {
    $hash.hash.ToLower();
}

# Need to pull HEADERS, and TYPE from the robocopy output file, to parse later.
$headers = Get-Content $logging\$roboLog | Where-Object { $_ -like "*Total*Copied*" };
$dirList = Get-Content $logging\$roboLog | Where-Object { $_ -like "*Dirs : *" };
$fileList = Get-Content $logging\$roboLog | Where-Object { $_ -like "   Files : *" };
$byteList = Get-Content $logging\$roboLog | Where-Object { $_ -like "*Bytes : *" };

# Main brunt of the work to call into functions to trim white space, and place
# data into hash tables.
$headers = cleanUpString $headers;
$dirList = cleanUpString $dirList;
$dirHash = subHashBuilder $dirList;
$fileList = cleanUpString $fileList;
$fileHash = subHashBuilder $fileList;
$byteList = cleanUpString $byteList;
$byteHash = subHashBuilder $byteList;

$hashTable = @{
    $dirList[0] = $dirHash;
    $fileList[0] = $fileHash;
    $byteList[0] = $byteHash;
}

Write-Host "DEBUG: 101";
$hashTable.Dirs.Total;
$hashTable.Files.Copied;
$hashTable.Bytes.Failed;
Write-Host "DEBUG: END";

# Is it running?
# 0 = true, 1 = false, or you can switch by thresholds.
$scanDetailName1 = "SD1431628_EDF_1";
$scanDetailValue1 = 0;

# Date
$scanDetailName2 = "SD1431628_EDF_2";
$scanDetailValue2 = Get-Date -Format yyyy;

Write-Host Activation Key = $activationcode;
Write-Host "$scanDetailName1 = $scanDetailValue1";
Write-Host "$scanDetailName2 = $scanDetailValue2";

Start-Process java -ArgumentList "$fullArgs" -Wait -NoNewWindow