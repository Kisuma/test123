Get-Command -CommandType "Cmdlet" | Where-Object {$_.Name -like "Get-*"}

Get-Service | Where Status -EQ Running | Select Name | Export-Csv "services.csv"

Get-ChildItem "C:\" -Recurse | Where-Object {$_.Length -gt 300mb}