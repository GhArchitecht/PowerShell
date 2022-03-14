function Get-GrpMbrAccountExpiredDates
{
    #Script to list all IDD_Staff accounts that have expired 

     [cmdletBinding()]
            param (
            [string]$groupname
            )

            $CurrentDate = Get-Date
            Get-ADGroupMember $groupname | Get-ADUser -Properties accountExpirationDate | Where accountExpirationDate -lt $CurrentDate| Where accountExpirationDate -ne $null | Select Name, accountExpirationDate
 
            <# 
                    $UserAccountExpiredDateResults = If ($GrpMemberAccountExpirationDate -lt $CurrentDate -and -not($GrpMemberAccountExpirationDate -eq $null))
                {  
                    "Account Expired!!! "
                }
                    elseif ($UserAccountExpiredDate -eq $null){
                        "Account is active and set to never expire"
                }
                    else
                {
                    "Account is active and expires on " +  $UserAccountExpiredDate
                    $userExpiredAccounts If ($UserAccountExpiredDateResults -eq  "Account Expired!!! ")
            #>
}