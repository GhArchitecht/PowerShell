$key = (Get-Item 'HKCU:\SYSTEM\CurrentControlSet\Control\Session Manager').OpenSubKey('Environment', $true)
$path = $key.GetValue('PSModulePath','','DoNotExpandEnvironmentNames')
$path += ';C:\Program Files\Fabrikam\Modules' # or '%ProgramFiles%\Fabrikam\Modules'
$key.SetValue('PSModulePath',$path,[Microsoft.Win32.RegistryValueKind]::ExpandString)