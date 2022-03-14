
function Get-ADGrpMember{

    #list all the Group members and their usernames 
    param([string]$groupname
        )

        $GroupMembers = Get-ADGroupMember $groupname | Get-ADUser -properties name, SamAccountName, manager |  Select name, SamAccountName, manager


        #Get-ADGroupMember IDD_Liberia_TYA_Staff | Get-ADUser -properties name, SamAccountName, manager |  Select name, SamAccountName, @{label="Manager";expression={(Get-ADUser $_.Manager -Properties GivenName).GivenName}}

        $results = Foreach ($Members in $GroupMembers) {
            [pscustomobject]@{
                Number = ([array]::indexof($GroupMembers, $Members))+1 
                Name = $Members.name 
                Username = $Members.SamAccountName
                Manager = Get-ADUsrMgr $Members.SamAccountName
                
            }
        }
        Write-Output $results
    }