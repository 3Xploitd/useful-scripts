param(
        [string]$url,
        [string]$file)

$fuzz_values = gc $file

foreach ($obj in $fuzz_values) {
    Try {
    $response = iwr -uri $url/$obj
    $response.RawContent

    } Catch {

    }
}
