function Get-PCInfo
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
    
    Get-ComputerInfo | Select CsName, WindowsProductName, CsTotalPhysicalMemory, CsSystemType, CsManufacturer, CsModel, CsSystemSKUNumber, OsLocale, OsNumberOfUsers
}