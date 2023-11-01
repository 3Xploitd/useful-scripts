param(
        [string]$url,
        [string]$file)

$fuzz_values = gc $file

foreach ($obj in $fuzz_values) {
    $response = iwr -uri $url/$obj -ErrorAction ContinueSilently
    if ($response.StatusCode -ne $Null){
    Write-Host "Response from $url/$obj"
    Write-Host $response.RawContent
    }
}
