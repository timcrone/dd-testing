powershell /c 'Get-WmiObject -class MSFC_FCAdapterHBAAttributes -namespace “root\WMI” | ForEach-Object {(($_.NodeWWN) | ForEach-Object {“{0:x}” -f $_}) -join “:”}'
