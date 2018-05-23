Class Player {

    [int] $lives = 20
    [String] $name

    [int] setLives($newLives){

        $this.lives = $newLives
        return $this.lives
        
    }

    [int] getLives(){
        return $this.lives
    }

    [String] DisplayLives($HP){

        [String] $str = ""

        for($i=1;$i -le $HP;$i++){
            $str+="♥"
        }

        return $str
    }

}

$Player = New-Object -TypeName Player