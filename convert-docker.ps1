
$inputFolder = "input"

$files = @(Get-ChildItem $inputFolder/*.tif)
foreach ($file in $files) {
    $fileName = "$($file.BaseName)$($file.Extension)"
    Write-Output "convert: $fileName"

    $command = "docker"
    $cmdArgs = "run --rm -v '$(pwd)/input:/input:ro' -v '$(pwd)/output:/output' kl4n4/tiff-identify-bitdepth $fileName"
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
