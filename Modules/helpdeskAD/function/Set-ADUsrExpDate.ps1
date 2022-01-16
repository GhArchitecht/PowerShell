function Set-ADUsrExpDate 
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
        $usr, [DateTime]$newExpDate
        )

        #If the user did not provide a username, show a a message and exit the script
        if (-not($usr -and $newExpDate)) {
	        Write-Host "You did not enter a username or a specified expiry date. Exiting script"
	        return $null
        }

        #Check if theuserr exists or if the username is valid. Do not show the result on the screen.
        try {
            $null = Get-ADUser -Identity $usr -ErrorAction Stop
            }

        #if the username cannot be found , show a message and exit the script
        catch {
            Get-ErrorMessage;
            return $null
            }

        #Gets the users account expiration date
        $usr = Get-ADUser -identity $usr -Properties AccountExpirationDate

        #Sets a users expiration date 
        Set-ADAccountExpiration -Identity $usr -DateTime $newExpDate

        #Gets a users 
        Get-ADuser -identity $usr -Properties * | Format-List GivenName, Surname, AccountExpirationDate
    }
