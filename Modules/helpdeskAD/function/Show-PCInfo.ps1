function Show-PCInfo
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
        Show-ComputerInfo
    #>

    $OS = Get-CimInstance -class cim_OperatingSystem
    $PROCESSOR = Get-CimInstance -class CIM_Processor
    $BIOS = Get-CimInstance -class win32_bios
    $RAMSize =  [System.string]::Concat(([math]::Round((Get-CimInstance CIM_ComputerSystem).totalphysicalmemory / (1024 * 1024 * 1024)))," GB")
    $DISK = Get-CimInstance CIM_LogicalDisk -Filter 'DeviceID = "C:"'
    $DISKSize = [System.string]::Concat(([math]::Round(($DISK).size / (1024 * 1024 * 1024)))," GB")
    $DISKFreeSpace = [System.string]::Concat(([math]::Round(($DISK).freespace / (1024 * 1024 * 1024)))," GB")


    $CompupterInfo = [PSCustomObject]@{
          'Device Name' = $OS.CSName
          'Device SerialNumber' = $BIOS.SerialNumber
          'Processsor' = $PROCESSOR.Name
          'Installed RAM' = $RAMSize
          'Disk Drive' = $DISK.Caption
          'Disk Size' = $DISKSize
          'Disk Space' = $DISKFreeSpace 
          'OS Name' = $OS.Caption
          'System type' = $OS.OSArchitecture

    }


    Write-Output $CompupterInfo | FL



}