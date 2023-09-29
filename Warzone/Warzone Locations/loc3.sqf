







_rotation = random(200);





	


	//Default marker for LOC3
	marker13E setMarkerShape "ELLIPSE";
	marker13E setMarkerSize [100,100];
	marker13E setMarkerColor "ColorRed";

	
	
	marker13 setMarkerType "hd_warning";
	marker13 setMarkerSize [1.5,1.5];
	marker13 setMarkerColor "ColorYellow";
	marker13 setMarkerText "Outpost #1";


    
    FAC3_unitsAlive = 10;

	



	//Spawns units
	_unit0 = Location3 createUnit [GLOBAL_Soldier_Type2, [9782.482, 9385.969, 3.122], [], 0, "CAN_COLLIDE"];
    _unit1 = Location3 createUnit [GLOBAL_Soldier_Type2, [9778.714, 9396.107, 3.473], [], 0, "CAN_COLLIDE"]; //Command post
    _unit2 = Location3 createUnit [GLOBAL_Soldier_Type3, [9765.111, 9419.481, 4.184], [], 0, "CAN_COLLIDE"];

    _unit3 = Location3 createUnit [GLOBAL_Soldier_Type3, [9735.934, 9388.03, 10.390], [], 0, "CAN_COLLIDE"];
    _unit4 = Location3 createUnit [GLOBAL_Soldier_Type2, [9737.923, 9399.543, 5.283], [], 0, "CAN_COLLIDE"];
	_unit5 = Location3 createUnit [GLOBAL_Soldier_Type2, [9738.306, 9335.179, 4.750], [], 0, "CAN_COLLIDE"];
	_unit6 = Location3 createUnit [GLOBAL_Soldier_Type3, [9759.152, 9325.284, 0.535], [], 0, "CAN_COLLIDE"];
	_unit7 = Location3 createUnit [GLOBAL_Soldier_Type2, [9778.885, 9361.679, 0.535], [], 0, "CAN_COLLIDE"];
	_unit8 = Location3 createUnit [GLOBAL_Soldier_Type3, [9766.181, 9370.251, 0.535], [], 0, "CAN_COLLIDE"];
	_unit9 = Location3 createUnit [GLOBAL_Soldier_Type2, [9771.730, 9400.272, 0.535], [], 0, "CAN_COLLIDE"];



	//Patrol
	_unit0P = Location3_Patrol0 createUnit [GLOBAL_Soldier_Type3, [9728.371, 9348.465, 0], [], 0, "CAN_COLLIDE"];
	_unit1P = Location3_Patrol0 createUnit [GLOBAL_Soldier_Type3, [9728.371, 9348.465, 0], [], 0, "CAN_COLLIDE"];
	_unit2P = Location3_Patrol0 createUnit [GLOBAL_Soldier_Type3, [9728.371, 9348.465, 0], [], 0, "CAN_COLLIDE"];
	
	_unit3P = Location3_Patrol1 createUnit [GLOBAL_Soldier_Type3, [9811.526, 9372.131, 0], [], 0, "CAN_COLLIDE"];
	_unit4P = Location3_Patrol1 createUnit [GLOBAL_Soldier_Type3, [9811.526, 9372.131, 0], [], 0, "CAN_COLLIDE"];
	_unit5P = Location3_Patrol1 createUnit [GLOBAL_Soldier_Type3, [9811.526, 9372.131, 0], [], 0, "CAN_COLLIDE"];

Location3_test = createGroup resistance;
//Test INF
	_unit3TEST = Location3_test createUnit [GLOBAL_Soldier_TypeTESTING, [9811.526, 9372.131, 0], [], 0, "CAN_COLLIDE"];
	_unit4TEST = Location3_test createUnit [GLOBAL_Soldier_TypeTESTING, [9811.526, 9372.131, 0], [], 0, "CAN_COLLIDE"];
	_unit5TEST = Location3_test createUnit [GLOBAL_Soldier_TypeTESTING, [9811.526, 9372.131, 0], [], 0, "CAN_COLLIDE"];

	


	[_unit3TEST, _unit4TEST, _unit5TEST] join Location3_test;

	_unit3TEST setUnitLoadout (configFile >> "CfgVehicles" >> "B_Soldier_F");
	_unit4TEST setUnitLoadout (missionConfigFile >> "B_Soldier_F");


 gcount = count units Location3_test;



{
_x addEventHandler ["Killed", {
	gcount = gcount-1;

	//Checks if last enemy has been killed
	if (gcount == 0) then{
		
		["Worked"] remoteExec ["hint", 0]; 

	}
}];



}forEach units Location3_test;




	

    _unit0 disableAI "PATH";
    _unit1 disableAI "PATH";
    _unit2 disableAI "PATH";
    _unit3 disableAI "PATH";
    _unit4 disableAI "PATH";
	_unit5 disableAI "PATH";
	_unit6 disableAI "PATH";
	_unit7 disableAI "PATH";
	_unit8 disableAI "PATH";
	_unit9 disableAI "PATH";


	[_unit0, _unit1, _unit2, _unit3, _unit4,_unit5,_unit6,_unit7,_unit8,_unit9] join Location3;
	[_unit0P, _unit1P, _unit2P] join Location3_Patrol0;
	[_unit3P, _unit4P, _unit5P] join Location3_Patrol1;

	


	//Sets the patrol
	[Location3_Patrol0, getpos _unit0P, GLOBAL_Patrol_Radius] call BIS_fnc_taskPatrol;
	[Location3_Patrol1, getpos _unit0P, GLOBAL_Patrol_Radius] call BIS_fnc_taskPatrol;


	






	
	Location3 setBehaviour "SAFE";
	Location3_Patrol0 setBehaviour "SAFE";
	Location3_Patrol1 setBehaviour "SAFE";
	

	//Puts the units into a single array for deletion
	LOC3_units = units Location3;
	LOC3_units append units Location3_Patrol0;
	LOC3_units append units Location3_Patrol1;










//Puts event handlers on all the AI guards

	_unit0 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];

	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		

		LOC_tracker = 3;
		LOC_count = 3;
	//Calls in backup
	 	execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 	execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

	}
}];

	_unit1 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];

	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		

	
		LOC_tracker = 3;
		LOC_count = 3;
	//Calls in backup
		 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 		 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	
		
	}
}];

	_unit2 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];

	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
	
		LOC_tracker = 3;
		LOC_count = 3;
	//Calls in backup
	 	execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 		 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	
	}
}];

	_unit3 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		
		txt5Layer = "txt5" call BIS_fnc_rscLayer;

		LOC_tracker = 3;
		LOC_count = 3;
	//Calls in backup
	 	execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 		 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];

	_unit4 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


		LOC_tracker = 3;
		LOC_count = 3;
	//Calls in backup
		 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 		 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];


	_unit5 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


	LOC_tracker = 3;
	LOC_count = 3;
	//Calls in backup
	 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];


	_unit6 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


	LOC_tracker = 3;
	LOC_count = 3;
	//Calls in backup
	 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];

	_unit7 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


	LOC_tracker = 3;
	LOC_count = 3;
	//Calls in backup
	 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];

	_unit7 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


	LOC_tracker = 3;
	LOC_count = 3;
	//Calls in backup
	 execVM "Warzone\Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 execVM "Warzone\Warzone\Warzone Locations\locRespawn.sqf";

		
	}
}];



	_unit8 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


	LOC_tracker = 3;
	LOC_count = 3;
	//Calls in backup
	 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];


	_unit9 addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	FAC3_unitsAlive = FAC3_unitsAlive -1;
	hint format ["There are: %1 Guard/s remaining.", FAC3_unitsAlive];


	//Checks if last enemy has been killed
	if (FAC3_unitsAlive == 0) then{
		marker13E setMarkerColor "ColorGreen";
		marker13 setMarkerText "Outpost #1 - RAIDED";
		txt5Layer = "txt5" call BIS_fnc_rscLayer;


	LOC_tracker = 3;
	LOC_count = 3;
	//Calls in backup
	 execVM "Warzone\Warzone Locations\locReinforce.sqf";
	 //Begins respawn
 	 execVM "Warzone\Warzone Locations\locRespawn.sqf";
	

		
	}
}];
	


	
	

