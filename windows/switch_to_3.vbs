Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "switch_to_3.bat" & Chr(34), 0
Set WshShell = Nothing