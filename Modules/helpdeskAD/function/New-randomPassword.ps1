function New-RandomPassword {
    param(
        [Parameter()]
        [int]$MinimumPasswordLength = 10,
        [Parameter()]
        [int]$MaximumPasswordLength = 11,
        [Parameter()]
        [int]$NumberOfAlphaNumericCharacters = 1,
        [Parameter()]
        [switch]$ConvertToSecureString
    )
    
    Add-Type -AssemblyName 'System.Web'
    $length = Get-Random -Minimum $MinimumPasswordLength -Maximum $MaximumPasswordLength
    $password = [System.Web.Security.Membership]::GeneratePassword($length,$NumberOfAlphaNumericCharacters)
    if ($ConvertToSecureString.IsPresent) {
        ConvertTo-SecureString -String $password -AsPlainText -Force
    } else {
        $password
    }
}