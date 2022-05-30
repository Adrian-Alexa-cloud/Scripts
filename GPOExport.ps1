# Needs to run on the DC
# Will create new folder under "C:\temp\GPOs\" with all the exported GPOs

$FQDN = (Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem).Domain
New-Item -Path "C:\Temp\" -Name "GPOs" -ItemType Directory
$path = "C:\temp\GPOs\"

Get-GPO -all | foreach {
    $displayname = $_.Id
    $xml = ".xml"
    Get-GPOReport -name $_.DisplayName -Domain $FQDN -Server $env:computername -ReportType XML -Path ($path+$displayname+$xml)
    }
