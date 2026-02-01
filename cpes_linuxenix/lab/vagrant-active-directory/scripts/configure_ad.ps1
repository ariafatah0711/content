param
(
    [string]$domainName = "example.local",
    [string]$domainNetbiosName = "EXAMPLE",
    [string]$safeModePass = "Admin123#"
)

Install-ADDSForest `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode Win2012R2 `
-DomainName "$domainName" `
-DomainNetbiosName "$domainNetbiosName" `
-ForestMode Win2012R2 `
-InstallDns `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion `
-SysvolPath "C:\Windows\SYSVOL" `
-SafeModeAdministratorPassword (ConvertTo-SecureString "$safeModePass" -AsPlainText -Force) `
-Force
