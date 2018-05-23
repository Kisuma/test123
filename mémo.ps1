$fruits = @("Pomme", "Cerise", "Banane", "Poire", "Abricot")
$fruits[3]

$user = @{Nom="Le Gac"; Prenom="Glenn"; Age=28; Role="Prof"}
$user.Prenom

foreach($item in $fruits){
    Write-Output $item;
    }

for ($i=0; $i -lt 10;$i++){
    Write-Output $i;
}

function addOne
{
    param($nombre)
    [int]$res = [int]$nombre+1
    echo "$nombre+1 = $res"
    }
addOne(1)