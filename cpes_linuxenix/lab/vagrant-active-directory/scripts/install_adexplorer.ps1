# install Active Directory Explorer from https://technet.microsoft.com/en-us/sysinternals/adexplorer.aspx
# adapted from https://github.com/rgl/windows-domain-controller-vagrant/blob/master/provision/ad-explorer.ps1
# skips hash checking because I will not bother to update the hash when the tool updates
$adExplorerUrl = 'https://download.sysinternals.com/files/AdExplorer.zip'
$adExplorer = 'c:/tmp/AdExplorer.zip'
(New-Object System.Net.WebClient).DownloadFile($adExplorerUrl, $adExplorer)
Add-Type -AssemblyName System.IO.Compression.FileSystem
$Shell = New-Object -ComObject 'WScript.Shell'
$ShellSpecialFolders = $Shell.SpecialFolders
$adExplorerProgramFiles = Join-Path $env:ProgramFiles 'ADExplorer'
[IO.Compression.ZipFile]::ExtractToDirectory($adExplorer, $adExplorerProgramFiles)
$shortcut = $Shell.CreateShortcut((Join-Path $ShellSpecialFolders.Item('AllUsersStartMenu') 'Active Directory Explorer (ADExplorer).lnk'))
$shortcut.TargetPath = Join-Path $adExplorerProgramFiles 'ADExplorer.exe'
$shortcut.Save()
