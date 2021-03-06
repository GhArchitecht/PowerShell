function Show-ADUsrMgr
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
      param (
        [Parameter(ValueFromPipelineByPropertyName)]
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

    
      Get-ADUser -identity $usr -Properties * | Format-List Name, @{N='Manager';E={(Get-ADUser $_.Manager).SamAccountName}}

      
}