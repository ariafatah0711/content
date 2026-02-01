param
(
    [string]$domainName = "example.local"
)
Set-ADDefaultDomainPasswordPolicy $domainName -MinPasswordAge 0
Set-ADDefaultDomainPasswordPolicy $domainName -PasswordHistoryCount 0

