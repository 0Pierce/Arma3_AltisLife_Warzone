//Created by Pierce K 

//DISCLAIMER: Altering numbers/variables that arent within the control panel may have unexpected outcomes
//Ensure you know what you are doing before changing


//=============== * Things not to touch, unless you understand * ===============
//LOC_tracker (Keeps track of which location needs to be despawned, respawned, or reinforcements sent to)
//FAC1_unitsAlive (sets the amount of units which are expected to be GUARDING said base - does not include patrols)






//Lets you alter the most important aspects of Warzone
//=================================================
//=============== * CONTROL PANEL * ===============
//=================================================
GLOBAL_Patrol_Radius = 100; //Sets the max radius of how far the AI will patrol from their bases
GLOBAL_AI_Despawn = 5; //Sets how long before the AI despawns after all players have left their trigger area (Seconds)
GLOBAL_LootCrate_Unlock_Time = 3; //Sets the amount of seconds it takes to unlock a loot crate (Seconds)
GLOBAL_AI_Trigger_Area_X = 100;// X Coordinate Spawns the AI in when player reaches certain distance from location (Assume the center is in the middle of the compound)
GLOBAL_AI_Trigger_Area_Y = 100;// Y Coordinate^^^^^^^^^^^^^^
GLOBAL_AI_Respawn_Timer = 1000; // Sets the amount of seconds before the raided location gets refreshed (Set this to a high number)

//Sets the spawn radius of reinforcing troops (The center is not the outpost/base, it is a area where the player is less likely to see them spawn) 
//I highly suggest not altering this value too much, as extreme numbers may make the reinforcements spawn very close, or on the outpost itself / extremely far away
GLOBAL_Reinforce_radius = 100; 




//Sets the type of soldiers that will spawn, you can modify their loudouts below
GLOBAL_Soldier_Type1 = "B_G_Soldier_M_F";
GLOBAL_Soldier_Type2 = "B_G_Soldier_M_F";
GLOBAL_Soldier_Type3 = "B_G_Soldier_M_F";
GLOBAL_Soldier_Type4 = "B_G_Soldier_M_F";

//Not an active soldier template, mainly used to identify a specific unit by changing to this soldier type
GLOBAL_Soldier_TypeTESTING = "B_G_Soldier_LAT_F";

//=================================================
//=============== * END * =========================
//=================================================

//Warzone_Trigger = createTrigger ["EmptyDetector", [11105.807, 8377.027]];
//LOC1_trigger setTriggerArea [3500, 2200, 0, true];
//LOC1_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
//LOC1_trigger setTriggerStatements ["this", "execVM 'Warzone Locations\loc1.sqf'", "execVM 'Warzone Locations\locDespawn.sqf'; LOC_tracker = 1;"];

//Testing civilian faction PVE
//_hobo_Count = units group player arrayIntersect playableUnits;

//resistance setFriend [playerSide, 0]

 _players = allPlayers - entities "HeadlessClient_F";
//_players apply {addRating -2000};
//Tells the despawn.sqf which location to despawn
LOC_tracker = 0;

//Creates all the location groups
Location1 = createGroup resistance;
Location1_Patrol = createGroup resistance;

Location3 = createGroup resistance;
Location3_Patrol0 = createGroup resistance;
Location3_Patrol1 = createGroup resistance;


LOC1_trigger = createTrigger ["EmptyDetector", [12301.926, 8876.265]];
//Adjust XY values to change trigger range of Locations
LOC1_trigger setTriggerArea [GLOBAL_AI_Trigger_Area_X, GLOBAL_AI_Trigger_Area_Y, 0, false];
LOC1_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];

LOC1_trigger setTriggerStatements ["this", "execVM 'Warzone\Warzone Locations\loc1.sqf'", "LOC_tracker = 1; execVM 'Warzone\Warzone Locations\locDespawn.sqf';"];



LOC3_trigger = createTrigger ["EmptyDetector", [9763.765, 9395.391]];
LOC3_trigger setTriggerArea [GLOBAL_AI_Trigger_Area_X, GLOBAL_AI_Trigger_Area_Y, 0, false];
LOC3_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];

LOC3_trigger setTriggerStatements ["this", "execVM 'Warzone\Warzone Locations\loc3.sqf'"," LOC_tracker = 3; execVM 'Warzone\Warzone Locations\locDespawn.sqf';"];

//Spawns / despawns the AI depending on if there are players nearby


//Example not functional rn
//LOC2_trigger setTriggerStatements ["this", "execVM 'Warzone Locations\loc2.sqf'", "execVM 'Warzone Locations\locDespawn.sqf'; LOC_tracker = 2;"];
















