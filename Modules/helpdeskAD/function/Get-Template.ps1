﻿function Get-Template 
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
            [string]$usr
            )
    
        Write-Output "This is a function used as a template to create new functions"
    
}