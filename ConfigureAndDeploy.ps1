# Repo Information
$organization= "SensiaGlobal"
$projectName = "AvocetProjects"
$repoName= "AVMBinaries_2017.2_Updates"
$filePath= "AVMBinaries_2017.2_Updates"
#$token = "5rbirpa2atev5rhpmrczz64hfxa7go55a2s2yu6ehxxxxxxx"

# Encode the Personal Access Token (PAT) to Base64 String
#$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f "",$token)))

#$OutFilePath = "C:\Avocet\AVMBinaries_2017.2_Updates.zip"

#Write-Host "Download file" $GitFilePath "to" $OutFilePath

#$uriGetFile = "https://dev.azure.com/SensiaGlobal/4541bd6b-4d4b-474c-9cb1-7a43d0e16c71/_apis/git/repositories/afeb3637-cf9b-4924-9363-6f83e4eb92a2/items?path=/&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"

#Write-Host "Url:" $uriGetFile

#$wc = New-Object System.Net.WebClient
#$wc.Headers["Authorization"] = "Basic {0}" -f $base64AuthInfo
#$wc.Headers["Content-Type"] = "application/json";
#$wc.DownloadFile($uriGetFile, $OutFilePath)


#cd "C:\Program Files\7-Zip"
#.\7z.exe x (-join("C:\Avocet\","AVMBinaries_2017.2_Updates",".zip")) -o"C:\Avocet" -r

#Copy-Item -Path  "C:\DONOTDELETE\odsConfig\*" -Destination "C:\AvocetODS\AvocetODSVM\Config" -Recurse

#cd C:\Avocet\AvocetVM\BatchHost.exe "/RebuildDatabase /appId=""TestProd"" /username=system /password=manager /force /noprompt"

$WebAppName = "AvocetWebAPI"
$SitePath = "C:\Avocet\AvocetWebService\"
$sp = Get-WebApplication -Name $WebAppName
#Write-host $sp
if($sp -eq $null)
{
        Write-host "Null"
        New-WebApplication -Name $WebAppName -Site "Default Web Site" -PhysicalPath $SitePath -ApplicationPool "DefaultAppPool"
}
else
{
        write-host "No Null"
        Remove-WebApplication -Name $WebAppName -Site "Default Web Site"
        New-WebApplication -Name $WebAppName -Site "Default Web Site" -PhysicalPath $SitePath -ApplicationPool "DefaultAppPool"
}


cd "C:\Avocet\"

$FilePath = "C:\Avocet\InstallerSilent.bat"

if(Test-Path($FilePath))  
{
	$FileContents = Get-Content $FilePath
	$Stage1 = $FileContents -replace "C:\AvocetDeployment","E:\AvocetDeployment"
	$Stage1 = $Stage1 -replace "27000@163.183.115.217","27000@sgnadwweb059ed"
	$Stage1 = $Stage1 -replace "-appServerCreateOrEdit 'Y'","-appServerCreateOrEdit 'N'"
	$Stage1 = $Stage1 -replace "-appId 'AppServer'","-appId 'TestProd'"
	
	$Stage1 | out-file $FilePath -Force
}

.\InstallerSilent.bat 





    