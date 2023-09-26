
//Hint not working for computer at LOC3
//Countdown not starting at LOC3

//Crate at LOC1 inventory open for some, locked for olthers
//Also not opening for all once unlocked



 //Soldier type


	//Default marker for LOC1
	marker1E setMarkerShape "ELLIPSE";
	marker1E setMarkerSize [100,100];
	marker1E setMarkerColor "ColorRed";

	
	
	marker1 setMarkerType "hd_warning";
	marker1 setMarkerSize [1.5,1.5];
	marker1 setMarkerColor "ColorRed";
	marker1 setMarkerText "Facility #1";

    
    FAC1_unitsAlive = 5;


	CivTest = createGroup civilian;
    _unitciv = CivTest createUnit ["C_Man_casual_8_F", [12279.812, 8908.474, 0], [], 0, "CAN_COLLIDE"];
	//_unitciv  addRating -5000;
	[_unitciv] join CivTest;


	//Spawns units
	_unit0 = Location1 createUnit [GLOBAL_Soldier_Type1, [12293.518, 8889.604, 0], [], 0, "CAN_COLLIDE"];
    _unit1 = Location1 createUnit [GLOBAL_Soldier_Type2, [12303.728, 8891.079, 0], [], 0, "CAN_COLLIDE"];
    _unit2 = Location1 createUnit [GLOBAL_Soldier_Type3, [12306.736, 8885.33, 4.490], [], 0, "CAN_COLLIDE"];
    _unit3 = Location1 createUnit [GLOBAL_Soldier_Type4, [12298.964, 8868.129, 17.793], [], 0, "CAN_COLLIDE"];
    _unit4 = Location1 createUnit [GLOBAL_Soldier_Type2, [12289.493, 8866.175, 0.535], [], 0, "CAN_COLLIDE"];

	//Patrol
	_unit0P = Location1_Patrol createUnit [GLOBAL_Soldier_Type3, [12280.099, 8885.438, 0], [], 0, "CAN_COLLIDE"];
	_unit1P = Location1_Patrol createUnit [GLOBAL_Soldier_Type3, [12280.099, 8885.438, 0], [], 0, "CAN_COLLIDE"];
	_unit2P = Location1_Patrol createUnit [GLOBAL_Soldier_Type3, [12280.099, 8885.438, 0], [], 0, "CAN_COLLIDE"];
	

    _unit0 disableAI "PATH";
    _unit1 disableAI "PATH";
    _unit2 disableAI "PATH";
    _unit3 disableAI "PATH";
    _unit4 disableAI "PATH";

	[_unit0, _unit1, _unit2, _unit3, _unit4] join Location1;
	[_unit0P, _unit1P, _unit2P] join Location1_Patrol;

	//Sets the patrol
	[Location1_Patrol, getpos _unit0P, GLOBAL_Patrol_Radius] call BIS_fnc_taskPatrol;

	//Puts all the units into an array so they can be altered anywhere
	//LOC1_unitsP = units Location1_Patrol;

	LOC1_units = units Location1;
	LOC1_units append units Location1_Patrol;
	
    LOC1_loot = createVehicle ["IG_supplyCrate_F", [12287.366,8894.67]];
	//LOC1_loot lockInventory true;
	//Locks the inventory and enables JIP
	LOC1_loot, true remoteExec ["lockInventory", LOC1_loot, true];
	


//Checks if the player has the key to open the crate
[LOC1_loot,["Unlock",{

		if ("Keys" in magazines player) then{
			player removeItem "Keys";
			hint"Crate Unlocking";
			LOC_tracker = 1;
			execVM "Warzone\Warzone Locations\locReinforce.sqf";
			_timeLeft = GLOBAL_LootCrate_Unlock_Time;
			while{_timeLeft >=0} do{
				
				hint format[ "Unlocking in: %1s",_timeLeft];
				sleep 1;
				_timeLeft=_timeLeft-1;
				
				
			};
			
			
			hint"Crate Unlocked!";
			//LOC1_loot lockInventory false;
			LOC1_loot, false remoteExec ["lockInventory", LOC1_loot, true];
		}else{
			hint"Missing Key";
		}




},[],6,false,true,"","_this distance _target < 3"]] remoteExec ["addAction",0,true];









	_unit0 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC1_unitsAlive = FAC1_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC1_unitsAlive];

	//Checks if last enemy has been killed
	if (FAC1_unitsAlive == 0) then{
		marker1E setMarkerColor "ColorGreen";
		marker1 setMarkerText "Facility #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1' color='#FFFFFF'>" + "Facility #1 has been raided"+"</t>"; 
[_texta,/* poz x */ 0,/* poz y */ 1,/*durata*/ 5,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;

	//Begins respawn
	LOC_count = 1;
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

	}
}];

	_unit1 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC1_unitsAlive = FAC1_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC1_unitsAlive];

	//Checks if last enemy has been killed
	if (FAC1_unitsAlive == 0) then{
		marker1E setMarkerColor "ColorGreen";
		marker1 setMarkerText "Facility #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1' color='#FFFFFF'>" + "Facility #1 has been raided"+"</t>"; 
[_texta,/* poz x */ 0,/* poz y */ 1,/*durata*/ 5,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;

	//Begins respawn
	LOC_count = 1;
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	
		
	}
}];

	_unit2 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC1_unitsAlive = FAC1_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC1_unitsAlive];

	//Checks if last enemy has been killed
	if (FAC1_unitsAlive == 0) then{
		marker1E setMarkerColor "ColorGreen";
		marker1 setMarkerText "Facility #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1' color='#FFFFFF'>" + "Facility #1 has been raided"+"</t>"; 
[_texta,/* poz x */ 0,/* poz y */ 1,/*durata*/ 5,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;

	//Begins respawn
 	LOC_count = 1;
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	
	}
}];

	_unit3 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC1_unitsAlive = FAC1_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC1_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC1_unitsAlive == 0) then{
		marker1E setMarkerColor "ColorGreen";
		marker1 setMarkerText "Facility #1 - RAIDED";
		
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1' color='#FFFFFF'>" + "Facility #1 has been raided"+"</t>"; 
[_texta,/* poz x */ 0,/* poz y */ 1,/*durata*/ 5,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
	//Begins respawn
	LOC_count = 1;
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];

	_unit4 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC1_unitsAlive = FAC1_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC1_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC1_unitsAlive == 0) then{
		marker1E setMarkerColor "ColorGreen";
		marker1 setMarkerText "Facility #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1' color='#FFFFFF'>" + "Facility #1 has been raided"+"</t>"; 
[_texta,/* poz x */ 0,/* poz y */ 1,/*durata*/ 5,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;


	//Begins respawn
 	 LOC_count = 1;
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];



	


	
	

