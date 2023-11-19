Set WshShell = CreateObject("WScript.Shell")

' Construct the full path for the executable and the script file
Dim exePath, scriptPath
exePath = WshShell.CurrentDirectory & "\AutoHotkey.exe"
scriptPath = WshShell.CurrentDirectory & "\MHWI_LLBG.ahk"

' Run the executable with the script file as a parameter
WshShell.Run """" & exePath & """ """ & scriptPath & """", 0, False

Set WshShell = Nothing
