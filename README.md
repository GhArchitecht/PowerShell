# PowerShell
This repository contains powershell helper functions to query and manage day to day tasks in Active Director(helpdeskAD) and also collect Computer System Information(helpdeskLocal).

## Modules

<table>
    <thead>
        <tr>
           <th>helpdeskAD</th>
           <th>helpdeskLocal</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>BoolToYesNo</td>
            <td>Get-PCInfo</td>
        </tr>
        <tr>
            <td>Disable-ADUser</td>
        </tr>
        <tr>
            <td>Enable-ADUser</td>
        </tr>
         <tr>
            <td>Find-ADUser2</td>
        </tr> 
        <tr>
            <td>Get-ADGroupManagers</td>   
        </tr>
        <tr>
            <td>Get-ErrorMessage</td>
        </tr>
        <tr>
            <td>Get-Template</td>
        </tr> 
        <tr>
            <td>New-randomPassword</td>
        </tr>
        <tr>
            <td>Reset-ADUsrPwd</td>
        </tr>
        <tr>
            <td>Set-ADUsrExpDate</td>
        </tr>
        <tr>
            <td>Show-ADUsr</td>
        </tr>
        <tr>
            <td>Show-ADUsrGrp</td>
        </tr>
         <tr>
            <td>Show-ADUsrMgr</td>
        </tr>
        <tr>
            <td>Show-ADUsrSum</td>
        </tr>
        <tr>
            <td>Show-UsrInfo</td>
        </tr>
        <tr>
            <td>Undo-ADUsrExpDate</td>
        </tr>
        <tr>
            <td>Update-ADUsrExpDate</td>
        </tr>
        <tr>
            <td>Update-ADUsrMgr</td>
        </tr>
    </tbody>
</table>


#### To install

      ```powershell
      Install-Module -Name ModuleName -AllowClobber  -Force
      ```

Force and AllowClobber aren't necessary, but they do skip errors in case some appear.

#### And to update

      ```powershell
      Update-Module -Name ModuleName
      ```
