Set-Location Env:

Get-WmiObject Win32_LogicalDisk | ft
$table = "COMPUTERNAME","OS","NUMBER_OF_PROCESSORS","USERNAME","SystemRoot"

foreach($item in $table){

    Get-ChildItem $item

}
Get-CimInstance -ClassName Win32_ComputerSystem | fl

Get-CimInstance -ClassName Win32_QuickFixEngineering | Select HotFixID,Description | ft

$os = Get-WmiObject -Class win32_operatingsystem
$os.ConvertToDateTime($os.LastBootUpTime)

Get-WmiObject -Class Win32_NetworkAdapterConfiguration | ft

Get-CimInstance -ClassName Win32_Service | Select-Object -Property State,Name,DisplayName

$Date=(Get-date).DateTime
 
#proc :
 
[int]$Processeur=(Get-WmiObject -Class win32_processor).LoadPercentage 
 
#ram = {
 
[int]$Taille_RAM_MAX=((Get-WmiObject -Class Win32_ComputerSystem ).TotalPhysicalMemory/1GB)
 
[int]$Taille_RAM_LIBRE=((Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory/1MB)
 
[int]$Taille_RAM_UTILISE=($Taille_RAM_MAX - $Taille_RAM_LIBRE)
write-host "Processeur utilisé :" $Processeur  " % de processeur utilisé"
 
write-host "Mémoire maximum de la machine : "$Taille_RAM_MAX GB
 
write-host "Mémoire Libre : "$Taille_RAM_LIBRE GB
 
write-host "Mémoire utilisée :" $Taille_RAM_UTILISE  " GB utilisée"
get-wmiobject -Class Win32_NetworkAdapterConfiguration | Where{$_.IpEnabled -Match "True"} | ft

Get-WmiObject -Class Win32_Product | select Name,Version | ft