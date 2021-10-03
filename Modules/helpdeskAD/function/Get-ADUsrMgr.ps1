<#

#>
function Get-ADUsrMgr
{
    [CmdletBinding()]
    param (
        [string]$usr
        )

    #If the user did not provide a username, show a a message and exit the script
    if (-not($usr)) 
       {
	    Write-Host "You did not enter a username. Exiting script"
	    return $null
       }

    #Check if theuserr exists or if the username is valid. Do not show the result on the screen.
     try {
           $null = Get-ADUser -Identity $usr -ErrorAction Stop
         }

    #if the username cannot be found , show a message and exit the script
    catch {
            Get-ErrorMessage
            return $null
          }

    
        Get-ADUser -identity $usr -Properties * | FL Name, @{N='Manager';E={(Get-ADUser $_.Manager).SamAccountName}}
}