function Get-ADUsr 
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
    
        #if the username cannot be found , show a message and exit the script
        catch {
                Get-ErrorMessage
                return $null
              }
           
            
       #Get-AdUser -Filter {anr -like $usr} -Properties * | FT @{Label= 'FirstName'; E={$_.GivenName}}, Surname, @{Label='AccountName'; E={$_.SamAccountName}}, EmailAddress, Department, @{N='Manager';E={(Get-ADUser $_.Manager).SamAccountName}}, Country, EmployeeType, Created, AccountExpirationDate,Enabled, Deleted, @{Label= 'invalidLoginCount'; E={$_.BadLogonCount}}, @{Label= 'invalidPwdCount'; E={$_.BadPasswordCount}}, LastBadPasswordattempt, PasswordLastSet,@{N='Memberof';E={(Get-ADUser $_.Memberof).distinguishedName}}
       Get-ADUser -identity $usr -Properties * | FL GivenName, Surname, SamAccountName, EmailAddress, Department, co, Country, EmployeeType,  @{N='Manager';E={(Get-ADUser $_.Manager).SamAccountName}},
       BadLogonCount, BadPasswordCount, Created, LastBadPasswordattempt, PasswordLastSet, PasswordNeverExpires, AccountExpirationDate, Memberof,Enabled, Deleted #@{N='Memberof';E={(Get-ADUser $_.Memberof).distinguishedName}}

    <#    [array]$usrList =   Get-AdUser -Filter {anr -like $usr} -Properties * | FT @{Label= 'FirstName'; E={$_.GivenName}}, Surname, @{Label='AccountName'; E={$_.SamAccountName}}, EmailAddress, Department, @{N='Manager';E={(Get-ADUser $_.Manager).SamAccountName}}, Country


        if($usrList.count -lt 1 )
        {
            Write-Output "Sorry there was no match found"
            $choice = prompt "Please try again"

            while("y", "yes", "n", "no", ""  -notcontains $choice)
            {
                $choice = Read-Host "Please enter yes or no"
                if ("y", "yes", "" -contains $choice) 
                {
			    . Get-ADUsr
        		} ElseIf ("n", "no" -contains $choice) 
                {
                return
                }
	        }

         } Else {
             if($usrList.Count -gt 1)
                {
                 foreach($u in $usrList)
                {
                   $Number = ([array]::indexof($usrList, $u))+1
                   Write-Output $number,$u

                #[PSCustomObject]@{
                   #Number = ([array]::indexof($usrList, $u))+1	
                   #Name = $u.GivenName
                   #Email = $u.emailaddress
                #} 
                #Write-Output $u
            } 
         } 
         
         }
         #>
         
         
         
}

        
