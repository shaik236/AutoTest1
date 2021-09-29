# Repo Information
$organization= "SensiaGlobal"
$projectName = "AvocetProjects"
$repoName= "AVMBinaries_2017.2_Updates"
$filePath= "AVMBinaries_2017.2_Updates"
$token = "5rbirpa2atev5rhpmrczz64hfxa7go55a2s2yu6ehxxxxxxx"

# Encode the Personal Access Token (PAT) to Base64 String
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f "",$token)))

# Construct the download URL
#$url = "https://dev.azure.com/$organization/$projectName/_apis/git/repositories/$repoName/items?path=$filePath&download=true&api-version=5.0"

# Download the file
#$result = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/text" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} | Out-File $filePath


$teamProject = $env:SYSTEM_TEAMPROJECT
$orgUrl = "https://dev.azure.com/$organization/$projectName"
$repoName = "AVMBinaries_2017.2_Updates"
$GitFilePath = "/AppServer"
$OutFilePath = "D:\testPS\AVMBinaries_2017.2_Updates.zip"

        Write-Host "Download file" $GitFilePath "to" $OutFilePath
     
        $uriGetFile = "https://dev.azure.com/SensiaGlobal/4541bd6b-4d4b-474c-9cb1-7a43d0e16c71/_apis/git/repositories/afeb3637-cf9b-4924-9363-6f83e4eb92a2/items?path=/&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
    
       Write-Host "Url:" $uriGetFile
    
        $wc = New-Object System.Net.WebClient
        $wc.Headers["Authorization"] = "Basic {0}" -f $base64AuthInfo
        $wc.Headers["Content-Type"] = "application/json";
        $wc.DownloadFile($uriGetFile, $OutFilePath)
    