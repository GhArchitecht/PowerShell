function Get-ADUsrMgr 
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

     [cmdletBinding()]
            param (
           # [Parameter(ValueFromPipelineByPropertyName)]
            [string]$usr
            )
    

        #Gets all the properties of a user
        $UserProperties = Get-ADUser -Identity $usr -Properties *
        
        #Gets users the manager's property name
        $UserManager = $UserProperties | Select -ExpandProperty Manager

        #Gets all the properties of a user's manager 
        $newUserManager = Get-ADUser $UserManager -Properties *

        try {
            $null = Get-ADUser $newUserManager -Properties * -ErrorAction Stop
           }

       catch {   
           Get-ErrorMessage
           return "no manager listed"
         }

        #Gets the users manager first and last name
        $newUserManagerName = $newUserManager.GivenName + " " + $newUserManager.Surname

        Write-Output $newUserManagerName
    
}