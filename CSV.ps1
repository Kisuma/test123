cls

$file = Get-Content "C:\Powershell\departement.csv"

$who = Read-Host "Sur quel département souhaitez vous des informations ?"

foreach ($item in $file){
    if($item -like $who){
        for($i=1;$i -lt 7;$i++){
            Write-Host $args.$i 
            }
    }
}

