$ErrorActionPreference = 'Stop';

if (Test-Connection -ComputerName google.com -Quiet -Count 1) {
  $url64 = 'https://github.com/zzzgydi/clash-verge/releases/download/v1.3.8/Clash.Verge_1.3.8_x64_portable.zip'
}
else {
  $url64 = 'https://mirror.ghproxy.com/https://github.com/zzzgydi/clash-verge/releases/download/v1.3.8/Clash.Verge_1.3.8_x64_portable.zip'
}


$sha256 = "a7c296228e054930fabdbfd836279d0d3c413b1a08dcaa4604c540bf8905d529"

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
