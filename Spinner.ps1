[String]$str = "loading"
[String]$strUP = $str.ToUpper()
while($true){
    for($cpt=0;$cpt -lt 4;$cpt++){
    
        switch($cpt){
            0 { $spin = "|"
                $dots = ""}
            1 { $spin = "/"
                $dots = "."}
            2 { $spin = "-"
                $dots = ".."}
            3 { $spin = "\"
                $dots = "..."}   
        }

        

        Write-Host "[$spin] $dots"
        sleep -Milliseconds 75
        cls

    }

    <#for($i=0;$i -lt $str.Length;$i++){

        echo $str.Replace($str[$i],$strUP[$i])
        sleep -Milliseconds 100
        
    }#>
}    