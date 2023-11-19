#Include ../lib/_JXON.ahk

LoadSettingsFromFile(filePath) {
   ; Check if the file exists
   if !FileExist(filePath) {
      MsgBox("The settings file does not exist.")
      ExitApp
   }
    
   ; Read settings.json
   settings_json := FileRead(filePath)

   ; Load JSON data into an AHK object
   settings := Jxon_Load(&settings_json)
    
   ;;================================[General]=================================
   global LBG_NAME := settings["LBG Name"]
   global PRIMARY_AMMO := settings["Primary Ammo"]
   global DEEP_BOUNCE := settings["Deeper Bounces"]
   global FPS_DIP_RELOAD := settings["FPS Dip Reloads"]

   ;;=============================[Script Settings]============================
   global keyScriptReload := settings["keyScriptReload"]
   global keyScriptExit := settings["keyScriptExit"]

   ;;===============================[KbMControls]===============================
   global keyForward := settings["keyForward"]
   global keyBack := settings["keyBack"]
   global keyReload := settings["keyReload"]
   global keyRoll := settings["keyRoll"]
   global keyAmmoUp := settings["keyAmmoUp"]
   global keyAmmoDown := settings["keyAmmoDown"]
   global keyItemLeft := settings["keyItemLeft"]
   global keyItemRight := settings["keyItemRight"]
   global keyFire := settings["keyFire"]
   global keyADS := settings["keyADS"]
   global keyMine := settings["keyMine"]
   global keyCraft := settings["keyCraft"]
   global keysToClear :=   [keyForward, keyReload, keyRoll, keyAmmoUp,
                           keyAmmoDown, keyFire, keyADS, keyMine]

   ;;=============================[Ammo Scripting]=============================
   global ENABLE_AMMO_CONTROL := settings["Ammo Script Enabled"]
   global PRIMARY_HOTKEY := settings["Primary Hotkey"]
   global AMMO_SYNC_HOTKEY := settings["Ammo Sync Hotkey"]
   global AUTO_AMMO_SYNC := settings["Auto Ammo Sync"]

   global AMMO_SCRIPT := {
      Queue: "",
      Running: "",
      Index: 1,
      HkIdxMap: Map(),
      ShotCount: 0,
      Array: [],
   }

   ; Loop 5 times for the ammo script settings
   Loop 5 {
      n := A_Index
      AMMO_SCRIPT.Array.Push({
         AmmoName: settings[A_Index " Ammo Name"],
         Hotkey: settings[A_Index " Queue Hotkey"],
         StartCond: settings[A_Index " Start Condition"],
         ShotLimit: settings[A_Index " Shot Limit"] = "-" ? 99 : Number(settings[A_Index " Shot Limit"]),
         OnFinish: settings[A_Index " Finish Action"]
      })
   }

   HotkeyIdxMaps(){
      global AMMO_SCRIPT

      for index, ammo in AMMO_SCRIPT.Array {
         hotkey := ammo.Hotkey
         if (hotkey = "-")
               continue
         if (!AMMO_SCRIPT.HkIdxMap.Has(hotkey)) {
               AMMO_SCRIPT.HkIdxMap[hotkey] := {Array: [], Current: 1}
         }
         AMMO_SCRIPT.HkIdxMap[hotkey].Array.Push(index)
      }
   }
   HotkeyIdxMaps()

}
LoadSettingsFromFile("config\settings.json")