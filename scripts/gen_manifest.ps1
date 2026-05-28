$srcDir = Resolve-Path (Join-Path $PSScriptRoot "..\src")
$srcDirPath = $srcDir.ProviderPath
$manifestPath = Join-Path $srcDirPath "manifest.lua"

$lines = @()
$lines += "-- auto-generated"
$lines += "return {"

$files = Get-ChildItem -File -Recurse $srcDirPath | Where-Object { $_.Name -ne "manifest.lua" } | Sort-Object FullName
for ($i = 0; $i -lt $files.Count; $i++) {
  $f = $files[$i]
  $rel = $f.FullName.Substring($srcDirPath.Length)
  $relPath = $rel.Replace("\", "/")
  $comma = if ($i -gt 0) { "," } else { "" }
  $lines += "$comma  {path=`"$relPath`",size=$($f.Length)}"
}

$lines += "}"
$lines -join "`n" | Out-File -Encoding ascii $manifestPath
Write-Host "manifest.lua generated ($($files.Count) entries)"
