# Ledge Light Bowgun (LLBG) Exploit Tool

This tool was designed to be used with the Light Bowgun to perform the latest iteration of the LLBG exploit which abuses ledge oddities that emerge when you crank up the framerate. 

### Premise 
In Monster Hunter World: Iceborne, the Light Bowgun has the ability to cancel high recoil shots with a ledge by interrupting the recoil animation with a fall. Normally upon falling you are pushed off the ledge, however, as you cross the framerate boundary of 240fps, you gain the special ability to re-land immediately from this fall and "bounce" away from the ledge. With the right inputs and timings, this bounce can be looped indefinitely, allowing you to fire the Light Bowgun at unprecedented rates.

<br>

## Recoil, Shot Types, and their Ledge Bounce Behaviors
Depending on your **recoil level** and **shot type**, the timing for how to can begin, maintain, and terminate the Ledge Light Bowgun exploit will differ. The below table displays these relationships.

| Bounce Speed |     Recoil     |  Shot Type  | Shot Cycle  | Start-Up Delay | Reload Delay | Notes |
|:------------:|:--------------:|:-----------:|:-----------:|:--------------:|:------------:|:-----:|
|     Fast     | Very High (+4) |    Normal   |   ~384 ms   |      0 ms      |     0 ms     | -     |
|    Medium    |    High (+3)   |    Normal   |   ~517 ms   |     51 ms      |     0 ms     | Start-up delay is caused by having to reposition after ledge climb for first shot to bounce.|
|     Slow     |    High (+3)   | Rapid-Fire  |   ~701 ms   |     †0 ms      |   †34 ms     | †Start-up delay only applicable at 300fps due to first shot failing to bounce at 240fps. Reload delay only applicable at 240fps due to higher framerates preventing this recoil-shot type combination from being able to fall off ledge.|

> [!NOTE]
> - Although Recoil +4 Rapid-Fire "can" bounce, it requires repositioning between shots which makes it uviable. <br>
> - Reload Delays are only applicable if not using the <code>FPS Dip Reload</code> setting.

<br>

## Available Ledge Light Bowguns
Below is a hand-picked selection the most effective Ledge Light Bowguns for the different types of raw ammos.
> [!IMPORTANT]
> For LLBG, you should never equip any bowgun mods that affect your recoil or reload stats!

### Accursed Fire

- A contender for the most powerful Pierce ledge LBG, offering fast bouncing <code>Pierce Ammo 3</code> at its highest possible base raw.

<table>
<tr style="vertical-align:top;">
<td>

![image](https://github.com/LucianoCirino/MHWI-LedgeBounceLBG/assets/112517630/2d6b86f8-f94d-4b2a-ae0d-6133c8ea551f)

</td>
<td>

| Rarity | Base Raw | Primary Ammo |
|:------:|:--------:|:------------:|
|   11   |   270*   | ![Pierce Ammo 3](https://img.shields.io/badge/-Pierce%20Ammo%203-blue) |

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
|   11   |   280    | ![Pierce Ammo 3](https://img.shields.io/badge/-Pierce%20Ammo%203-blue) |

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

- A formidable Spread/Pierce Ammo 3 option with unique Rapid-Fire capabilities.

<table>
<tr style="vertical-align:top;">
<td>

![FATALIS DEPTHS](https://github.com/LucianoCirino/MHWI_LLBG/assets/112517630/586ef26a-0057-47cd-9bac-7503205301e7)

</td>
<td>

| Rarity | Base Raw | Primary Ammo |
|:------:|:--------:|:------------:|
|   12   |   285    | <img src="https://img.shields.io/badge/-Spread%20Ammo%203-brightgreen" alt="Spread Ammo 3"><br><img src="https://img.shields.io/badge/-Pierce%20Ammo%203-blue" alt="Pierce Ammo 3"> |

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

| Rarity | Base Raw | Primary Ammo |
|:------:|:--------:|:------------:|
|   12   |   270    |![Normal Ammo 3](https://img.shields.io/badge/-Normal%20Ammo%203-AA0000) |

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
|   12   |   290*   | ![Pierce Ammo 3](https://img.shields.io/badge/-Pierce%20Ammo%203-blue) |

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
|   12   |   290*   | ![Spread Ammo 3](https://img.shields.io/badge/-Spread%20Ammo%203-brightgreen) |

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

| Rarity | Base Raw | Primary Ammo |
|:------:|:--------:|:------------:|
|   12   |   310    | <img src="https://img.shields.io/badge/-Normal%20Ammo%203-AA0000" alt="Normal Ammo 3"><br><img src="https://img.shields.io/badge/-Sticky%20Ammo%203-orange" alt="Sticky Ammo 3"> |

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

<br>

## Script Settings
The below section covers what all the different gui settings do.

### ⚙️ General 
|       Option        | Description |
|:-------------------:|:-----------:|
| LBG Name            | The name of the LBG you will be using. The script uses this name to pull the correct bounce timings for each ammo type. |
| Primary Ammo        | The name of the primary damaging ammo. To begin the LLBG loop, have this ammo selected and either climb a ledge or fall off one. This is also the only ammo type you should be reloading. |
| FPS Dip Reload      | If enabled, script drops your framerate when you need to reload in order to stop ledge bouncing and and allow you to fall. This gives the script the ability to go for spare-shots on the last bullet in the magazine. Framerate dipping also gives you the ability to use rapid-fire ammo as your primary ammo by giving it a method of unsticking from the ledge when required to reload.  Currently, this option remains as a relic of my testing, leave it unchecked. |

>[!NOTE]
> FPS Dip Reloads on fast and medium bounce speed ammos actually makes your last shot 51ms slower than if you assumed you needed a reload, so if you don't spare-shot on the last shot, this option is actually slower.

### 🕹️ Script Controls
|      Option      |                   Description                         |
|:----------------:|:-----------------------------------------------------:|
| Reload (Script)  | The hotkey bind to reload the LLBG script.            |
| Exit (Script)    | The hotkey bind to terminate the LLBG script.         |
| Stop LLGB        | The hotkey bind to exit the current LLBG loop (does not stop script). |

### 📜 Ammo Scripting
For those who wish to utilize multiple ammo types, the LLBG script includes an optional sophisticated ammo control tool that allows you to bind PS4 buttons (hotkeys) to a set of actions to perform.

#### General settings:
|        Option        |  Description  |
|:--------------------:|:-------------:|
| Primary Ammo Hotkey  | The hotkey bind to automatically swap to your assigned Primary Ammo. During the LLBG loop, it can also be used to cancel script commands and return to the primary ammo. |
| Ammo Sync Hotkey     | The hotkey bind to begin an Ammo Sync. An Ammo Sync is required to be done only once on your current ammo bag for the script to "know" the fastest path to travel to reach other ammo types. It involves the script scrolling through all your ammo types and storing their positions. |
| Auto Ammo Sync       | If enabled, the script will automatically perform an Ammo Sync after certain events, such as when the script is first loaded or when you are loading into a quest. |

#### Table Options:
| Ammo Name | Queue Hotkey | Start Condition | Shot Limit | Finish Action |
|:---------:|:------------:|:---------------:|:----------:|:-------------:|
| The name of the ammo type to swap to. | The assigned hotkey to begin the scripted action.| The condition the Primary Ammo must be in order to begin the scripted action. | The number of shots to perform before executing the Finish Action.| The action to take when complete. "Return" returns you to the primary ammo type, "Next" moves you to the next index entry in the ammo script table. | 

> [!NOTE]
> - Swapping into ammo types that don't bounce works, however, this will exit the LLBG loop which must then be manually restarded again (walking off ledge).
> - Multiple entries can have the same **Queue Hotkey**. As they are called, script will cycle through the assigned entries in the indexed order of the table.  
> - A scripted ammo reaching zero is treated as equivalent to having its configured **Shot Limit** reached.
> - Commands to swap into an ammo type that has no ammo will be ignored by the script. If multiple ammos are assigned a hotkey, it will skip the entry that has no ammo.
> - During LLBG, the ammo wheel is cycled in order to keep it open. This is done because there is a huge startup delay for traversing through more than one entry in the ammo wheel at a time if it was previously closed ; It takes 17ms to move one entry and ~350ms to begin moving it again. Once open however, it only takes N x 17ms to traverse to any ammo type in your bag, with N representing shortest the number of swaps it takes to reach the desired ammo's destination.

### ⌨️ KbM Controls
These are the controls the script is using to perform all the actions in the game, and as such must match your ingame Keyboard & Mouse controls. They are configured by default as my ingame defaults, but if you have different defaults (or don't want to reset your in game KbM settings) you can match them here manually. Don't put capital letters for letter presses.

> [!IMPORTANT]
> The **craft** key should be your ingame shortcut key that crafts all your primary ammo (1 → 8). This can be left blank if not used. 

<br>

## Requirements

| Category        | Requirement |
|:---------------:|:-----------:|
| 1 | This script was designed to be used with a PlayStation controller. |
| 2 | Must be on Monster Hunter World: Iceborne v15.20. |
| 3 | Installation of the [Better Input Detection](https://www.nexusmods.com/monsterhunterworld/mods/4333) mod by AsteriskAmpersand. |
| 4 | Must have the ability to maintain game at a minimum of 240fps. |
| 5 | Must be on a Windows Operating System for AutoHotkey to function. |


## Install
To install, simply click [here](#).

## How to run
First set and save your settings via the gui (LLBG_settings.vbs), then run the main script (LLBG_run.vbs).

> [!WARNING]
> You must reload the script to apply saved gui changes.

## Special Thanks

