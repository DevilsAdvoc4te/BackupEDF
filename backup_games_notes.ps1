# https://social.technet.microsoft.com/wiki/contents/articles/1073.robocopy-and-a-few-examples.aspx

# /E - Copy includes empty folders
# /MIR - Mirror all directories, empty or not, and purge all files
#        that don't exist anymore.
# source-drive:\DIR - Source drive.
# destination-drive:\DIR - Destination drive.
# /XA:H - Ignores hidden files (normally system files)
# Eg - Single file - robocopy C:\DIR C:\DIR2 file.name

# Makes a date variable, and then backs up files no older than 1 day.
# Example
#      set day=%date:~0,2%
#      set month=%date:~3,2%
#      set year=%date:~6,4%
#      Robocopy "c:\data" "c:\backup\data\%day%-%month%-%year%\" /MAXAGE:1

# Powershell
#$hash = (Get-ChildItem $logging\*) | Get-FileHash -Algorithm SHA1
#$hash.hash.ToLower()

# Create your own event log entry
#eventcreate /asdl Application /t Information /id 1000 /so Backup-Games /d "Successfully backed up." 2>1 null

# Redirect STDOUT and STDERR in powershell
#eventcreate /l Application /t Information /id 1000 /so Backup-Games /d "Backed up." 2>&1 | out-null

# House keeping.
$hashTable = @{};
$logging = "C:\logging"

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
