$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

$DesktopPath = "DesktopImagePath"

$DesktopStatus = "DesktopImageStatus"

$DesktopUrl = "DesktopImageUrl"

$StatusValue = "1"

$url = "https://vergosafebackup.blob.core.windows.net/intunepublic/small_Logo_strap_grad.jpg"

$DesktopImageValue = "C:\MDM\wallpaper.jpg"

$directory = "C:\MDM\"

If ((Test-Path -Path $directory) -eq $false)

{

New-Item -Path $directory -ItemType directory

}

$wc = New-Object System.Net.WebClient

$wc.DownloadFile($url, $DesktopImageValue)

if (!(Test-Path $RegKeyPath))

{

Write-Host "Creating registry path $($RegKeyPath)."

New-Item -Path $RegKeyPath -Force | Out-Null

}

New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null

New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null

New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
