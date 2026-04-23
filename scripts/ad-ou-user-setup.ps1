Import-Module ActiveDirectory

# Create top-level OUs
New-ADOrganizationalUnit -Name "Departments" -Path "DC=contoso,DC=com"
New-ADOrganizationalUnit -Name "Computers" -Path "DC=contoso,DC=com"
New-ADOrganizationalUnit -Name "SecurityGroups" -Path "DC=contoso,DC=com"
New-ADOrganizationalUnit -Name "ServiceAccounts" -Path "DC=contoso,DC=com"

# Create department OUs
$departments = @("IT","Finance","HR","Marketing")
foreach ($dept in $departments) {
    New-ADOrganizationalUnit -Name $dept -Path "OU=Departments,DC=contoso,DC=com"
    New-ADOrganizationalUnit -Name $dept -Path "OU=Computers,DC=contoso,DC=com"
}

# Placeholder password for lab use only
$SecurePassword = ConvertTo-SecureString "<LabPasswordPlaceholder>" -AsPlainText -Force

# Create users
New-ADUser -Name "IT Admin" -SamAccountName "itadmin" -UserPrincipalName "itadmin@contoso.com" `
    -Path "OU=IT,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "IT" -Title "IT Administrator"

New-ADUser -Name "IT Support" -SamAccountName "itsupport" -UserPrincipalName "itsupport@contoso.com" `
    -Path "OU=IT,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "IT" -Title "IT Support"

New-ADUser -Name "Finance User 1" -SamAccountName "finuser1" -UserPrincipalName "finuser1@contoso.com" `
    -Path "OU=Finance,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "Finance"

New-ADUser -Name "Finance User 2" -SamAccountName "finuser2" -UserPrincipalName "finuser2@contoso.com" `
    -Path "OU=Finance,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "Finance"

New-ADUser -Name "HR User 1" -SamAccountName "hruser1" -UserPrincipalName "hruser1@contoso.com" `
    -Path "OU=HR,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "HR"

New-ADUser -Name "HR User 2" -SamAccountName "hruser2" -UserPrincipalName "hruser2@contoso.com" `
    -Path "OU=HR,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "HR"

New-ADUser -Name "Marketing User 1" -SamAccountName "mktuser1" -UserPrincipalName "mktuser1@contoso.com" `
    -Path "OU=Marketing,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "Marketing"

New-ADUser -Name "Marketing User 2" -SamAccountName "mktuser2" -UserPrincipalName "mktuser2@contoso.com" `
    -Path "OU=Marketing,OU=Departments,DC=contoso,DC=com" -AccountPassword $SecurePassword `
    -Enabled $true -PasswordNeverExpires $true -Department "Marketing"

# Create security groups
New-ADGroup -Name "IT-Admins" -GroupScope Global -Path "OU=SecurityGroups,DC=contoso,DC=com"
New-ADGroup -Name "Finance-Users" -GroupScope Global -Path "OU=SecurityGroups,DC=contoso,DC=com"
New-ADGroup -Name "HR-Users" -GroupScope Global -Path "OU=SecurityGroups,DC=contoso,DC=com"
New-ADGroup -Name "Marketing-Users" -GroupScope Global -Path "OU=SecurityGroups,DC=contoso,DC=com"

# Add users to groups
Add-ADGroupMember -Identity "IT-Admins" -Members "itadmin"
Add-ADGroupMember -Identity "Finance-Users" -Members "finuser1","finuser2"
Add-ADGroupMember -Identity "HR-Users" -Members "hruser1","hruser2"
Add-ADGroupMember -Identity "Marketing-Users" -Members "mktuser1","mktuser2"