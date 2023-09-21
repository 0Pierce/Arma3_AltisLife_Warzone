//Created by Pierce K 

//DISCLAIMER: Altering numbers/variables that arent within the control panel may have unexpected outcomes
//Ensure you know what you are doing before changing


//=============== * Things not to touch, unless you understand well * ===============
//LOC_count (Keeps track which locations need reinforcements)
//LOC_tracker (Keeps track of which location needs to be despawned, respawned, or reinforcements sent to)
//FAC_unitsAlive (sets the amount of units which are expected to be GUARDING said base - does not include patrols)






//Lets you alter the most important aspects of Warzone
//=================================================
//=============== * CONTROL PANEL * ===============

GLOBAL_Patrol_Radius = 100; //Sets the max radius of how far the AI will patrol from their bases
GLOBAL_AI_Despawn = 5; //Sets how long before the AI despawns after all players have left their trigger area (Seconds)
GLOBAL_LootCrate_Unlock_Time = 3; //Sets the amount of seconds it takes to unlock a loot crate, set this to a high number (Seconds) 
GLOBAL_KeyCrate_Open_Time = 5; //Sets the amount of seconds it takes to open one key crate, set this to a low number (Seconds)
GLOBAL_AI_Trigger_Area_X = 100;// X Coordinate Spawns the AI in when player reaches certain distance from location (Assume the center is in the middle of the compound)
GLOBAL_AI_Trigger_Area_Y = 100;// Y Coordinate^^^^^^^^^^^^^^
GLOBAL_AI_Respawn_Timer = 1000; // Sets the amount of seconds before the raided location gets refreshed (Set this to a high number)
GLOBAL_Computer_Crate_Open_Radius = 3; //Sets the radius a player must be within while opening the crates VIA computer
	//^^^^^^^^^^^^^^^^^^^

//Sets the spawn radius of reinforcing troops (The center is not the outpost/base, it is a area where the player is less likely to see them spawn) 
//I highly suggest not altering this value too much, as extreme numbers may make the reinforcements spawn very close, or on the outpost itself / extremely far away
GLOBAL_Reinforce_radius = 100; 




//Sets the type of soldiers that will spawn, you can modify their loudouts below
//Soldiers that spawn in will have one of these templates, you can add more templates or make each soldier a different type
GLOBAL_Soldier_Type1 = "B_G_Soldier_M_F";
GLOBAL_Soldier_Type2 = "B_G_Soldier_M_F";
GLOBAL_Soldier_Type3 = "B_G_Soldier_M_F";
GLOBAL_Soldier_Type4 = "B_G_Soldier_M_F";

//Not an active soldier template, mainly used to identify a specific unit by changing to this soldier type
GLOBAL_Soldier_TypeTESTING = "B_G_Soldier_LAT_F";


//=============== * END * =========================
//=================================================




//=================================================
//========== * Location Compositions * ============

_XY3 = [9753.68, 9372.55];
_Z3 = 0;
Near_Crate = false;


//Spawns the composition for LOC3
0 = [_XY3, _Z3, call (compile (preprocessFileLineNumbers "Warzone\Warzone Locations\build\loc3Buildings.sqf"))] call BIS_fnc_ObjectsMapper;
LOC3_KEY_trigger = createTrigger ["EmptyDetector", [9762.25,9368]];
LOC3_KEY_trigger setTriggerArea [3,3, 0, false];
LOC3_KEY_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];

LOC3_KEY_trigger setTriggerStatements ["this", "Near_Crate = true;", "Near_Crate = false;"];





//=============== * END * =========================
//=================================================


//resistance setFriend [playerSide, 0]

 _players = allPlayers - entities "HeadlessClient_F";
//_players apply {addRating -5000};
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
LOC1_trigger setTriggerArea [GLOBAL_AI_Trigger_Area_X, GLOBAL_AI_Trigger_Area_Y, 0, false, -1];
LOC1_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];

LOC1_trigger setTriggerStatements ["this", "execVM 'Warzone\Warzone Locations\loc1.sqf'", "LOC_tracker = 1; execVM 'Warzone\Warzone Locations\locDespawn.sqf';"];



LOC3_trigger = createTrigger ["EmptyDetector", [9763.765, 9395.391]];
LOC3_trigger setTriggerArea [GLOBAL_AI_Trigger_Area_X, GLOBAL_AI_Trigger_Area_Y, 0, false, -1];
LOC3_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];

LOC3_trigger setTriggerStatements ["this", "execVM 'Warzone\Warzone Locations\loc3.sqf'"," LOC_tracker = 3; execVM 'Warzone\Warzone Locations\locDespawn.sqf';"];

//Spawns / despawns the AI depending on if there are players nearby


//Example not functional rn
//LOC2_trigger setTriggerStatements ["this", "execVM 'Warzone Locations\loc2.sqf'", "execVM 'Warzone Locations\locDespawn.sqf'; LOC_tracker = 2;"];
















