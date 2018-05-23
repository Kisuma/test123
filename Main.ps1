cls
Set-Location -Path "C:\Powershell"
. ".\AutoLoader.ps1"

function randPickItem($Array){
    $rand = Get-Random -Maximum $Array.Length -Minimum 0
    return $Array[$rand]
}

function setRandPrice($Item){
        return $Item.SetRandomPrice()
}

function rules(){

    Write-Host "Bienvenue au Juste Prix!`n"

    Write-Host "Vous allez devoir deviner le prix d'un objet choisi aléatoirement parmi notre stock !"
    Write-Host "Les prix peuvent aller de 100$ à 10000$ !"
    Write-Host "Vous avez droit à 10 tentatives pour deviner le prix ! Passé ces 10 tentatives, vous avez perdu !"
    Write-Host "Cependant, si vous trouvez le Juste Prix, vous gagnez l'objet convoité !"
    
    sleep(10)
    cls

    Write-Host "Bonne chance à vous !"
    sleep(2)
    cls

}

function casual(){

    Write-Host "Bonjour et bienvenue au Juste Prix !"
    [String]$skip = Read-Host "Souhaitez-vous voir les règles ?"
    if($skip -like "OUI".ToLower()){
        rules
    }

}

<#function difficultyMode($Item){

    Write-Host "----------------------------"
    Write-Host "+ CHOISISSEZ LA DIFFICULTE +"
    Write-Host "+                          +"
    Write-Host "+     1 - Easy Mode        +"
    Write-Host "+     2 - Normal Mode      +"
    Write-Host "+     3 - Hard Mode        +"
    Write-Host "----------------------------"

    $choice = Read-Host "Quel est votre choix ?"

    switch($choice){
    1 {[int]$Price = $Item.SetRandomPriceEasy()
        $Player.setLives(20)
        return $Price}
    2 {[int]$Price = $Item.SetRandomPriceNormal()
        $Player.setLives(10)
        return $Price}
    3 {[int]$Price = $Item.SetRandomPriceHard()
        $Player.setLives(10)
        return $Price}
    666 {[int]$Price = $Item.SetRandomPriceHard()
        $Player.setLives(5)
        return $Price}
    default {return Write-Host "Choix incorrect."}
    }
}
#>

function main(){
    
    casual
    $Player.name = Read-Host "Quel est votre nom ?"
    sleep(1)
    cls
    [int] $HP = $Player.lives
    $Item = randPickItem($ObjectArray)
    #[int]$Price = difficultyMode($Item)
    cls
    [int]$Price = setRandPrice($Item)
    Write-Host "Vies restantes $HP :" $Player.DisplayLives($HP)

    while($true){
        
        $Item.Display()
        $Propose = Read-Host "`nQuel prix proposez-vous pour cet objet ?" 
        
        if($Propose -eq $Price){
            
            Write-Host "Félicitations $($Player.name) ! Vous avez gagné ce magnifique $Item !"
            Write-Host "Le prix était de $Price$ !"
            break

        }elseif($Propose -lt $Price){
            
            Write-Host "Plus cher !"
            sleep(1)
            $HP--
            cls
            Write-Host "Vies restantes $HP :" $Player.DisplayLives($HP)

        }else{
            
            Write-Host "Moins cher !"
            sleep(1)
            $HP--
            cls
            Write-Host "Vies restantes $HP :" $Player.DisplayLives($HP)

        }

        if($HP -eq 0){

            Write-Host "`nVous avez épuisé toutes vos vies !`n"
            Write-Host "Le prix était de $Price$ !`n"
            Write-Host "Retentez votre chance une prochaine fois !`n"
            break
        }
    }    

}

main