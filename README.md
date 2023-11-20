# Ledge Light Bowgun (LLBG) Exploit Tool

![Ledge Light Bowgun (LLBG) Exploit Tool Logo](https://github.com/LucianoCirino/Media/blob/main/MHWI-LedgeLBG/LBGs/LLBG-LOGO.png)

[LLBG_.webm](https://github.com/LucianoCirino/MHWI-LedgeLBG/assets/112517630/6eb53a33-dde9-4345-8e35-aa9b659285e3)

This tool was designed to perform the latest iteration of the Ledge Light Bowgun (LLBG) exploit which now abuses ledge oddities that emerge when you crank up the game's framerate. 

### Premise 
In Monster Hunter World: Iceborne, the Light Bowgun has the ability to cancel high recoil shots with a ledge by interrupting the recoil animation with a fall. Normally upon falling you are pushed off the ledge; however, as you cross the framerate boundary of 240fps, you gain the ability to re-land immediately on top of the ledge as you begin falling, giving the visual effect of a bounce. With the right inputs and timings, this "bounce" can be looped indefinitely, giving the Light Bowgun the ability to fire at unprecedented rates.

<br>

<details>
  <summary>🎞️ View LBG Recoil Effects on Ledge at 60fps vs 240fps</summary>
  <p align="center">
    <img src="https://github.com/LucianoCirino/Media/blob/main/MHWI-LedgeLBG/LBGs/60fps_ledge_LBG.gif" width="250" />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <img src="https://github.com/LucianoCirino/Media/blob/main/MHWI-LedgeLBG/LBGs/240fps_ledge_LBG1.gif" width="250"/>
  </p>
</details>

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

[![ACCURSED FIRE](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/75t6Ah3O.png)](https://mhworld.kiranico.com/en/weapons/75t6Ah3O/accursed-fire)

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

[![BAZELCORE](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/75t6Ah3O.png)](https://mhworld.kiranico.com/en/weapons/XEtbfr6/bazelcore)

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

[![FATALIS DEPTHS](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/G6tqDfMy.png)](https://mhworld.kiranico.com/en/weapons/G6tqDfMy/fatalis-depths)

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

[![ROYAL SUREFIRE SHOT](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/v8tqOHw3.png)](https://mhworld.kiranico.com/en/weapons/v8tqOHw3/royal-surefire-shot)

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

[![SAFI'S AQUASHOT](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/rEt9Eir2.png)](https://mhworld.kiranico.com/en/weapons/rEt9Eir2/safis-aquashot)

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

[![SAFI'S DRAKSHOT](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/75t6JC3l.png)](https://mhworld.kiranico.com/en/weapons/75t6JC3l/safis-drakshot)

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

[![TEN THOUSAND VOLTS](https://cdn.kiranico.net/file/kiranico/mhworld-web/images/wp/icon/lbg/32tzwi78.png)](https://mhworld.kiranico.com/en/weapons/32tzwi78/ten-thousand-volts)

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
| <code>FPS_Dip_Reload</code> | If enabled, script drops your framerate when you need to reload in order to stop ledge bouncing and and allow you to fall. This gives the script the ability to go for spare-shots on the last bullet in the magazine. Framerate dipping also gives you the ability to use rapid-fire ammo as your primary ammo by giving it a method of unsticking from the ledge when required to reload. This option is a bit too much on the cheat side due to it controlling something that is not possible by a player during gameplay, but I will leave that moral dilemma up to the user of the tool.  |

>[!NOTE]
> Enabling <code>FPS_Dip_Reload</code> on fast or medium bounce speed ammos actually makes your last shot ~51ms slower than if you assumed you needed a reload. What this means is that if you fail to spare-shot on the last shot, having this option enabled makes your LLBG reloads slightly slower. Another thing to note about this option is that when your framerate is reset it is not set back to your previous setting, but to the "No Limit" framerate option (300fps).

### 🕹️ Script Controls
|            Setting         |                  Description                   |
|:--------------------------:|:----------------------------------------------:|
| <code>Reload_Script</code> | The hotkey bind to reload the LLBG script.     |
| <code>Stop_Script</code>   | The hotkey bind to terminate the LLBG script.  |
| <code>Exit_LLGB</code>     | The hotkey bind to exit the current LLBG loop. Currently hardcoded to the controller's aim button (Left Trigger/Joy7).|

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
> - Swapping to ammo types that do not bounce is possible. However, doing so will exit the Light Bowgun (LLBG) loop, which will then require a manual restart (e.g., by walking off a ledge with the primary ammo selected).
> - It is allowed for multiple entries to share the same **Queue Hotkey**. When activated, the script will proceed through these entries in the order they are indexed in the table.
> - When a scripted ammo type's count reaches zero, it is treated as if its configured **Shot Limit** has been reached.
> - Commands to switch to an ammo type that have no ammo will be ignored by the script. For hotkeys assigned to multiple ammo types, the script will skip over the type that is out of ammo and move on to the next one.

> [!IMPORTANT]
> - The ammo selection wheel employs a cycling mechanism to mitigate the significant initial delay experienced when navigating through multiple entries in succession. This delay occurs only if the ammo wheel was not already active; the initial action to start traversing the wheel incurs approximately 350ms of latency. However, once traversal has commenced, moving to each subsequent entry requires a mere 17ms. Therefore, to reach any given type of ammo efficiently, the wheel is kept open, allowing for a rapid traversal at a consistent rate of 17ms per entry. The total time to arrive at the desired ammunition type is calculated as *N*×17ms, where *N* is the minimum number of moves required to access the target ammo type within the wheel. For these reasons, please refrain from calling these ammo scripts until the ammo wheel has fully opened and begun cycling.

### ⌨️ KbM Controls
These are the controls the script is using to perform all the actions in the game, and as such must match your ingame keyboard & mouse controls. They are configured by default as my ingame defaults.

> [!NOTE]
> Don't put capital letters. For example, "W" should be "w".

> [!IMPORTANT]
> The <code>craft</code> key should be your in-game shortcut key that crafts all your primary ammo. This can be left blank if not used.

<br>

# Requirements

| # | User Requirements |
|:-:|:-----------------:|
| 1 | This script was designed to be used with a PlayStation controller, however, it should still "mostly" work with KbM (outside the Ammo Scripting). |
| 2 | Monster Hunter World: Iceborne versions 15.21 or 15.20. |
| 3 | Installation of the [Better Input Detection](https://www.nexusmods.com/monsterhunterworld/mods/4333) mod by AsteriskAmpersand. |
| 4 | The necessary hardware to run the game at a minimum of 240fps. |
| 5 | Must be on a Windows Operating System (AutoHotkey requirement). |

# Download
To download the Ledge Light Bowgun (LLBG) Exploit Tool, simply click *[here](https://github.com/LucianoCirino/MHWI-LedgeLBG/releases/download/v1.0/MHWI_LedgeLBG.zip)*.

# How to Run
To open the GUI, simply run the "LLBG.exe". You can run and stop the script from this window.

<img src="https://github.com/LucianoCirino/MHWI-LedgeLBG/blob/main/MHWI_LLBG/gui/gui.png" width="500">

> [!WARNING]
> Closing the GUI window stops the AutoHotkey script.

<br>

## 🌟 Special Thanks
I would like to thank [Moonbunnie](https://github.com/MoonBunnie) for his invaluable contribution of memory pointers & research vital to the script's conjuration.
He was also the architect behind the original LLBG scripts, which profoundly influenced this project's design.
