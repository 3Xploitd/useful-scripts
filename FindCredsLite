


    param(
        [string]$string,
        [switch]$secret)
    if ($secret){
        $regex = iex -c '(iwr -Uri https://raw.githubusercontent.com/3Xploitd/credminer/main/regexes.json).Content' | ConvertFrom-Json
    
    }
if ($string){
    $regex = "{'Search Pattern':'$string'}" | ConvertFrom-Json
    }

Get-ChildItem -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
   foreach ($obj in $regex.PSObject.Properties){
   $pattern_name = $obj.Name
   $pattern_value = $obj.Value
   $file_search = Select-String -pattern $pattern_value $_.FullName -Quiet -ErrorAction SilentlyContinue
   }

   if ($file_search -eq 'True') {
     Write-Host $pattern_name,'Found in',$_.FullName
      }

    }




