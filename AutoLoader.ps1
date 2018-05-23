. ".\Class\Stuff.ps1"

$Files = Get-ChildItem -path ".\Class"

foreach ($f in $Files) {
    if ($f.Name -ne "Stuff.ps1") {
        . ".\Class\$($f.Name)"
    }
}

$ObjectArray = @(
    $AK47, 
    $SIG, 
    $Magnum,
    $Sniper,
    $AUG
);