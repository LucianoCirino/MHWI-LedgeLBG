
/*  🗺️ Ammunition Bounce Maps

    The below table shows how ammos are categorized to a bounce type (bType). This bType is used by LLBG script for logic & timings.

     _________________________________________________Ammo_Bounce_Behaviors_________________________________________________________________
    | bType |  bSpeed  |   Recoil   | Shot Type  | 1st Bounce Delay | Bounce Cycle |                           Notes                          |
    |-------|----------|------------|------------|------------------|--------------|----------------------------------------------------------|
    |   0   |   None   |     *      |      *     |        -         |       -      | Every shot type that doesn't bounce is set as 0.         |
    |   1   |  Medium  |    High    |   Normal   |       34ms       |    ~530ms    | -                                                        |
    |   2   |   Fast   |  Very High |   Normal   |        0ms       |    ~380ms    | -                                                        |
    |   3   |   Slow   |    High    | Rapid-Fire |       0ms*       |    ~700ms    | *First bounce only works at 300fps                       |
     ---------------------------------------------------------------------------------------------------------------------------------------
      Note: Rapid-Fire with Very High recoil "can" bounce but requires repositioning (aka not worth it). Set to type 0.
*/

global AMMO_BOUNCE_MAP := GetbMap(LBG_NAME)

GetbMap(mapName) {

    ; The below maps assume the light bowguns have no recoil reducing mods or skills

    bMaps := Map(

                "default", Map(
                    "Normal 1",     0, "Normal 2",     0, "Normal 3",     0,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     0,
                    "Spread 1",     0, "Spread 2",     0, "Spread 3",     0,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     0, "Sticky 2",     0, "Sticky 3",     0,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       0, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   0,
                    "Demon",        0, "Armor",        0, "Tranq",        0
                ),

                "Accursed Fire", Map(
                    "Normal 1",     0, "Normal 2",     1, "Normal 3",     2,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     2,
                    "Spread 1",     0, "Spread 2",     0, "Spread 3",     2,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     2, "Sticky 2",     0, "Sticky 3",     2,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       0, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   0,
                    "Demon",        0, "Armor",        0, "Tranq",        1
                ),

                "Bazelcore", Map(
                    "Normal 1",     0, "Normal 2",     0, "Normal 3",     2,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     2,
                    "Spread 1",     0, "Spread 2",     0, "Spread 3",     0,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     2, "Sticky 2",     2, "Sticky 3",     2,
                    "Slicing",      0, "Flaming",      1, "Water",        0,
                    "Freeze",       0, "Thunder",      1, "Dragon Ammo",  2,
                    "Poison 1",     0, "Poison 2",     1,
                    "Paralysis 1",  0, "Paralysis 2",  2,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    2, "Exhaust 2",    2,
                    "Recovery 1",   0, "Recovery 2",   0,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),

                "Fatalis Depths", Map(
                    "Normal 1",     0, "Normal 2",     0, "Normal 3",     0,
                    "Pierce 1",     0, "Pierce 2",     3, "Pierce 3",     1,
                    "Spread 1",     1, "Spread 2",     3, "Spread 3",     2,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     1, "Sticky 2",     0, "Sticky 3",     2,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       0, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   0,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),

                "Royal Surefire Shot", Map(
                    "Normal 1",     0, "Normal 2",     0, "Normal 3",     2,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     2,
                    "Spread 1",     0, "Spread 2",     2, "Spread 3",     2,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     0, "Sticky 2",     2, "Sticky 3",     2,
                    "Slicing",      2, "Flaming",      0, "Water",        1,
                    "Freeze",       3, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     1,
                    "Paralysis 1",  1, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      1,
                    "Exhaust 1",    2, "Exhaust 2",    2,
                    "Recovery 1",   0, "Recovery 2",   0,
                    "Demon",        0, "Armor",        1, "Tranq",       1
                ),

                "Safi's Aquashot", Map(
                    "Normal 1",     0, "Normal 2",     0, "Normal 3",     0,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     1,
                    "Spread 1",     0, "Spread 2",     0, "Spread 3",     0,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     0, "Sticky 2",     0, "Sticky 3",     2,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       3, "Thunder",      3, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   1,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),

                "Safi's Boltshot", Map(
                    "Normal 1",     0, "Normal 2",     1, "Normal 3",     0,
                    "Pierce 1",     0, "Pierce 2",     1, "Pierce 3",     0,
                    "Spread 1",     0, "Spread 2",     1, "Spread 3",     0,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     2, "Sticky 2",     0, "Sticky 3",     0,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       3, "Thunder",      3, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   1,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),

                "Safi's Drakshot", Map(
                    "Normal 1",     0, "Normal 2",     3, "Normal 3",     0,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     0,
                    "Spread 1",     0, "Spread 2",     0, "Spread 3",     2,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     0, "Sticky 2",     0, "Sticky 3",     0,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       0, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   1,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),

                "Safi's Frostshot", Map(
                    "Normal 1",     0, "Normal 2",     1, "Normal 3",     0,
                    "Pierce 1",     0, "Pierce 2",     1, "Pierce 3",     0,
                    "Spread 1",     0, "Spread 2",     1, "Spread 3",     0,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     2, "Sticky 2",     0, "Sticky 3",     0,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       3, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  1,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    1,
                    "Recovery 1",   0, "Recovery 2",   1,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),

                "Ten Thousand Volts", Map(
                    "Normal 1",     0, "Normal 2",     0, "Normal 3",     2,
                    "Pierce 1",     0, "Pierce 2",     0, "Pierce 3",     0,
                    "Spread 1",     0, "Spread 2",     0, "Spread 3",     2,
                    "Cluster 1",    0, "Cluster 2",    0, "Cluster 3",    0,
                    "Sticky 1",     0, "Sticky 2",     0, "Sticky 3",     2,
                    "Slicing",      0, "Flaming",      0, "Water",        0,
                    "Freeze",       0, "Thunder",      0, "Dragon Ammo",  0,
                    "Poison 1",     0, "Poison 2",     0,
                    "Paralysis 1",  0, "Paralysis 2",  0,
                    "Sleep 1",      0, "Sleep 2",      0,
                    "Exhaust 1",    0, "Exhaust 2",    0,
                    "Recovery 1",   0, "Recovery 2",   0,
                    "Demon",        0, "Armor",        0, "Tranq",       1
                ),
    )

    ; Return the requested map if it exists, otherwise return the default map
    return bMaps.Has(mapName) ? bMaps[mapName] : bMaps["default"]
}