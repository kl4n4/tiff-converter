
$inputFolder = "input"

$files = @(Get-ChildItem $inputFolder/*.tif)
foreach ($file in $files) {
    $fileName = "$($file.BaseName)$($file.Extension)"
    Write-Output "convert: $fileName"

    # ToDo: testing only - use lines 12,13 instead of 
    $command = "echo" 
    $cmdArgs = Get-Random -input "1","4","8","16","32"
    # $command = "identify"
    # $cmdArgs = "-format '%[depth]' $fileName"
    
    $bitDepth = & $command $cmdArgs.Split(" ")
    If($bitDepth -eq 1) {
        Write-Output "run 1-bit convert here"
        # Todo
        & "echo" "your-arguments $fileName" 
    } else {
        Write-Output "run convert for all other bit depths here"
        # Todo
        & "echo" "your-arguments $fileName" 
    }
}
