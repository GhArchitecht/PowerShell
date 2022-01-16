function Show-UsrInfo
{
  
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

        catch {   
            Get-ErrorMessage
            return $null
          }

    #
    $UserProperties = Get-ADUser -Identity $usr -Properties *

    $UserManager = $UserProperties | Select -ExpandProperty Manager
    $newUserManager = Get-ADUser $UserManager -Properties *
    $newUserManagerName = $newUserManager.GivenName + " " + $newUserManager.Surname


    $UserAccountExpiredDate = $UserProperties.AccountExpirationDate
    $CurrentDate = Get-Date
    $UserAccountExpiredDateResults = If ($UserAccountExpiredDate -lt $CurrentDate -and  -not($UserAccountExpiredDate -eq $null))
                                        {  
                                             'Account expired on ' + $UserAccountExpiredDate
                                        }
                                        else {
                                             'Account has not expired.' + ' Date account expires is on '+ $UserAccountExpiredDate
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