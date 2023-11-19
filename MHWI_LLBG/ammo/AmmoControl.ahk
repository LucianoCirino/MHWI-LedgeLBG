/*
  🔫 Ammo Control Script 

  📡 Description:
  This script functions on a dedicated thread for real-time ammo management.
  Its job is to manage and execute fully asynchronous ammo wheel related commands.

  🧩 Features:
  ├─ AmmoSync(): 
  │   └─ Catalogues available ammo types into an array.
  │   └─ Saves the array to an INI file for quick loading on startup.
  │
  ├─ AmmoSwap(targetAmmoName, swapOnEmpty:=true, cycleIfSame:=false):
  │   └─ Efficiently navigates to a target ammo type using the pre-synced ammo array.
  │   └─ Parameters:
  │       ├─ targetAmmoName: The ammo type to switch to.
  │       ├─ swapOnEmpty: Allows swapping even if the current ammo is depleted.
  │       └─ cycleIfSame: Initiates AmmoCycle if the target ammo is already selected.
  │
  └─ AmmoCycle(): 
      └─ Cycles the current ammo selection in order to open or keep the ammo wheel active.

*/

AmmoControl := "
(
Persistent
#MaxThreads 1
#NoTrayIcon
#SingleInstance Force

;;==============================[Load Libraries]===============================
SetTitleMatchMode 2  ; Avoids the need to specify the full path of files.
#Include lib/Initialization.ahk
#Include lib/MemoryLibrary.ahk
#Include lib/Functions.ahk
#Include config/LoadSettings.ahk

ammoListPath := "ammo/ammo_list.ini"
AmmoArray := ini2Array(ammoListPath, "AmmoList") ; AmmoArray = [ ammo_type_1, ammo_type_2, ...]

; Waits for ammo change, returns false if timedout. 
WaitForAmmoChange(AmmoType, Timeout) {
    CurrentTime := QPC()

    ; Wait until ammo changes
    While (AmmoType = GetAmmoType()) {
        ElapsedTime := QPC() - CurrentTime
        if (ElapsedTime > Timeout)
            return false
    }
    return true
}

; Waits for an ammo selection, returns false if timedout. 
WaitForAmmoSelect(AmmoType, Timeout) {
    CurrentTime := QPC()

    ; Wait until ammo is selected
    While (AmmoType != GetAmmoType()) {
        ElapsedTime := QPC() - CurrentTime
        if (ElapsedTime > Timeout)
            return false
    }
    return true
}

AmmoSync(){

   Critical

   global AmmoArray := []

   AmmoArray.Push(GetAmmoType())

   ;Begin opening the ammo menu(84ms delay if menu not open, assume not open)
   TimedPulse([keyAmmoDown], 17, OffDelay:=17)

   if !WaitForAmmoChange(AmmoArray[AmmoArray.Length], 51)  ;51ms lower limit
      return

   ;Scroll through ammos until you loop
   while (AmmoArray[1]!=GetAmmoType()){

      AmmoArray.Push(GetAmmoType())

      TimedPulse([keyAmmoDown], 17, OffDelay:=17)

      if !WaitForAmmoChange(AmmoArray[AmmoArray.Length], 334)  ;334ms lower limit
         return
   }
   SendKey(keyAmmoDown, "Up")

   ; Generate a new the ammo_list.ini file
   Array2Ini(ammoListPath, "AmmoList", AmmoArray)

}

AmmoSwap(targetAmmoName,swapOnEmpty:=true,cycleIfSame:=false){

   Critical

   ; Get the target ammo ID
   targetAmmoType := GetAmmoID(targetAmmoName)

   ; Optional argument to prevent swapping on empty clips
   if (!swapOnEmpty && GetAmmoCount(targetAmmoType) <= 0)
      return

   ; Ensure the desired ammo type exists in pouch.
   if (GetAmmoCount2(targetAmmoType) <= 0)
      return

   currentAmmoType := GetAmmoType()

   ; If already on the target ammo, no need to swap.
   if (currentAmmoType = targetAmmoType){
      if cycleIfSame
         AmmoCycle()
      return
   }

   ; Locate the positions of current and target ammo in the array.
   currentPosition := getArrayValueIndex(AmmoArray, currentAmmoType)
   targetPosition := getArrayValueIndex(AmmoArray, targetAmmoType)

   if (currentPosition = "" || targetPosition = "")
      return

   ; Decide the quickest scroll direction to get to the desired ammo type.
   if (currentPosition >= targetPosition)
         distUp := currentPosition - targetPosition
   else 
         distUp := AmmoArray.Length - targetPosition + currentPosition

   distDown := AmmoArray.Length - distUp
   scrollKey := (distUp < distDown) ? keyAmmoUp : keyAmmoDown

   ; Swap to the desired ammo type.
   while (GetAmmoType() != targetAmmoType) {

      if !CheckWindow()
         return

      currentAmmoType := GetAmmoType()
      TimedPulse([scrollKey], 17, OffDelay := 17)

      if !WaitForAmmoChange(currentAmmoType, 367)
         return
   }
}

AmmoCycle(mode:="Down"){

   Critical

   ;CycleTime:= QPC() ; Debugging

   currentType := GetAmmoType()

   Switch mode{
      case "Up":
         key1stDirection := keyAmmoUp
         key2ndDirection := keyAmmoDown
      default:
         key1stDirection := keyAmmoDown
         key2ndDirection := keyAmmoUp
   }

   ;TimedPulse([key1stDirection, key2ndDirection], 17, OffDelay:=17)
   
   TimedPulse(key1stDirection, 17, OffDelay:=17)
   TimedPulse(key2ndDirection, 17, OffDelay:=17)

   if !WaitForAmmoSelect(currentType, 451)
      return

   ;Tooltip(QPC()-CycleTime) ; Debugging

}

return
)"

if (ENABLE_AMMO_CONTROL) {
    AmmoControlThread := NewThread(AmmoControl) ; Initial thread takes ~16ms to create
}

AmmoSync() {
   if ENABLE_AMMO_CONTROL
      AmmoControlThread.ahkPostFunction("AmmoSync")
}

AutoAmmoSync(){
   if AUTO_AMMO_SYNC
      AmmoSync()
}

AmmoSwap(targetAmmoName, swapOnEmpty:=true, cycleIfSame:=false) {
   if ENABLE_AMMO_CONTROL
      AmmoControlThread.ahkPostFunction("AmmoSwap", targetAmmoName, swapOnEmpty . "", cycleIfSame . "")
}

AmmoCycle(mode:="Down") {
   if ENABLE_AMMO_CONTROL
      AmmoControlThread.ahkPostFunction("AmmoCycle", mode)
}