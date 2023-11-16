# Ledge Light Bowgun (LLBG) Exploit Tool

### Premise
This tool was designed to be used with the Light Bowgun to perform an improved version of the LLBG exploit which abuses oddities that emerge with ledges when you crank up the framerate. 

### How does it work? 
In Monster Hunter World when an ammo type that recoils you back is fired, one can use a ledge to cancel the recoil animation by trigggering a fall. As you cross the framerate threshold of 240fps recoil "bounce" from the ledge, as if you hit a wall. It turns out these bounces are completely controllable, and with the right inputs and timings really push the game's limits to the extreme. 

### Controls
This script was designed to be piloted with a PlayStation controller.

### Compatible Versions
Monster Hunter World: Iceborne v15.20

### Requirements
1) [Better Input Detection](https://www.nexusmods.com/monsterhunterworld/mods/4333) Mod by AsteriskAmpersand. 
2) Must have the ability to reach and maintain the game at 240fps.

## Mapping Bounce Types
An ammo's bounce speed is dictated by its **Recoil** and **Shot Type** stats. The below table shows this relationship.

| Bounce Speed |     Recoil     |  Shot Type  | Shot Cycle | Start-Up Delay | Reload Delay | Notes                                                                                                   |
|:------------:|:--------------:|:-----------:|:----------:|:--------------:|:------------:|:-------------------------------------------------------------------------------------------------------:|
|     Fast     | Very High (+4) |    Normal   |   380 ms   |      0 ms      |     0 ms     | -                                                                                                       |
|    Medium    |    High (+3)   |    Normal   |   550 ms   |     51 ms      |     0 ms     | Start-up delay is caused by having to reposition after ledge climb for first shot to bounce.            |
|     Slow     |    High (+3)   | Rapid-Fire  |   700 ms   |      0 ms      |    34 ms     | Only works as the Primary ammo at 300fps (max allowed framerate in game) due to first shot failing to bounce at 240 fps. Reload delay is caused by having to delay final shot in order to stop bouncing. |

*note: Although Recoil +4 Rapid-Fire "can" bounce, it requires repositioning between shots which makes it uviable.*

## Available Guns

I've handpicked the below options as the most effective ledge Light Bowguns for the different types of ammos.

### Accursed Fire

- A contender for the most powerful Pierce ledge LBG, offering fast bouncing <code>Pierce Ammo 3</code> at its highest possible base raw.

<table>
<tr style="vertical-align:top;">
<td>

![image](https://github.com/LucianoCirino/MHWI-LedgeBounceLBG/assets/112517630/2d6b86f8-f94d-4b2a-ae0d-6133c8ea551f)

</td>
<td>

| Rarity | Base Raw |   Primary Ammo   |
|:------:|:--------:|:----------------:|
|   11   |   270*   |   Pierce Ammo 3  |

*283.5 (297 in [ICE](https://github.com/AsteriskAmpersand/Ice-Stable)) with NEB 
</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

|     Ammo Type      | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Normal Ammo 3      |       4       |     Fast     |
| Pierce Ammo 3      |       3       |     Fast     |
| Spread Ammo 3      |       3       |     Fast     |
| Sticky Ammo 1      |       3       |     Fast     |
| Sticky Ammo 3      |       3       |     Fast     |
| Tranq Ammo         |       3       |    Medium    |

</td>
</tr>
</table>

---

### Bazelcore

- A fast bouncing <code>Pierce Ammo 3</code> alternative with a huge selection of ammo types to utilize from.

<table>
<tr style="vertical-align:top;">
<td>

![BAZELCORE](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/0e60fb0d-aa86-43b7-a443-24682e8aa738)

</td>
<td>

| Rarity | Base Raw |   Primary Ammo    |
|:------:|:--------:|:-----------------:|
|   11   |   280    |   Pierce Ammo 3   |

</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

| Ammo Type          | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Normal Ammo 3      |       3       |     Fast     |
| Pierce Ammo 3      |       3       |     Fast     |
| Sticky Ammo 1      |       3       |     Fast     |
| Sticky Ammo 2      |       3       |     Fast     |
| Sticky Ammo 3      |       3       |     Fast     |
| Paralysis Ammo 2   |       4       |     Fast     |
| Exhaust Ammo 1     |       6       |     Fast     |
| Exhaust Ammo 2     |       5       |     Fast     |
| Dragon Ammo        |       2       |     Fast     |
| Poison Ammo 2      |       5       |    Medium    |
| Flaming Ammo       |       5       |    Medium    |
| Thunder Ammo       |       5       |    Medium    |
| Tranq Ammo         |       3       |    Medium    |

</td>
</tr>
</table>

---

### Fatalis Depths

- A formidable Spread/Pierce option with unique Rapid-Fire capabilities.

<table>
<tr style="vertical-align:top;">
<td>

![FATALIS DEPTHS](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/586ef26a-0057-47cd-9bac-7503205301e7)

</td>
<td>

| Rarity | Base Raw |            Primary Ammo                |
|:------:|:--------:|:--------------------------------------:|
|   12   |   285    |   Spread Ammo 3 / Pierce Ammo 2 (RF)   |

</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

| Ammo Type          | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Spread Ammo 3      |       4       |     Fast     |
| Sticky Ammo 2      |       3       |     Fast     |
| Sticky Ammo 3      |       3       |     Fast     |
| Sticky Ammo 1      |       3       |    Medium    |
| Spread Ammo 1      |       6       |    Medium    |
| Pierce Ammo 3      |       4       |    Medium    |
| Tranq Ammo         |       3       |    Medium    |
| Pierce Ammo 2 (RF) |       5       |     Slow     |
| Spread Ammo 2 (RF) |       5       |     Slow     |

</td>
</tr>
</table>

---

### Royal Surefire Shot

- A gun with an unparalleled <code>Normal Ammo 3</code> magazine size and the unique ability to utilize every cc ammo type in game.

<table>
<tr style="vertical-align:top;">
<td>

![ROYAL SUREFIRE SHOT](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/cd2c631e-6b84-447c-bbb8-04948fda7797)

</td>
<td>

| Rarity | Base Raw |    Primary Ammo   |
|:------:|:--------:|:-----------------:|
|   12   |   270    |   Normal Ammo 3   |

</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

| Ammo Type          | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Normal Ammo 3      |       5       |     Fast     |
| Pierce Ammo 3      |       3       |     Fast     |
| Spread Ammo 2      |       4       |     Fast     |
| Spread Ammo 3      |       3       |     Fast     |
| Sticky Ammo 2      |       3       |     Fast     |
| Sticky Ammo 3      |       2       |     Fast     |
| Exhaust Ammo 1     |       6       |     Fast     |
| Exhaust Ammo 2     |       5       |     Fast     |
| Poison Ammo 2      |       5       |    Medium    |
| Paralysis Ammo 1   |       6       |    Medium    |
| Sleep Ammo 2       |       5       |    Medium    |
| Water Ammo         |       7       |    Medium    |
| Armor Ammo         |       3       |    Medium    |
| Tranq Ammo         |       3       |    Medium    |

</td>
</tr>
</table>

---

### Safi's Aquashot

- Although it ledge bounces <code>Pierce Ammo 3</code> only at medium speed, a magazine size of 5 is nothing to scoff at. 

<table>
<tr style="vertical-align:top;">
<td>

![SAFI'S AQUASHOT](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/77385904-bebb-4949-8659-c817352130c7)

</td>
<td>

| Rarity | Base Raw |   Primary Ammo    |
|:------:|:--------:|:-----------------:|
|   12   |   290*   |   Pierce Ammo 3   |

*Atk V (x4) + Pierce Capacity III

</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

| Ammo Type          | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Sticky Ammo 2      |       2       |     Fast     |
| Sticky Ammo 3      |       2       |     Fast     |
| Pierce Ammo 3      |       5       |    Medium    |
| Recover Ammo 2     |       2       |    Medium    |
| Tranq Ammo         |       3       |    Medium    |

</td>
</tr>
</table>

---

### Safi's Drakshot

- With it's unmatched <code>Spread Ammo 3</code> magazine size, this gun is without a doubt in a class of its own. 

<table>
<tr style="vertical-align:top;">
<td>

![SAFI'S DRAKSHOT](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/7bb119f6-8984-4890-a4ec-ab44c0cbff53)

</td>
<td>

| Rarity | Base Raw |   Primary Ammo    |
|:------:|:--------:|:-----------------:|
|   12   |   290*   |   Spread Ammo 3   |

*Atk V (x4) + Spread Capacity III

</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

| Ammo Type          | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Spread Ammo 3      |       5       |     Fast     |
| Recover Ammo 2     |       3       |    Medium    |
| Tranq Ammo         |       3       |    Medium    |
| Normal Ammo 2 (RF) |       4       |     Slow     |

</td>
</tr>
</table>

---

### Ten Thousand Volts

- The pinnacle of base raw is also the most devastating <code>Normal Ammo 3</code> and <code>Sticky Ammo 3</code> ledge LBG in the game.  

<table>
<tr style="vertical-align:top;">
<td>

![TEN THOUSAND VOLTS](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/14fcec9d-a255-445b-8084-ecf2d9d7e980)

</td>
<td>

| Rarity | Base Raw |           Primary Ammo              |
|:------:|:--------:|:-----------------------------------:|
|   12   |   310    |    Normal Ammo 3 / Sticky Ammo 3    |

</td>
</tr>
<tr style="vertical-align:top;">
<td colspan="2">

| Ammo Type          | Magazine Size | Bounce Speed |
|:------------------:|:-------------:|:------------:|
| Normal Ammo 3      |       4       |     Fast     |
| Spread Ammo 3      |       3       |     Fast     |
| Sticky Ammo 3      |       3       |     Fast     |
| Tranq Ammo         |       3       |    Medium    |

</td>
</tr>
</table>

---

## LLBG Settings
The below section cover all the different settings that are available from the GUI.

### General ⚙️
| LBG Name | Primary Ammo | Wyvern Blast Reload |
|:--------:|:------------:|:-------------------:|
| The name of the LBG you will be using. Script uses this name to pull the correct bounce timings for each ammo type.| The name of the primary damaging ammo you will be using. In order to begin the LLBG loop you must have your primary ammo selected in the ammo wheel and either climb a ledge or fall off a ledge. The Primary Ammo type is also the only ammo type you should be reloading. | If checked it uses the Wyvern Blast Reload as the mechanism for propelling you backwards for reloads. This is useful because normally the script is forced to reload on the last shot regardless of if last shot procs spareshot or not, this allows the script to go for last-shot spare-shot attempts. Probably only useful in [ICE](https://github.com/AsteriskAmpersand/Ice-Stable) where an extra mod slot is available for LBG to use.

### Script Controls 🕹️
| Reload (Script) | Exit (Script) | Stop LLGB |
|:---------------:|:-------------:|:---------:|
| The hotkey bind to reload the LLBG script.  | The hotkey bind to terminate the LLBG script. | The hotkey bind to exit the current LLBG loop (does not stop script) |

### KbM Controls ⌨️
These are the controls the script is using to perform all the actions in the game, and as such must match your ingame Keyboard & Mouse controls. They are configured by default as my ingame defaults, but if you have different defaults (or don't want to reset your in game KbM settings) you can match them here manually. Don't put capital letters for letter presses. The craft key is intentionally left blank and should be number (1 → 8) shortcut to a in game macro to craft all your primary ammo. It can be left blank of you don't need extra primary ammo to craft.

### Ammo Scripting 📜
For those who wish to utilize multiple ammo types, the LLBG script includes an optional sophisticated ammo control tool that allows you to bind PS4 buttons (hotkeys) to a set of actions to perform.

#### General settings:
| Primary Ammo Hotkey | Ammo Sync Hotkey | Auto Ammo Sync |
|:-------------------:|:----------------:|:--------------:|
| The hotkey bind to automatically swap to your assigned Primary Ammo. During the LLBG loop it can also be used to cancel script commands and return to the primary ammo.| The hotkey bind to begin an Ammo Sync. An Ammo Sync is required to be done only once on your current ammo bag in order for script to "know" what the fastest possible path is to reach any given ammo type. An Ammo Sync consists of the script scrolling through all your ammo types and storing the positions of each ammo type into an array.| If checked the script will automatically perform an Ammo Sync after certain events such as the closing of the equippment menu, or loading into a quest.|

#### Table Options:
| Ammo Name | Queue Hotkey | Start Condition | Shot Limit | Finish Action |
|:---------:|:------------:|:---------------:|:----------:|:-------------:|
| The name of the ammo type to swap to. | The assigned hotkey to begin the scripted action.| The condition the Primary Ammo must be in order to begin the scripted action. | The number of shots to perform before executing the Finish Action.| The action to take when complete. "Return" returns you to the primary ammo type, "Next" moves you to the next index entry in the ammo script table. | 

#### Notes:
‣ Swapping into ammo types that don't bounce works, however, this will exit the LLBG loop which must then be manually restarded again (walking off ledge).

‣ Multiple entries can have the same **Queue Hotkey**. As they are called, script will cycle through the assigned entries in the indexed order of the table.  

‣ A scripted ammo reaching zero is treated as equivalent to having its configured **Shot Limit** reached.

‣ Commands to to swap into an ammo type that has no ammo will be ignored by the script. If multiple ammos are assigned a hotkey it will skip that entry in the script.

‣ During firing, the ammo wheel is cycled in order to keep it open. This is done because there is a huge startup delay for traversing through more than one entry in the ammo wheel at a time if it was previously closed ; It takes 17ms to move one entry and ~350ms to begin moving it again. Once open however, it only takes N x 17ms to traverse to any ammo type in your bag, with N representing shortest the number of swaps it takes to reach the desired ammo's destination.

#### Example:
  < WIP >
  

## Install
To install, simply click [here](#).

## How to run
First set and save your settings via the gui (LLBG_settings.vbs), then run the main script (LLBG_run.vbs).

*note: You must reload the script to apply saved gui changes.*

## Dependencies
Must be running on a Windows OS.

## Special Thanks

