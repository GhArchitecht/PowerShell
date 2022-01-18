function Show-UsrInfo
{
     <#
    .SYNOPSIS
        Shows a custom profile for one or more Active Directory users.

    .DESCRIPTION
        The Show-UsrInfo cmdlet gets a specified user object or performs a search to get multiple user objects.

    .PARAMETER $usr
        The usr parameter specifies the Active Directory user to get. You can identify a user by its Security Account Manager (SAM) account name.

    .INPUT
        This function does not support piping.

    .OUTPUT
        This cmdlet returns custom property values of an Active Directory user.

    .EXAMPLE
        PS> Show-UsrInfo -$usr JDoe
    #>
  
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
             $null = Get-ADUser -Identity $usr -ErrorAction Stop
            }

        catch {   
            Get-ErrorMessage
            return $null
          }

        #Gets all the properties of a user
        $UserProperties = Get-ADUser -Identity $usr -Properties *
        
        #Gets users the manager's property name
        $UserManager = $UserProperties | Select -ExpandProperty Manager

        #Gets all the properties of a user's manager 
        $newUserManager = Get-ADUser $UserManager -Properties *

        #Gets the users manager first and last name
        $newUserManagerName = $newUserManager.GivenName + " " + $newUserManager.Surname


        $UserAccountExpiredDate = $UserProperties.AccountExpirationDate
        $CurrentDate = Get-Date

        #Checks if a users account has expired or not expired
        $UserAccountExpiredDateResults = If ($UserAccountExpiredDate -lt $CurrentDate -and  -not($UserAccountExpiredDate -eq $null))
                                            {  
                                                'Account expired!!! ' + '' + $UserAccountExpiredDate
                                            }
                                            else {
                                                'Account is active and expires on ' +  $UserAccountExpiredDate
                                            }

        $CalculatePasswordAge = New-TimeSpan -start $UserProperties.PasswordLastSet -end $CurrentDate
        $PasswordAge = "$($CalculatePasswordAge.Days) $("day(s) old")"


        $ProfileInfo = [PSCustomObject]@{
            'Full Name:' = $UserProperties.GivenName + ", " + $UserProperties.Surname
            'Username:' = $UserProperties.SamAccountName
            'Email Address:' = $UserProperties.EmailAddress
            'Department:' = $UserProperties.Department
            'Country' = $UserProperties.Country
            'Country 2' = $UserProperties.co
            'Employee Role' = $UserProperties.EmployeeType
            'Title' = $UserProperties.Title
            'Manager' = $newUserManagerName
            'Managers Username' = $newUserManager.SamAccountName
            'Account Created on ' = $UserProperties.Created
            'Account Enabled' = $UserProperties.Enabled | BoolToYesNo
            'Account Locked out' = $UserProperties.lockedout | BoolToYesNo
            'Account Expiration Date' = $UserAccountExpiredDateResults 
            'Password Last Set' = $UserProperties.PasswordLastSet
            'Password Age:' = $PasswordAge 
            'Password set to  never expire' = $UserProperties.PasswordNeverExpires  | BoolToYesNo
            'Last Bad Password Set' = $UserProperties.LastBadPasswordattempt 
         }

    Write-Output $ProfileInfo | FL
}