function Update-ADUsrMgr 
{
    <#
    .SYNOPSIS
        modifies AD manager 

    .DESCRIPTION
        modifies a specified ADuser's manager.

    .PARAMETER $usr
        a [string] specifying the AD user.

    .PARAMETER $mgr
         a [string] specifying the AD manager.
        
    .INPUT
        This function does not support piping.

    .OUTPUT
        returns the user specified and their updated manager informati

    .EXAMPLE
        Set-ADUsrMgr -usr $username -mgr $managername
    #>

    [cmdletBinding()]
        param (
        [string]$usr,[string]$mgr
        )
    
         #If the user did not provide a username, show a a message and exit the script
            if (-not($usr -and $mgr)) {
                Write-Host "You did not enter either username or a manager. Exiting script"
                return $null
            }

    
        #Modifies AD user managers account
        Set-ADuser -Identity $usr -Manager $mgr

        #Gets a specified users managers name
        Show-ADUsrMgr $usr
    
}