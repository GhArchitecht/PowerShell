function Show-ADUsrSum {

 [CmdletBinding()]
        param (
            [string]$usr
        )
    
        #If the user did not provide a username, show a a message and exit the script
        if (-not($usr)) 
        {
            Write-Output "You did not enter a usr. Exiting script"
            return $null
        }

          
        #Check if the user exists or if the username is valid. Do not show the result on the screen.
        try {
             $null =  Get-ADUser -Identity $usr -ErrorAction Stop
            }
    
        #if the username cannot be found , show a message and exit the script
        catch {
                Get-ErrorMessage
                return $null
              }

    Get-ADuser -identity $usr -Properties * | Format-Table GivenName, Surname, SamAccountName, AccountExpirationDate
}