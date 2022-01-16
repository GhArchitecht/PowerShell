
function Get-ADGroupManagers{

    param([string]$groupname
        )

        $GroupMembers = Get-ADGroupMember $groupname | select -ExpandProperty SamAccountName 

        foreach ($Member in $GroupMembers) 
        {
            Show-ADUsrMgr $Member
        }
 

}





