function Set-ADUsrPwd
{
    [CmdletBinding()]
        # Add a parameter called username.
         param (
             $usr
         )

         # If the user did not provide a username value, show a message and exit the script.
         if (-not($usr)) {
             Write-Host "You did not enter a username. Exiting script"
             return $null
         }
 
         # Check if the user exists or if the username is valid. Do not show the result on the screen.
         try {
             $null = Get-ADUser -Identity $usr -ErrorAction Stop
         }
 
         # If the username cannot be found, show a message and exit the script.
         catch {
             Write-Host $_.Exception.Message
             return $null
         }

         # Import the System.Web .NET assembly
         Add-Type -AssemblyName 'System.Web'

         # Generate a random password that is 12-characters long with five non-AlphaNumeric characters.
         $randomPassword = [System.Web.Security.Membership]::GeneratePassword(12, 5)
 
         # Convert the plain text password to a secure string.
         $newPassword = $randomPassword | ConvertTo-SecureString -AsPlainText -Force
 
         # Try to reset the user's password
         try {
             # Reset the user's password
             Set-ADAccountPassword -Identity $usr -NewPassword $newPassword -Reset -ErrorAction Stop
     
             # Force the user to change password during the next log in
             Set-ADuser -Identity $usr -ChangePasswordAtLogon $true

             #Gets the users account name and password last set
             $passwordSet = Get-ADUser -identity $usr -Properties * | select PasswordLastSet
     
             # If the password reset was successfull, return the username and new password.
             [ pscustomobject ]@{
                 Username = $usr
                 NewPassword = $randomPassword
                 PasswordSetAt = $passwordSet
             }


         }
         # If the password reset failed, show a message and exit the script.
         catch {
             Write-Host "There was an error performing the password reset. Please consult the error below."
             Get-ErrorMessage;
             #Write-host $_.Exception.Message
             return $null
         }

         
}