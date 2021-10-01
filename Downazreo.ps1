$Tempdir = "C:\Avocet"

if(!(Test-Path -Path $tempdir )){
    New-Item -ItemType directory -Path $tempdir
    Write-Host "Temp Created"
}
else
{
  Write-Host "Folder already exists"
}

$NoteFile = "$Tempdir\reboot.txt"

if(!(Test-Path -Path $NoteFile )){
    New-Item $NoteFile
    Write-Host "File Created"
}
else
{
  Write-Host "File already exists"
}


Add-Content "$Tempdir\reboot.txt" 'Test1'
Add-Content "$Tempdir\reboot.txt" 'Test2'