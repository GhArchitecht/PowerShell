$mgr = Get-ADUser -identity jdwumfour -Property Manager | select-Object {$_.Manager}

$newMgr = ($mgr -split ",*..=")[1]
