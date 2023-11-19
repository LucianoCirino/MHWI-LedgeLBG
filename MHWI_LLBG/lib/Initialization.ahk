;;==============================[Initialization]================================
;;Most of these settings are for script performance
;#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreads 10
ProcessSetPriority "High"
SetKeyDelay -1, -1
SetMouseDelay -1
SetDefaultMouseSpeed 0
SetWinDelay -1
SetControlDelay -1
SendMode "Input"
ListLines 0
DetectHiddenWindows true
SetWorkingDir A_ScriptDir
ScriptName := SubStr(A_ScriptName, InStr(A_ScriptName, "\",, -1) + 1)