function Get-UsrAccountStatus
{
    <#
    .SYNOPSIS
        Short description here

    .DESCRIPTION
        Longer description here

    .PARAMETER $parameterName
        Parameter description goes here

    .INPUT
        This function does not support piping.

    .OUTPUT
        Name what the function returns if any.

    .EXAMPLE
        Write an example of the function here
    #>

    [CmdletBinding()]
        # Add a parameter called username.
         param (
             $usr
         )
         
         #
         $UserAccountExpiredDate =  Get-ADuser -identity $usr -Properties * | select -ExpandProperty  AccountExpirationDate

         #Gets the current date
         $CurrentDate = Get-Date

        If ($UserAccountExpiredDate -lt $CurrentDate  -and  -not($UserAccountExpiredDate -eq $null))
         {  
            Write-Output "Account expired!!! " | ChangeColor
            $choice = Read-Host -prompt "Would you like to continue [Yes] or No"
            while ("y", "yes", "n", "no", ""  -notcontains $choice) {
                $choice = Read-Host "Please enter yes or no"
         }
         if ("y", "yes", "" -contains $choice) {
			continue
		}
		Elseif ("n", "no" -contains $choice) {
            return
        }
    }
    
}