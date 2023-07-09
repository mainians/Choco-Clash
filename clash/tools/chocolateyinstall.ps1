$ErrorActionPreference = 'Stop';

if (Test-Connection -ComputerName google.com -Quiet -Count 1) {
  $url64 = 'https://github.com/zzzgydi/clash-verge/releases/download/v1.3.3/Clash.Verge_1.3.3_x64_portable.zip'
}
else {
  $url64 = 'https://download.fgit.ml/zzzgydi/clash-verge/releases/download/v1.3.3/Clash.Verge_1.3.3_x64_portable.zip'
}


$sha256 = "c014024640db66caf1945f192cb2fde20e102ac8076abd0cdeef2ccfe3fa327a"

$DesktopPath = [Environment]::GetFolderPath("Desktop")


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$(Get-ToolsLocation)\$env:ChocolateyPackageName"
  url64          = $url64
  checksum64     = $sha256
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$DesktopPath\Clash Verge.lnk" -TargetPath "$(Get-ToolsLocation)\$env:ChocolateyPackageName\Clash Verge.exe"
New-Item -ItemType File -Force -Path "$(Get-ToolsLocation)\$env:ChocolateyPackageName\.config\PORTABLE"
