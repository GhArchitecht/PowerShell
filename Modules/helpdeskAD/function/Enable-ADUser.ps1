<#

#>
function Enable-ADUsr 
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
    
        #Enable users account
        Enable-ADAccount -Identity $usr


        #Checks the value of the Enabled property of a user
            $result = Get-Aduser $usr -Properties Enabled | Select-Object -ExpandProperty Enabled


         #if value is false, show message and exit the script
          if ($result -eq 'true') {
                 Write-Host $usr " account has been enabled"
                 return $null
            }
       
 }