/*
  🌟 Ammunition Script(s) 🌟

  📜 Overview:
  Each script in 'AMMO_SCRIPT' orchestrates a pre-configured set of ammunition controls within the game.
  These entries form a sophisticated mechanism for in-game ammo management.

  🎛️ 'AMMO_SCRIPT' Structure:
  ├─ Queue: String ➤ Queued hotkey string
  ├─ Running: String ➤ The running script, defined by a hotkey string
  ├─ Index: ➤ Current ammo sequence position.
  ├─ HkIdxMap: Map ➤ { "HotkeyString": { Array: [array of indexes], Current: Int } }
  ├─ ShotCount: Int ➤ Tally of shots dispensed.
  └─ Array: Array ➤ [{AmmoName, Hotkey, StartCond, ShotLimit, OnFinish}, ...]
     ├─ AmmoName: String ➤ e.g., "Spread 2"
     ├─ Hotkey: String ➤ Activates ammo, e.g., "Joy11"
     ├─ StartCond: String ➤ Ammo start condition, e.g., "Primary Empty"
     ├─ ShotLimit: Int ➤ Caps number of shots, -1 for no limit
     └─ OnFinish: String ➤ Next action, e.g., "Goto 2"

*/ 
#Include ../lib/MemoryLibrary.ahk

resetAmmoScript(include_index:=true){
    global AMMO_SCRIPT
    
    ; Reset the queued script
    AMMO_SCRIPT.Queue := ""

    ; Reset the running script
    AMMO_SCRIPT.Running := ""

    ; Reset ammo script index
    if include_index
        AMMO_SCRIPT.Index := 1

    ; Reset the shot count
    AMMO_SCRIPT.ShotCount := 0
}

AmmoScript(ammoName, frameDip:=false){

    /*
    🔁 Ammunition & Reload Directive Function

    📄 Description:
    Orchestrates the calculated ammo swap and reload maneuver in adherence to a predefined ammo script.
    This function is invoked after a shot has been discharged and the ammo count has been refreshed.

    🛠️ Usage:
    Invoke post-discharge with the updated ammo count to determine the next ammo swap and reload necessity.

    📋 Parameters:
    ├─ ammoName: String identifier for the type of ammunition used.
    ├─ frameDip: Boolean flag indicating if a reload is triggered by a frame rate dip.

    📦 Returns:
    An object encapsulating the next ammunition type as a string and the requisite reload action as a boolean.
    Example: {swapToAmmo: "Spread 3", reload: true}
    */

    ; Returns the next array index value (wraps at end)
    nextIndex(current_index, array_length){
        current_index++
        if current_index > array_length
            return 1
        else
            return current_index++
    }

    findNextIndex(start_at_index, ammo_script_array, current_ammo_name){

        ; Returns the index within the ammo script entry that the script is set to proceed to.
        ; If not going to an entry in the ammo script array, returns 0.

        ; If already inside script, you can not not include yourself in search
        start_index_allowed := !(ammo_script_array[start_at_index].AmmoName = current_ammo_name)

        j := ammo_script_array.Length

        if start_index_allowed
            i := start_at_index

        else if (ammo_script_array[start_at_index].OnFinish = "Return")
            return 0 ; return to primary

        else{
            i := nextIndex(start_at_index, j)
            if i = start_at_index
                return 0 ; looped around, no other entries available
        }

        Loop j { ; Begin searching for an entry with ammo

            if (GetAmmoCount(GetAmmoID(ammo_script_array[i].ammoName)) > 0)
                return i ; entry with ammo found, return index position
            else if (ammo_script_array[i].OnFinish = "Return")
                return 0 ; return to primary

            i := nextIndex(i, j)
        }
        return 0 ; no entry with ammo found
    }

    returnHkIdxWithAmmo(hotkey){
        ; Returns the ammo script index within the hotkey index map that has ammo.
        ; Updates the current hotkey index map position to the found ammo.
        ; If none is found, returns 0.
        global AMMO_SCRIPT

        hotkey_index_array := AMMO_SCRIPT.HkIdxMap[hotkey].Array
        start_at_index := AMMO_SCRIPT.HkIdxMap[hotkey].Current

        j := hotkey_index_array.Length
        i := start_at_index

        Loop j { ; Begin searching for an entry with ammo

            if (GetAmmoCount(GetAmmoID(AMMO_SCRIPT.Array[hotkey_index_array[i]].ammoName)) > 0){
                AMMO_SCRIPT.HkIdxMap[hotkey].Current := i
                return hotkey_index_array[i] ; entry with ammo found, return index value
            }
            i := nextIndex(i, j)
        }
        return 0 ; no entry with ammo found
    }

    ; ...

    global AMMO_SCRIPT

    ; Initialize primary ammo conditions & variables
    i_am_primary_ammo := (ammoName = PRIMARY_AMMO)
    primary_ammo_count := GetAmmoCount(GetAmmoID(PRIMARY_AMMO))
    primary_needs_reload := ((frameDip && primary_ammo_count = 0) || (!frameDip && primary_ammo_count <= 1))

    ; ===============================================================================
    ; Decide how to proceed based on the queued hotkey & the currently running script
    ; ===============================================================================
    queued_hotkey := AMMO_SCRIPT.Queue
    running_hotkey := AMMO_SCRIPT.Running
    sameScriptQueued := (queued_hotkey = running_hotkey)
    primaryIsQueued := (queued_hotkey = PRIMARY_HOTKEY) || sameScriptQueued
    scriptIsQueued := (queued_hotkey != "" && !primaryIsQueued)
    scriptIsRunning := (running_hotkey != "")
    newScriptQueued := scriptIsQueued && (queued_hotkey != running_hotkey)

    if (primaryIsQueued && i_am_primary_ammo) {
        ; Reset the queued hotkey
        AMMO_SCRIPT.Queue := ""

        ; Update the running script
        AMMO_SCRIPT.Running := ""

        return {swapToAmmo: PRIMARY_AMMO, reload: primary_needs_reload}
    }

    ; If no script is queued or running, swap to primary ammo and reload if needed.
    else if (!scriptIsQueued && !scriptIsRunning)
        return {swapToAmmo: PRIMARY_AMMO, reload: primary_needs_reload}

    else if newScriptQueued{
        ; Reset the queued hotkey
        AMMO_SCRIPT.Queue := ""

        ; Find the next index in the HkIdxMap with ammo
        hk_index := returnHkIdxWithAmmo(queued_hotkey)

        if (hk_index != 0){ ; If index with ammo found, update the running script
            AMMO_SCRIPT.Running := queued_hotkey
            AMMO_SCRIPT.Index := hk_index
            AMMO_SCRIPT.ShotCount := 0
        } else ; return to primary
            return {swapToAmmo: PRIMARY_AMMO, reload: primary_needs_reload}

    }

    ; =======================================================
    ; Unpack & initialize ammo script variables & conditions
    ; =======================================================
    array := AMMO_SCRIPT.Array
    index := AMMO_SCRIPT.Index
    shot_count := AMMO_SCRIPT.ShotCount
    start_condition := array[index].StartCond
    script_ammo_name := array[index].AmmoName
    script_ammo_limit := array[index].ShotLimit
    script_finish_action := array[index].OnFinish
    script_ammo_count := GetAmmoCount(GetAmmoID(script_ammo_name))
    i_am_script_ammo := (ammoName = script_ammo_name)
    next_index := findNextIndex(index, array, ammoName)
    will_swap_into_script := (next_index > 0)

    ; ============================================================
    ; Prevent entering script until the 'Start Conditions' are met
    ; ============================================================
    ; If emptying the primary ammo, check wether the ammo we are swapping to only has one shot and is returning to
    ; primary when complete. If this is the case send a reload command.
    if (i_am_primary_ammo && (start_condition = "Empty") && will_swap_into_script){
        next_next_index := findNextIndex(next_index, array, array[next_index].AmmoName)
        next_script_entry_will_exit := (next_next_index = 0)
        next_script_ammo_count := GetAmmoCount(GetAmmoID(array[next_index].AmmoName))
        next_script_ammo_limit := array[next_index].ShotLimit

        if  (next_script_entry_will_exit && ((next_script_ammo_count = 1) || (next_script_ammo_limit = 1))  && (primary_ammo_count = 0))
            return {swapToAmmo: array[next_index].AmmoName, reload: true}
        else if (primary_ammo_count > 0)
            return {swapToAmmo: ammoName, reload: false}
    }

    ; ==================================================
    ; Continue shot counting if am script ammo, else...
    ; ==================================================
    ; If am script ammo, update shot count
    if i_am_script_ammo {
        if primaryIsQueued{
            AMMO_SCRIPT.ShotCount := primary_needs_reload ? script_ammo_limit - 1 : script_ammo_limit
            AMMO_SCRIPT.Queue := ""
        }
        else
            AMMO_SCRIPT.ShotCount++
        shot_count := AMMO_SCRIPT.ShotCount
    }
    ; Else if swapping into script
    else if will_swap_into_script {
        AMMO_SCRIPT.Index := next_index
        return {swapToAmmo: array[next_index].AmmoName, reload: false}

    ; Else re-initialize the current ammo script & return to primary
    } else {
        resetAmmoScript()
        return {swapToAmmo: PRIMARY_AMMO, reload: primary_needs_reload}
    }

    ; note: Only the current script ammo will make it past this point!

    ; =============================================================
    ; Execute the configured 'Finish Actions' if conditions are met
    ; =============================================================
    script_actions_complete := ((shot_count >= script_ammo_limit) || (script_ammo_count = 0))

    ; If shot count is passed, or target script ammo count is 0
    if script_actions_complete{
        if will_swap_into_script {
            AMMO_SCRIPT.ShotCount := 0
            AMMO_SCRIPT.Index := next_index
            return {swapToAmmo: array[next_index].AmmoName, reload: false}
        } else{
            resetAmmoScript(include_index:=false)
            hotkey_idx_map := AMMO_SCRIPT.HkIdxMap[running_hotkey]
            AMMO_SCRIPT.HkIdxMap[running_hotkey].Current := nextIndex(hotkey_idx_map.Current, hotkey_idx_map.Array.Length)
            return {swapToAmmo: PRIMARY_AMMO, reload: primary_needs_reload}
        }
    }

    ; ==============================================================================================
    ; Check wether a reload will be needed on the upcoming shot (reloads must requested in advance)
    ; ==============================================================================================
    one_script_shot_left := (((shot_count = (script_ammo_limit - 1)) || (script_ammo_count = 1)) && (script_ammo_count != 0)) && !frameDip

    ; If primary needs a reload, and am in script with one shot left, and am moving to another
    ; entry in script that only has 1 shot left and that entry will return to primary, send a reload command.
    if (primary_needs_reload && will_swap_into_script && one_script_shot_left) {

        next_next_index := findNextIndex(next_index, array, array[next_index].AmmoName)
        next_script_entry_will_exit := (next_next_index = 0)
        next_script_ammo_count := GetAmmoCount(GetAmmoID(array[next_index].AmmoName))
        next_script_ammo_limit := array[next_index].ShotLimit

        if  next_script_entry_will_exit && ((next_script_ammo_count = 1) || (next_script_ammo_limit = 1))
            return {swapToAmmo: ammoName, reload: true}

    ; If primary needs a reload and will be swapping to primary & one shot to go, send a reload command
    } else if (primary_needs_reload && !will_swap_into_script && one_script_shot_left){
        return {swapToAmmo: ammoName, reload: true}
    }

    ; ...

    ; else continue firing
    return {swapToAmmo: ammoName, reload: false}
}