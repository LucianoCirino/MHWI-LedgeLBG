/*
  🏹 Ledge Light Bow Gun (LLBG) AHK Script - Ledge Bounce Edition 🏹

    Author: Luciano Cirino (TSC)
    Date: November 2023
    Version: v1.00
    Language: AutoHotkey_H v2 (x64w_MT) https://hotkeyit.github.io/v2/
    
    📖 Notes:
    - Compatible Games: 'Monster Hunter World: Iceborne' & 'Iceborne Community Edition' (ICE).
    - Game Version: v15.20
    - Control: The script is built to be maneuvered using a PS4 controller.
    - Required Mods: "Better Input Detection" mod by AsteriskAmpersand https://www.nexusmods.com/monsterhunterworld/mods/4333
    - Framerate requirements: Ledge bouncing only works at >240 FPS.
    - Other requirements: A 'Recoil Suppressor' mod must not be equipped.  

    🌟 Special Thanks:
    - Moonbunnie: For his invaluable contribution of memory pointers & research vital to the script's conjuration.
                  He was also the architect behind the original LLBG scripts, which profoundly influenced this project's design.

*/

;;==============================[Load Libraries]===============================
SetTitleMatchMode 2  ; Avoids the need to specify the full path of files.
#Include lib/Initialization.ahk
#Include lib/MemoryLibrary.ahk
#Include lib/Functions.ahk
#Include config/LoadSettings.ahk
#Include config/bMaps.ahk
#Include ammo/AmmoControl.ahk
#Include ammo/AmmoScript.ahk

;;=============================[Set Tray Icon]================================
TraySetIcon("AmmoWhite.ico")

;;=============================[On Exit Cleanup]===============================
Exit(){
   try
      ClearKeyStates(keysToClear)
   try
      CleanExit()
   try{
      OffSound()
      Sleep(1000)
   }
   try
      AHKPanic(1,0,0,1)
   catch
      ExitApp
}
OnExit.Bind(Exit)

;;=============================[Main Function]=================================
/* MHW Memory Reads Functions:
   GetAmmoType()	      ;Returns your Current equipped Ammo type 
   GetAmmoCount(type)	;Returns the Ammo mag count of a given ammo type (ex:Spread3 8mag, 60clip)
   GetAmmoCount2(type)	;Returns the Ammo clip count of a given ammo type
   GetActionID()	      ;Returns your character's Action State ID
*/
global inLOOP

LLBG() {

   global inLOOP := FALSE
   LastState := -1
   currentStateStartTime := 0
   WindowInFocus()
   AutoAmmoSync()

   init() {
      if inLOOP{
         ;Tooltip(LastState)
         ClearKeyStates(keysToClear)
         resetAmmoScript()
         global inLOOP:= FALSE
         resetFPS()
      }
   }

   resetFPS() {
      if FPS_DIP_RELOAD
         SetFPS(300)
   }

   ; Define timeouts for different states
   StateDurationLimit(state) {
      return  (state = 13) ? 251 ;Air Melee
            : (state = 18) ? 151  ;Rolling [U]
            : (state = 23) ? 151  ;Falling [U]
            : (state = 25) ? 201  ;Land {Nt} [U]
            : (state = 27) ? 201  ;Land {Mv} [U]
            : (state = 29) ? 251  ;Land from Air Melee
            : (state = 30) ? 501  ;Ledge Step-up
            : (state = 72) ? 451  ;'High' Recoil Shot
            : (state = 73) ? 251  ;'Very High' Recoil Shot
            : (state = 74) ? 551  ;Rapid Fire Shot
            : (state = 81) ? 251  ;Air Reload
            : (state = 83) ? 501  ;Landing Reload
            : 51 ; default value
   }

   BounceShotTiming(ammoName){
      type := AMMO_BOUNCE_MAP[ammoName]
      switch type {
         case 1: ; 'High' Recoil - Normal Shot
            return 67
         case 2: ; 'Very High' Recoil - Normal Shot
            return 17
         case 3: ; 'High' Recoil - Rapid-Fire Shot
            return 17
         default: ; Everythting else
               return 0
      }
   }

   ; Waits for MHW window to be in focus
   WindowInFocus(){
      if !CheckWindow(){
         init()
         While (!CheckWindow())
            PreciseSleep(701)
      }
   }

   Loop{ ;Main Loop

      WindowInFocus()

      ;Memory Read character state
      currentState := GetActionID()

      ;Capture the change in state
      if (currentState != LastState){
         stateChanged := TRUE
         currentStateStartTime := QPC()
      }
      else
         stateChanged := FALSE

      ;Re-init if any state lasts longer than Xms && not in Loop or LBG Avg/Fast Reloading (Anim2ID=107)
      if ((((QPC() - currentStateStartTime) > StateDurationLimit(currentState)) && inLOOP) || GetAnim2ID()=107)
         init()

      if stateChanged {
         ; Upress keys after certain states
         if (LastState = 23)
            SendKey([keyForward, KeyReload], "Up")

         ; If equipment menu closed, reload script
         if (LastState = 585)
            ScriptReload("")

      }

      /* 
      Legend:
         [S] Sheathed
         [U] Unsheathed
         {Nt} Neutral
         {Mv} Moving
         {St} Stopping

      LBG Action IDs: 
         0  - {Nt}
         1  - {Mv} [U]
         2  - {St} [U]
         4  - {Mv} [S]
         5  - {St} [S]
         5  - Unsheathing {Nt}
         6  - Sheathing {Nt} 
         7  - Unsheathing {St}
         9  - Sheathing {St}
         13 - Unsheathed Walk Start (+PrimaryID 117) || Air Melee (+PrimaryID 150)
         18 - Rolling [U]
         23 - Falling [U]
         24 - Falling after jump [U]
         25 - Land {Nt} [U]
         27 - Land {Mv} [U]
         29 - Land from Air Melee
         30 - Ledge Step-up
         31 - Ledge Climb-up
         65 - ADS Transition On {Nt}
         66 - ADS transition Off {Nt}
         67 - ADS {Nt}
         69 - ADS {Mv} (when walking there are no transition anims) 
         71 - ADS {St}
         72 - 'High' Recoil Normal Shot
         73 - 'Very High' Recoil Normal Shot
         74 - 'High' Rapid Fire Shot
         75 - 'Very High' Recoil Rapid Fire Shot
         78 - 'Slow' Reload
         81 - Air Reload
         83 - Landing Reload 
         97 - RF Air Shot
         99 - Gun Melee
         313 - Quest Start Walk
         314 - Bird Quest Entrance
         319 - Drunkbird Quest Entrance

      Animation ID 2:
         125 - 'Low' & 'Average' Recoil Normal Shots   

      */
      
      ;;Selection depending on current state
      switch currentState {
         ;____________________________________
         case 0:     ;;{Nt}

            ; 'High Recoil' Regular Ammo First Bounce Shot (requires a 34ms delay on first shot)
            if (stateChanged && inLOOP && LastState=30 && KeyActive(keyForward)){
               QPCSleep(17)
               SendKey(keyForward, "Up")
               QPCSleep(17)
               SendKey([keyADS, keyFire])
               QPCSleep(17)
               SendKey(keyFire, "Up")
               AmmoCycle()        
            }

         ;____________________________________
         case 2:     ;;{St} [U]

            ; Bounce shot
            if (stateChanged && inLOOP){

               if (!reload || isRapidFire){
                  SendKey(keyADS,"Up")
                  ammoName:=GetAmmoName(GetAmmoType())

                  ; Retrieve the base time for a bounce shot based on the ammo type
                  bounceShotTime := BounceShotTiming(ammoName)

                  ; Adjust the bounce shot time if reloading and it's a rapid-fire
                  bounceShotTime += (reload && isRapidFire) ? 17 : 0

                  QPCSleep(bounceShotTime)

                  SendKey([keyFire, keyADS]) 
                  QPCSleep(17)
                  SendKey(keyFire, "Up")
               }

               ;AmmoCycle here only if type 2 ammo
               if AMMO_BOUNCE_MAP[ammoName]=2
                  AmmoCycle()
            }

         ;____________________________________
         case 13:     ;;Air Melee

            ;; If Air Melee while Primary ammo is selected, start LLBG
            if (stateChanged && (GetAmmoType()=GetAmmoID(PRIMARY_AMMO)) && GetAnimID()=150){
               inLOOP := TRUE
               AmmoCycle()
            }

         ;____________________________________
         case 18:     ;;Rolling [U]

            ;; Do nothing

         ;____________________________________
         case 23:     ;;Falling [U]

            if stateChanged
               resetFPS()

            timeInState := QPC() - currentStateStartTime

            if ((timeInState > 17)){
               if (GetAmmoType()=GetAmmoID(PRIMARY_AMMO)){
                  SendKey([keyForward, keyReload])
                  AMMO_SCRIPT_Q := 0
               }else if inLOOP
                  AmmoSwap(PRIMARY_AMMO)
            }

         ;____________________________________
         case 25:     ;;Land {Nt} [U]

            if (stateChanged && inLOOP && reload && !isRapidFire)
               SendKey([keyFire, keyADS])

         ;____________________________________
         case 27:     ;;Land {Mv} [U]

            ;; Do nothing

         ;____________________________________
         case 29:     ;;Land from Air Melee

            if (stateChanged && inLOOP)
               TimedPulse([keyRoll, keyForward], 51, onDelay:=101)

         ;____________________________________
         case 30:     ;;Ledge Step-up

            if (stateChanged)
               canStartLoop := true

            ammoName := GetAmmoName(GetAmmoType())

            if (ammoName=PRIMARY_AMMO && GetCurrentAmmoCount() > 0 && canStartLoop){
               inLOOP := TRUE
               canStartLoop := false
               switch AMMO_BOUNCE_MAP[ammoName] {
                  case 1: ; 'High' Recoil - Normal Shot
                        SendKey(keyForward)
                  case 2: ; 'Very High' Recoil - Normal Shot
                        SendKey([keyADS, keyFire])
                  case 3: ; 'High' Recoil - Rapid-Fire Shot (only works at 300fps)
                        SendKey([keyADS, keyFire])
               }
            }

         ;____________________________________
         case 65, 67:      ;;ADS Transition On {Nt} (65)
                           ;;ADS {Nt} (67)

            ;; Do nothing

         ;____________________________________
         case 72, 73, 74, 75:    ;;'High' Recoil Normal Shot (72)
                                 ;;'Very High' Recoil Normal Shot (73)
                                 ;;'High' Recoil Rapid Fire Shot (74)
                                 ;;'Very High' Recoil Rapid Fire Shot (75)

            if (stateChanged && inLOOP){

               ammoType := GetAmmoType()

               SendKey(keyFire, "Up")

               ;Wait long enough for Ammo counter to update
               QPCSleep(101)

               ; Send info to AmmoScript function to decide what should be done next
               nextAction :=  AmmoScript(GetAmmoName(ammoType), frameDip:=FPS_DIP_RELOAD)
               swapToAmmo := nextAction.swapToAmmo
               reload := nextAction.reload
               isRapidFire := (AMMO_BOUNCE_MAP[swapToAmmo] = 3) ? true : false

               ; Ammo Cycling done here on type 1 & type 3 Ammos
               cycleIfSame := (currentState = 72 || currentState = 74 || currentState = 75) ? true : false

               AmmoSwap(swapToAmmo,swapOnEmpty:=true,cycleIfSame:=cycleIfSame)

               ; If fps_dip_reload is enabled, wait some time before dropping framerate to 60 (shot type dependant)
               if (FPS_DIP_RELOAD && swapToAmmo=PRIMARY_AMMO && reload){
                  switch currentState {
                     case 72:
                        QPCSleep(117)
                     case 73:
                        QPCSleep(34)
                     case 74:
                        QPCSleep(351)
                  }
                  SetFPS(60)
               }
               else if DEEP_BOUNCE
                  SendKey(keyADS,"Up")

            }

         ;____________________________________
         case 81:     ;;Air Reload

            if (stateChanged && GetAmmoType()=GetAmmoID(PRIMARY_AMMO)){
               inLOOP := TRUE
               TimedPulse(keyCraft, 17)
            }

         ;____________________________________
         case 83:     ;;Landing Reload

            if (inLOOP && stateChanged){
               ammoType_was  := GetAmmoType()
               ammoCount_was := GetAmmoCount(ammoType_was)
               SendKey(keyForward)
               SendKey(keyADS, "Up")
               AmmoCycle()
            }

            if (inLOOP && GetAmmoCount(ammoType_was)!=ammoCount_was){
               AmmoCycle()
               TimedPulse([keyRoll, keyForward, keyItemLeft, keyItemRight], 17)
            }

         ;____________________________________
         case 313:	;;Quest Start Walk

            if stateChanged{
               ReScanPtrs()
               AutoAmmoSync()
             }

         ;____________________________________
         case 314:	;;Quest Start Bird Drop

             if stateChanged
                ReScanPtrs()

         ;____________________________________
         case 319:	;;Quest Start Drunk Bird (Animation starts at 318 but on 319 you can scroll items)

            if stateChanged{
               ReScanPtrs()
               AutoAmmoSync()
             }

         ;____________________________________
         default:

            if stateChanged
               init()
            
      }

      LastState := currentState

      ; Limit Main loop's speed
      if inLOOP
         QPCSleep(2) ;If loop is not running at near max speed, states are missed
      else
         PreciseSleep(34)
   }

}

;;=============================[Assign Hotkeys]================================
; Set up the dynamic hotkeys
if (keyScriptReload != "")
   Hotkey keyScriptReload, ScriptReload
if (keyScriptExit != "")
    Hotkey keyScriptExit, ScriptExit
if (AMMO_SYNC_HOTKEY != "")
    Hotkey AMMO_SYNC_HOTKEY, AmmoSyncHotkey
if (PRIMARY_HOTKEY != "")
    Hotkey PRIMARY_HOTKEY, Primary_Q
hotkeyMap := Map()
; Generate hotkeys based on the Ammo Script table
for index, value in AMMO_SCRIPT.Array {
   if (value.Hotkey != "-" && !hotkeyMap.Has(value.Hotkey)){
      Hotkey value.Hotkey, Script_Q
      hotkeyMap[value.Hotkey] := true
   }
}

; Use PS4 Left Trigger to stop LLBG
Joy7::{
      ClearKeyStates(keysToClear)
      global inLOOP := False
}

ScriptReload(hotkeyName){
   CleanExit()
   Reload
}

ScriptExit(hotkeyName){
   Exit()
}

AmmoSyncHotkey(hotkeyName){
   AmmoSync()
}

Primary_Q(hotkeyName) {
   if ENABLE_AMMO_CONTROL{
      AMMO_SCRIPT.Queue := hotkeyName
      if !inLOOP
         AmmoSwap(PRIMARY_AMMO)
   }
}

Script_Q(hotkeyName){
   global AMMO_SCRIPT
   if ENABLE_AMMO_CONTROL && inLOOP
      AMMO_SCRIPT.Queue := hotkeyName
}

OnSound()
LLBG()
Return