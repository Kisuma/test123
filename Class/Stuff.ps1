#
# Classe abstraite
#

<#
   ! Définition des méthodes et propriétés dont les objets enfants hériteront    
#>


Class Stuff {
    
    [int] $Price

    [int] SetRandomPrice()
    {
        $rand = (Get-Random -Maximum 1001 -Minimum 100) + (Get-Random -Maximum 101 -Minimum 10) + (Get-Random -Maximum 11 -Minimum 1)
        $this.Price = $rand
        return $rand
    }

    [int] SetRandomPriceEasy()
    {
        $rand = (Get-Random -Maximum 101 -Minimum 1) + (Get-Random -Maximum 11 -Minimum 1)
        $this.Price = $rand
        return $rand
    }

    [int] SetRandomPriceNormal()
    {
        $rand = (Get-Random -Maximum 1001 -Minimum 100) + (Get-Random -Maximum 101 -Minimum 10) + (Get-Random -Maximum 11 -Minimum 1)
        $this.Price = $rand
        return $rand
    }

    [int] SetRandomPriceHard()
    {
        $rand = (Get-Random -Maximum 10001 -Minimum 1000) + (Get-Random -Maximum 1001 -Minimum 100) + (Get-Random -Maximum 101 -Minimum 10) + (Get-Random -Maximum 11 -Minimum 1)
        $this.Price = $rand
        return $rand
    }
}