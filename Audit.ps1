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