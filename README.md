# PowerShell
This repository contains powershell helper functions to query and manage day to day tasks in Active Director(helpdeskAD) and also collect Computer System Information(helpdeskLocal).

## Module Names

   ### helpdeskAD
   - BoolToYesNo.ps1
   - Disable-ADUser.ps1
   - Enable-ADUser.ps1
   - Find-ADUser2.ps1
   - Get-ADGroupManagers.ps1
   - Get-ErrorMessage.ps1
   - Get-Template.ps1
   - New-randomPassword.ps1
   - Reset-ADUsrPwd.ps1
   - Set-ADUsrExpDate.ps1
   - Show-ADUsr.ps1
   - Show-ADUsrGrp.ps1
   - Show-ADUsrMgr.ps1
   - Show-ADUsrSum.ps1
   - Show-UsrInfo.ps1
   - Undo-ADUsrExpDate.ps1
   - Update-ADUsrExpDate.ps1
   - Update-ADUsrMgr.ps1


### helpdeskLocal
   
   - Get-PCInfo.ps1


#### To install

```powershell
Install-Module -Name ModuleName -AllowClobber  -Force
```

Force and AllowClobber aren't necessary, but they do skip errors in case some appear.

#### And to update

```powershell
Update-Module -Name ModuleName
```
