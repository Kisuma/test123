<# -----------------------------------------------------------
                CALCULATRICE EN POWERSHELL
   -----------------------------------------------------------
#>
cls
Write-Host
Write-Host "Bienvenue sur la calculatrice"
sleep(1)

$optab = @("+","-","/","*")

do{
cls
$res = 0

#Demande les valeurs de l'opération à l'utilisateur
[float]$n1 = Read-Host "Entrez votre premier chiffre"
$op = Read-Host "Entrez votre opérande"
[float]$n2 = Read-Host "Entrez votre second chiffre"

#Vérifie si n1 et n2 sont bien de type integer et si l'opérande fait partie de optab.
if(($n1 -isnot [float]) -or ($n2 -isnot [float]) -or ($optab -notcontains $op)){
    Write-Host
    Write-Host "Les valeurs rentrées sont invalides"
    break
}

#Attribue le type d'opération en fonction de la variable
switch($op){

    + { $res = $n1 + $n2 }
    - { $res = $n1 - $n2 }
    * { $res = $n1 * $n2 }
    / { $res = $n1 / $n2
        $mod = $n1 % $n2 }
    default { Write-Host "Opérande incorrect."
                break }
}


#Afficher le résultat de ou des opérations. Si c'est une division, il affiche aussi le modulo.
if($op -eq "/"){
Write-Host
Write-Host "Le résultat de l'opération"$n1 $op $n2" est "$res" et le modulo est "$mod 
}else{
Write-Host
Write-Host "Le résultat de l'opération"$n1 $op $n2" est "$res
}
Write-Host
#Demande à l'utilisateur s'il veut continuer à utiliser la calculatrice.
$continue = Read-Host "Voulez-vous faire une nouvelle opération ?"
}while($continue -like "oui")