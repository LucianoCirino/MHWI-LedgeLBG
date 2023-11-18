# Ledge Light Bowgun (LLBG) Exploit Tool

This tool was designed to be used with the Light Bowgun to perform the latest iteration of the LLBG exploit which abuses ledge oddities that emerge when you crank up the framerate. 

### Premise 
In Monster Hunter World: Iceborne, the Light Bowgun has the ability to cancel high recoil shots with a ledge by interrupting the recoil animation with a fall. Normally upon falling you are pushed off the ledge, however, as you cross the framerate boundary of 240fps, you gain the special ability to re-land immediately from this fall and "bounce" away from the ledge. With the right inputs and timings, this bounce can be looped indefinitely, allowing you to fire Light Bowgun ammos at unprecedented rates.

<br>

## Recoil, Shot Types, and Ledge Bounce Behaviors
Depending on your **recoil level** and **shot type**, the timing for how to can begin, maintain, and terminate the Ledge Light Bowgun exploit will differ. The below table displays these relationships.

| Bounce Speed |     Recoil     |  Shot Type  | Shot Cycle  | Start-Up Delay | Reload Delay |
|:------------:|:--------------:|:-----------:|:-----------:|:--------------:|:------------:|
|     Fast     | Very High (+4) |    Normal   |   ~384 ms   |      0 ms      |     0 ms     |
|    Medium    |    High (+3)   |    Normal   |   ~517 ms   |     51 ms      |     0 ms     |
|     Slow     |    High (+3)   | Rapid-Fire  |   ~701 ms   |     †0 ms      |   †34 ms     |

> [!NOTE]
> - Although Recoil +4 Rapid-Fire "can" bounce, it requires repositioning between shots which makes it unviable.
> - Reload Delays are only applicable if not using the <code>FPS_Dip_Reload</code> setting.
> - The start-up delay for the Medium bounce speed is caused by having to reposition after a ledge climb for the first shot to bounce.
> - †Start-up delay for the Slow bounce speed is only applicable at 300fps due to the first shot failing to bounce at 240fps. Reload delay is only applicable at 240fps due to higher framerates preventing this recoil-shot type combination from falling from ledge via shooting.

> [!IMPORTANT]
> For LLBG, you should never equip any bowgun mods that affect your recoil or reload stats!

<br>

## Available Ledge Light Bowguns
Below is a hand-picked selection of the most effective Ledge Light Bowguns for the different raw ammo types.

### Accursed Fire

- A contender for the most powerful Pierce ledge LBG, offering fast bouncing <code>[Pierce Ammo 3]</code> at its highest possible base raw.

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

- A fast bouncing <code>[Pierce Ammo 3]</code> alternative with a huge selection of ammo types to utilize from.

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

- A formidable <code>[Spread/Pierce Ammo 3]</code> option with unique Rapid-Fire capabilities.

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

- A gun with an unparalleled <code>[Normal Ammo 3]</code> magazine size and the unique ability to utilize every cc ammo type in the game.

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

- Although this gun doesn't ledge bounce fast with <code>[Pierce Ammo 3]</code> , its magazine size is nothing to scoff at. 

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

- With it's unmatched <code>[Spread Ammo 3]</code> magazine size, this gun is without a doubt in a class of its own. 

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

- The pinnacle of base raw is also the most devastating <code>[Normal Ammo 3]</code> and <code>[Sticky Ammo 3]</code> ledge LBG in the game.  

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
The below section covers all the tool's settings.

### ⚙️ General 
|          Setting            | Description |
|:---------------------------:|:-----------:|
| <code>LBG_Name</code>       | The name of the LBG you will be using. The script uses this name to pull the correct bounce timings for each ammo type. |
| <code>Primary_Ammo</code>   | The name of the primary damaging ammo. To begin the LLBG loop, have this ammo selected and either climb a ledge or fall off one. This is also the only ammo type you should be reloading. |
| <code>Deeper_Bounces</code> | Lets go aim during the bounce in order to bounce further away from the ledge. This does not slow or speed up your LLBG. I left this in as an option just incase there might be some niche use for it, like needing to fire from further away from the ledge. It is possible too this might make LLBG more or less consistent, but that is all just speculation from my end.
| <code>FPS_Dip_Reload</code> | If enabled, script drops your framerate when you need to reload in order to stop ledge bouncing and and allow you to fall. This gives the script the ability to go for spare-shots on the last bullet in the magazine. Framerate dipping also gives you the ability to use rapid-fire ammo as your primary ammo by giving it a method of unsticking from the ledge when required to reload. This option is a bit too much on the cheat side due to it controlling something that is not possible by a player during gameplay, but I will leave that moral decision up to the user of the tool.  |

>[!NOTE]
> <code>FPS Dip Reloads</code> on fast and medium bounce speed ammos actually makes your last shot ~51ms slower than if you assumed you needed a reload. What this means is that if you don't spare-shot on the last shot, having this option enabled actually makes your LLBG shot cycle slower.

### 🕹️ Script Controls
|            Setting           |                  Description                   |
|:----------------------------:|:----------------------------------------------:|
| <code>Reload_(Script)</code> | The hotkey bind to reload the LLBG script.     |
| <code>Exit_(Script)</code>   | The hotkey bind to terminate the LLBG script.  |
| <code>Stop_LLGB</code>       | The hotkey bind to exit the current LLBG loop. Currently hardcoded to be the controller's aim button.|

### 📜 Ammo Scripting
For those who wish to utilize multiple ammo types, the LLBG script includes an optional sophisticated ammo control tool that allows you to bind PS4 buttons (hotkeys) to a set of actions to perform.

|             Setting               |  Description  |
|:---------------------------------:|:-------------:|
| <code>Primary_Ammo_Hotkey</code>  | The hotkey bind to automatically swap to your assigned Primary Ammo. During the LLBG loop, it can also be used to cancel script commands and return to the primary ammo. |
| <code>Ammo_Sync_Hotkey</code>     | The hotkey bind to begin an Ammo Sync. An Ammo Sync is required to be done only once on your current ammo bag for the script to "know" the fastest path to travel to reach other ammo types. It involves the script scrolling through all your ammo types and storing their positions. |
| <code>Auto_Ammo_Sync</code>       | If enabled, the script will automatically perform an Ammo Sync after certain events, such as when the script is first loaded or when you are loading into a quest. |

#### Table Options:
| Ammo Name | Queue Hotkey | Start Condition | Shot Limit | Finish Action |
|:---------:|:------------:|:---------------:|:----------:|:-------------:|
| The name of the ammo type to swap to. | The assigned hotkey to begin the scripted action.| The condition the Primary Ammo must be in order to begin the scripted action. | The number of shots to perform before executing the Finish Action.| The action to take when complete. "Return" returns you to the primary ammo type, "Next" moves you to the next index entry in the ammo script table. | 

> [!NOTE]
> - Swapping into ammo types that don't bounce works, however, this will exit the LLBG loop which must then be manually restarded again (walking off ledge).
> - Multiple entries can have the same **Queue Hotkey**. As they are called, script will cycle through the assigned entries in the indexed order of the table.  
> - A scripted ammo reaching zero is treated as equivalent to having its configured **Shot Limit** reached.
> - Commands to swap into an ammo type that has no ammo will be ignored by the script. If multiple ammos are assigned a hotkey, it will skip the entry that has no ammo.
> - The ammo selection wheel employs a cycling mechanism to mitigate the significant initial delay experienced when navigating through multiple entries in succession. This delay occurs only if the ammo wheel was not already active; the initial action to start traversing the wheel incurs approximately 350ms of latency. However, once traversal has commenced, moving to each subsequent entry requires a mere 17ms. Therefore, to reach any given type of ammo efficiently, the wheel is kept open, allowing for a rapid traversal at a consistent rate of 17ms per entry. The total time to arrive at the desired ammunition type is calculated as *N*×17ms, where *N* is the minimum number of moves required to access the target ammo type within the wheel.

### ⌨️ KbM Controls
These are the controls the script is using to perform all the actions in the game, and as such must match your ingame keyboard & mouse controls. They are configured by default as my ingame defaults.

> [!NOTE]
> Don't put capital letters. For example, "W" should be "w".

> [!IMPORTANT]
> The <code>craft</code> key should be your in-game shortcut key that crafts all your primary ammo. This can be left blank if not used.

<br>

## Requirements

| # | User Requirements |
|:-:|:-----------:|
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

