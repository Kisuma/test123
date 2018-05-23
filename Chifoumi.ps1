cls

Write-Host "Bienvenue sur le jeu du Chifoumi`n"

Write-Host "----------------------"
Write-Host "+    1 - Pierre      +"
Write-Host "+    2 - Feuille     +"
Write-Host "+    3 - Ciseaux     +"
Write-Host "----------------------`n`n`n"



function drawCPU
{
$res = Get-Random -Maximum 3
return $res+1
}

function drawUser
{
return Read-Host "Que choisissez-vous ?"
}

function assignChoice
{
    param($choice)
    #do{
    #$isValid = $false
    switch($choice){
        1 { "Pierre" }
        2 { "Feuille" }
        3 { "Ciseaux" }
        
                  #$isValid = $true 
                  
                   }
    #}while($isValid)
}    

function compareResults($user,$cpu)
{

    Write-Host $cpu
    if($user -like "Pierre"){
        switch($cpu){

        #Pierre { $winner = "draw" }
        Feuille { $winner = "cpu" }
        Ciseaux { $winner = "user"}

        }

    }elseif($user -like "Feuille"){
        switch($cpu){

        Pierre { $winner = "user" }
        #Feuille { $winner = "draw" }
        Ciseaux { $winner = "cpu" }

        }

    }elseif($user -like "Ciseaux"){
        switch($cpu){

        Pierre { $winner = "cpu" }
        Feuille { $winner = "user" }
        #Ciseaux { $winner = "draw" }

        }

    }

    
    return Write-Host $winner

}


function main(){

while($true){
$user = assignChoice(drawUser)
$cpu = assignChoice(drawCPU)

Write-Host "User a choisi" $user
Write-Host "CPU a choisi" $cpu

$round = compareResults($user,$cpu)
Write-Host $round "a gagné"

if($round -like "user"){
    [int]$resUser += 1
}elseif($round -like "cpu"){
    [int]$resCPU += 1
}

if($resUser -like "3" -or $resCPU -like "3"){
Write-Host "La partie est terminée. Le score final est de"$resUser "pour User et"$resCPU "pour CPU" 
break
}
}

}

<#function scoreBoard
{
    param($ptUser,$ptCPU)
    Write-Host "+  "$ptUser" - User  +"
    Write-Host "+  "$ptCPU"  - CPU   +"
}#>

#main