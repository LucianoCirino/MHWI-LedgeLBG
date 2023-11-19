;;==============================[MHWI MemReadInfo]=============================
global prcName := "MonsterHunterWorld.exe"
global bAddress := 0x140000000
global prcId := Memory_GetProcessID(prcName)
global prcHandle := Memory_GetProcessHandle(prcId)

global stateOffsets := [0x500AB60, 0x80, 0x6278]
global stateAddress := GetAddressPtrChain(stateOffsets)  ;Action ID
global animIDOffsets := [0x500AB60, 0x80, 0x468, 0x238]
global animIDAddress := GetAddressPtrChain(animIDOffsets)  ;Primary Animation ID
global animID2Offsets := [0x500AB60, 0x80, 0x468, 0x27A8]
global animID2Address := GetAddressPtrChain(animID2Offsets)  ;Secondary Animation ID

global ammoOffsets := [0x500AB60, 0x80, 0x76B0, 0x23A8]
global ammoAddress := GetAddressPtrChain(ammoOffsets)
global ammoTypeOffsets := [0x500AB60, 0x80, 0x76B0, 0x27C8]
global ammoTypeAddress := GetAddressPtrChain(ammoTypeOffsets)

global ammoMenuOffsets := [0x050EA510, 0x110, 0x98, 0x08, 0x2C0, 0x388, 0x160, 0xFB8]
global ammoMenuAddress := GetAddressPtrChain(ammoMenuOffsets)

global frameRateOffsets := [0x051C1F08, 0x5C]
global frameRateAddress := GetAddressPtrChain(frameRateOffsets)

;;===========================[MHW Mem ReadFunctions]===========================
;;Run to rescan ptr addresses
ReScanPtrs(){
    global stateAddress := GetAddressPtrChain(stateOffsets)
    global animIDAddress := GetAddressPtrChain(animIDOffsets)
    global animID2Address := GetAddressPtrChain(animID2Offsets)
    global ammoAddress := GetAddressPtrChain(ammoOffsets)
    global ammoTypeAddress := GetAddressPtrChain(ammoTypeOffsets)
    global ammoMenuAddress := GetAddressPtrChain(ammoMenuOffsets)
    global frameRateAddress := GetAddressPtrChain(frameRateOffsets)
}

;;Get the Action ID of your character
GetActionID() {
   return Memory_Read(prcHandle, stateAddress)
}

;;Get the Primary Animation ID of your character.
GetAnimID() {
   return Memory_Read(prcHandle, animIDAddress)
}

;;Get the Secondary Animation ID of your character.
GetAnim2ID() {
   return Memory_Read(prcHandle, animID2Address)
}

;;Update Ammo Type
GetAmmoType() {
   return Memory_Read(prcHandle, ammoTypeAddress)
}

;;Get Ammo Mag Count for specific ammo type
GetAmmoCount(type) {
   return Memory_Read(prcHandle, ammoAddress + 0x18 * type)
}

;;Get Ammo Clip Count for specific ammo type
GetAmmoCount2(type) {
   return Memory_Read(prcHandle, ammoAddress + (0x18 * type) + 0x04)
}

;;Return the ammo count of the current ammo type
GetCurrentAmmoCount(){
   return GetAmmoCount(GetAmmoType())
}

;;Returns True is ammo menu is open, else false
GetAmmoMenuState(){
    return !(Memory_Read(prcHandle, ammoMenuAddress) & 0x00FF)
}

global ammoNameToID := Map(
    "Normal 1", 0, "Normal 2", 1, "Normal 3", 2, "Pierce 1", 3, "Pierce 2", 4,
    "Pierce 3", 5, "Spread 1", 6, "Spread 2", 7, "Spread 3", 8, "Cluster 1", 9,
    "Cluster 2", 10, "Cluster 3", 11, "Sticky 1", 13, "Sticky 2", 14, "Sticky 3", 15,
    "Slicing", 16, "Flaming", 17, "Water", 18, "Freeze", 19, "Thunder", 20,
    "Dragon Ammo", 21, "Poison 1", 22, "Poison 2", 23, "Paralysis 1", 24,
    "Paralysis 2", 25, "Sleep 1", 26, "Sleep 2", 27, "Exhaust 1", 28,
    "Exhaust 2", 29, "Recovery 1", 30, "Recovery 2", 31, "Demon", 32,
    "Armor", 33, "Tranq", 36
)
global ammoIDToName := Map()

; Populate the reverse map
for ammoName, ammoId in ammoNameToID {
    ammoIDToName[ammoId] := ammoName
}

;; Return an ammo ID given a string
GetAmmoID(name) {
    if ammoNameToID.Has(name)
        return ammoNameToID[name]
    else
        return -1
}

;; Return the ammo name given an ID
GetAmmoName(id) {
    return ammoIDToName[id] ? ammoIDToName[id] : ""
}

; Get the current set framerate
GetFPS() {
   return Memory_ReadFloat(prcHandle, frameRateAddress)
}

; Set the framerate
SetFPS(fps) {
    Memory_WriteFloat(prcHandle, frameRateAddress, fps)
}

;;==============================[Memory Library]===============================
;;Check if current active window is correct
CheckWindow() {
   return WinActive("ahk_exe " . prcName)
}

;;Runs clean up tasks prior to exiting
CleanExit() {
   Memory_CloseHandle(prcHandle)
}

;;Based on: https://github.com/kevrgithub/autohotkey/blob/master/Lib/Memory.ahk

Memory_GetProcessID(process_name) {
    PID := ProcessExist(process_name)
    return PID
}

Memory_GetProcessHandle(process_id) {
    return DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", false, "UInt", process_id, "Ptr") ; PROCESS_ALL_ACCESS
}

Memory_CloseHandle(process_handle) {
    DllCall("CloseHandle", "Ptr", process_handle)
}

Memory_Read(process_handle, address, t:="UInt", size:=4) {

    
    if (t = "UInt" and size = 4)
    {
        if (DllCall('ReadProcessMemory', 'UInt', process_handle, 'UInt', address, 'UInt*', &value := 0, 'Ptr', size, 'UInt', 0))
        {
            return value
        }
    }
    else if (t = "Int64" and size = 8)
    {
        if (DllCall('ReadProcessMemory', 'UInt', process_handle, 'UInt', address, 'Int64*', &value := 0, 'Ptr', size, 'UInt', 0))
        {
            return value
        }
    }
    
    return False ; Return a default value in case of failure
}

Memory_ReadFloat(process_handle, address) {
    value := Buffer(4)
    DllCall("ReadProcessMemory", "Ptr", process_handle, "Ptr", address, "Ptr", value.Ptr, "UInt", 4, "UPtrP", 0)
    return NumGet(value, "Float")
}

Memory_WriteFloat(process_handle, address, floatValue) {
    ; Allocate a buffer for a 32-bit value (which can hold a float)
    buf := Buffer(4)
    ; Write the float value into the buffer as a 32-bit float
    NumPut("Float", floatValue, buf, 0)
    
    ; Change memory protection to PAGE_READWRITE if necessary
    oldProtect := 0
    DllCall("VirtualProtectEx", "Ptr", process_handle, "Ptr", address, "UInt", 4, "UInt", 0x04, "PtrP", oldProtect)
    
    ; Write the float value to memory
    DllCall("WriteProcessMemory", "Ptr", process_handle, "Ptr", address, "Ptr", buf, "UInt", 4, "UPtrP", 0)
}

;;Get final target address of a pointer chain
GetAddressPtrChain(ptrOffsets){
    GetArrayLength(arr) {
        count := 0
        for _, _ in arr
            count++
        return count
    }
   address := bAddress
   last := GetArrayLength(ptrOffsets)
   for k,v in ptrOffsets
   {
      address := address + v
      if (k != last) {
         address := Memory_Read(prcHandle, address, "Int64", 8)
      }
   }
   return address
}