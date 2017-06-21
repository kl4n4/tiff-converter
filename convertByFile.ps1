if($args.Length -lt 1) {
    Write-Error "Missing Argument: file path to input file"
    exit 1
}
$inputFile = $args[0]

Function ConvertToPdf{
    Param ($file)

    $fileName = $file.Fullname
    $output = "$(Split-Path $file)\$($file.BaseName).pdf"
    $command = "identify"
    $cmdArgs = "-format '%z' $fileName"
    if (!(Test-Path $output)) {
        Write-Output "identify $fileName and convert to $output"

        $bitDepth = & $command $cmdArgs.Split(" ")
        $bitDepth = $bitDepth.Split("'")[1]
        Write-Output " -> BitDepth of $fileName >$bitDepth<"
        If($bitDepth -eq 1) {
            Write-Output " -> run 1-bit convert to $output"
            & "convert" "$fileName -compress fax -monochrome -density 96 -depth 1 $output".Split(" ") 
        } else {
            Write-Output " -> run convert for all other bit depths to $output"
            & "convert" "$fileName -compress fax -colorspace gray -density 96 -depth 6 $output".Split(" ")
        }
    } else {
        Write-Output "skip $fileName"
    }
}

foreach($line in Get-Content $inputFile) {
    ConvertToPdf(Get-Item $line)
}
