;;==============================[Timing Functions]=============================
;;Precision Sleep using DllCall
PreciseSleep(duration) {
   DllCall("Sleep","UInt",duration)
}

;;Precise Sleep using the QueryPerformanceCounter
QPCsleep(value) {
    static Frequency := 0
    if !Frequency
        DllCall("QueryPerformanceFrequency", "Int64*", &Frequency)
    Start := 0
    DllCall("QueryPerformanceCounter", "Int64*", &Start)
    Finish := Start + (Frequency * (value / 1000))
    loop {
        Current := 0
        DllCall("QueryPerformanceCounter", "Int64*", &Current)
    } until (Current >= Finish)
    return
}

; Using Query Performance as a timer: QPC() behaves like a more precise A_TickCount
QPC() { 
    static Freq := 0
    static init := DllCall("QueryPerformanceFrequency", "Int64*", &Freq)
    Count := 0
    DllCall("QueryPerformanceCounter", "Int64*", &Count)
    Return (Count / Freq) * 1000 
}

;;===============================[Kill All AHK]================================
AHKPanic(Kill:=0, Pause:=0, Suspend:=0, SelfToo:=0) {
    DetectHiddenWindows(true)
    IDList := WinGetList("ahk_class AutoHotkey")
    for index, ID in IDList
    {
        ATitle := WinGetTitle("ahk_id " ID)
        if !InStr(ATitle, A_ScriptFullPath)
        {
            if Suspend
                PostMessage(0x111, 65305, , , "ahk_id " ID) ; Suspend.
            if Pause
                PostMessage(0x111, 65306, , , "ahk_id " ID) ; Pause.
            if Kill
                WinClose("ahk_id " ID) ; Kill.
        }
    }
    if SelfToo
    {
        if Suspend
            Suspend('Toggle') ; Suspend.
        if Pause
            Pause('Toggle') ; Pause.
        if Kill
            ExitApp()
    }
}

; =============================[Custom Functions]==============================
Pressed(key) {
    return GetKeyState(key, "P")
}

KeyActive(key) {
    return GetKeyState(key)
}

SendKey(keyVar, state:="Down") {
    ; Check if keyVar is an array
    if (type(keyVar) = "Array") {
        keysToSend := ""
        for key in keyVar {
            keysToSend .= "{" key " " state "}"
        }
        Send keysToSend
    } else {
        Send "{" keyVar " " state "}"
    }
}

TimedPulse(Keys, PulseTime, OnDelay:=0, OffDelay:=0) {
    ; Ensure the Keys variable is an array. If it's not, make it one.
    if (type(Keys) != "Array")
        Keys := [Keys]

    if (OnDelay > 0)
        QPCsleep(OnDelay)

    ; Send the keys down using SendKey function.
    for Key in Keys {
        SendKey(Key) ; Default is Down
    }

    QPCsleep(PulseTime)

    ; Send the keys up using SendKey function.
    for Key in Keys {
        SendKey(Key, "Up")
    }

    if (OffDelay > 0)
        QPCsleep(OffDelay)
}

ClearKeyStates(keysArray) {
    for key in keysArray {
        if (GetKeyState(key))
            SendKey(key, "Up")
    }
}

getArrayValueIndex(arr, val) {
	Loop arr.Length {
		if (arr[A_Index] == val)
			return A_Index
	}
}

ini2Array(filePath, sectionName) {
    valuesArray := []
    if (FileExist(filePath) && (sectionContent := IniRead(filePath, sectionName)) != "") {
        for each, line in StrSplit(sectionContent, "`n", "`r") {
            if ((SplitLine := StrSplit(line, "=")).Length > 1)
                valuesArray.Push(SplitLine[2])
        }
    }
    return valuesArray
}

Array2Ini(filePath, section, array) {
    try {
        FileDelete(filePath)
    }
    for index, value in array {
        IniWrite(value, filePath, section, index)
    }
}

TestSound() {
    SoundPlay "*-1" ; Generates a simple beep.
}

OnSound() {
    SoundPlay(A_ScriptDir "\sounds\scriptOn.wav")
}

OffSound() {
    SoundPlay(A_ScriptDir "\sounds\scriptOff.wav")
}