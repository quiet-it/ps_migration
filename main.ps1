$FoldersToCopy = @(
    'Desktop'
    'Downloads'
    'Favorites'
    'Documents'
    'Pictures'
    'Videos'
    'AppData'
    )

$user = [Environment]::UserName
$ConfirmComp = $null
$ConfirmUser = $null


$SourceRoot      = "C:\Users\$user"
$DestinationRoot = "C:\Users\$user.QUIET"

foreach( $Folder in $FoldersToCopy ){
    $Source      = Join-Path -Path $SourceRoot -ChildPath $Folder
    $Destination = Join-Path -Path $DestinationRoot -ChildPath $Folder

    if( -not ( Test-Path -Path $Source -PathType Container ) ){
        Write-Warning "Could not find path`t$Source"
        continue
        }

    Robocopy.exe $Source $Destination /E /IS /NP /NFL
    }
