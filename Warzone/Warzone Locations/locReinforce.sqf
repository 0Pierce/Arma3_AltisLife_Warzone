if(LOC_tracker < 1)then{
	hint"Location Tracking Error";
};


if(LOC_tracker == 1) then{

	//Randomly spawns in AI
	
		_MARK_X = 11822.7;
		_MARK_Y = 8155.558;
		_HeliDrop = [12413.165, 8371.894];
		_centerBase = [12293.518, 8889.604];
		_ReinHeliINFSpawn = [15412.216, 2809.427];
		_ReinHeliINFSpawn2 = [15512.216, 2809.427];
		_center = 0;
		_marker = getMarkerPos "marker1";
		//_pos marker1 [_radius * sqrt random 1, random 360];
		//_pos getMarkerPos "marker1" [_radius * sqrt random 1, random 360];
		 //_center = getPos player * [_radius * sqrt random 1, random 360];



		//	private _angle = random 360;						// angle definition (0..360)
		//	private _randomSquareRoot = sqrt random 1;			// random square-root to obtain a non-linear 0..1 value
		//	private _distance = _radius * _randomSquareRoot;	// distance from the center definition (0..radius)
			//private _position = _marker getPos [_distance, _angle];
		// _position = _marker getPos [_radius * random[-1,0,1], random 180];
        // Generat``e random position within the radius
        _randomX = _MARK_X + (random (GLOBAL_Reinforce_radius * 2)) - GLOBAL_Reinforce_radius;
        _randomY = _MARK_Y + (random (GLOBAL_Reinforce_radius * 2)) - GLOBAL_Reinforce_radius;
     //   _unitPos = [_randomX, _randomY, 0];


		
		



	//	_randomX = 
	//	_randomY

        // Spawn AI unit at the random position
       // _unit = Location1 createUnit [GLOBAL_Soldier_Type3, _position, [], 0, "CAN_COLLIDE"];
 


//Could use an array and loop for this, or just spawn a group instead. I personally like it all laid out.
//But if you want to dynamically change the amount of troops then you will need an array
	_unit0 = Location1 createUnit [GLOBAL_Soldier_Type1, [_randomX,_randomY ], [], 0, "CAN_COLLIDE"];
    _unit1 = Location1 createUnit [GLOBAL_Soldier_Type2, [_randomX,_randomY ], [], 0, "CAN_COLLIDE"];
    _unit2 = Location1 createUnit [GLOBAL_Soldier_Type3, [_randomX,_randomY ], [], 0, "CAN_COLLIDE"];
    _unit3 = Location1 createUnit [GLOBAL_Soldier_Type4, [_randomX,_randomY ], [], 0, "CAN_COLLIDE"];
    _unit4 = Location1 createUnit [GLOBAL_Soldier_Type2, [_randomX,_randomY ], [], 0, "CAN_COLLIDE"];

	[_unit0, _unit1, _unit2, _unit3, _unit4] join Location1;
	//Location1 addWaypoint  [_marker, 0];

	

	//Heli group
	Location1ReinFINF = createGroup resistance;
	Location1Pilots = createGroup resistance;

	//Heli pilots
	_unitP0 = Location1Pilots createUnit [GLOBAL_Soldier_Type1, [_randomX,_randomY], [], 0, "NONE"];
	

	[_unitP0] join Location1Pilots;
	Location1Pilots selectLeader _unitP0;

	_unit0H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type1, [_randomX,_randomY], [], 0, "NONE"];
    _unit1H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type2, [_randomX,_randomY], [], 0, "NONE"];
    _unit2H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type3, [_randomX,_randomY], [], 0, "NONE"];
    _unit3H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type4, [_randomX,_randomY], [], 0, "NONE"];
    _unit4H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type2, [_randomX,_randomY], [], 0, "NONE"];
	_unit5H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type1, [_randomX,_randomY], [], 0, "NONE"];
    _unit6H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type2, [_randomX,_randomY], [], 0, "NONE"];
    _unit7H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type3, [_randomX,_randomY], [], 0, "NONE"];
    _unit8H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type4, [_randomX,_randomY], [], 0, "NONE"];
    _unit9H = Location1ReinFINF createUnit [GLOBAL_Soldier_Type2, [_randomX,_randomY], [], 0, "NONE"];

	[_unit0H, _unit1H, _unit2H, _unit3H, _unit4H,_unit5H,_unit6H,_unit7H,_unit8H,_unit9H] join Location1ReinFINF;

	Location1ReinFINF selectLeader _unit0H;
	_heliInfUnits = units Location1ReinFINF;


	
	Location1ReinFA = createGroup resistance;

	
	
	//Heli is made global, its a fairly bad way of doing this, should have been stored in setVariable, but Im lazy
	//Also, heli does not join group, only the pilot does
	heli = createVehicle ["I_Heli_Transport_02_F", _ReinHeliINFSpawn, [], 0, "FLY"];
	heli lock 3;
	heli lockInventory true;

	_unitP0 moveInDriver heli;

		{

		_x moveInCargo heli;
	} forEach _heliInfUnits;


	_wpp = Location1Pilots addWaypoint[_HeliDrop, 0];
	_wpp setWaypointType "TR UNLOAD";
	_wpp setWaypointSpeed "FULL";
	_wpp setWaypointBehaviour "COMBAT";



	
	[Location1Pilots, 2] synchronizeWaypoint [[Location1ReinFINF, 3]];
	
	

	


	_wpp3 = Location1Pilots addWaypoint[_ReinHeliINFSpawn, 0];
	_wpp3 setWaypointType "MOVE";
	_wpp3 setWaypointSpeed "FULL";
	_wpp3 setWaypointBehaviour "COMBAT";

	
	_wpp3 setWaypointStatements ["true","{deleteVehicle _x} forEach crew (heli) + [heli]"];
	
	heli2A = createVehicle ["I_Heli_light_03_dynamicLoadout_F", _ReinHeliINFSpawn2, [], 0, "FLY"];
	heli2A lock 3;
	heli2A lockInventory true;
	createVehicleCrew heli2A;
	[heli2A] join Location1ReinFA;

	_awpp = Location1ReinFA addWaypoint[_centerBase,0];
	_awpp setWaypointType "SAD";
	_awpp setWaypointSpeed "FULL";
	_awpp setWaypointBehaviour "COMBAT";

	_awpp2 = Location1ReinFA addWaypoint[_ReinHeliINFSpawn,0];
	_awpp2 setWaypointStatements ["true","{deleteVehicle _x} forEach crew (heli2A) + [heli2A]"];
	

//Waypoint mechanics
	_infWP = Location1ReinFINF addWaypoint[_centerBase,0];
	_infWP setWaypointType "MOVE";
	_infWP setWaypointSpeed "FULL";

	//Makes it so the squad inside the heli actually gets a waypoint
	[Location1Pilots, 2] synchronizeWaypoint [[Location1ReinFINF, 3]];

	_infWP = Location1ReinFINF addWaypoint[_centerBase,0];
	_infWP setWaypointType "MOVE";
	_infWP setWaypointSpeed "FULL";
//Waypoint mechanics

//	[_heli2A] join Location1ReinFA;
//	Location1ReinFA = createGroup resistance;
	//_wpp1A = Location1ReinF addWaypoint[_HeliDrop, 0];
	//_wpp1A setWaypointType "MOVE";
//	_wpp1A setWaypointSpeed "FULL";



	//_wpp1A = Location1ReinF addWaypoint[_HeliDrop, 0];
	//_wpp1A setWaypointType "SAD";
//	_wpp1A setWaypointSpeed "FULL";
	//_wpp1A setWaypointBehaviour "COMBAT";
};








if(LOC_tracker == 3) then{

	hint"Reinfor comin";

	//Randomly spawns in AI
	
		_MARK_X = 11822.7;
		_MARK_Y = 8155.558;
		_HeliDrop3 = [9822.797, 8882.898];
		_centerBase = [9773.811, 9400.008];
		_Rein3HeliINFSpawn = [7511.622, 5765.288];
		_Rein3HeliINFSpawn2 = [15112.216, 2809.427];
		_center = 0;
		_marker = getMarkerPos "marker13";
		_AITempSpawn = [8283, 7023.281];
		
		




 




	

	

	//Heli group
	Location3ReinFINF = createGroup resistance;
	Location3Pilots = createGroup resistance;

	//Heli pilots
	_unitP0 = Location3Pilots createUnit [GLOBAL_Soldier_Type1, _AITempSpawn, [], 0, "NONE"];
	

	[_unitP0] join Location3Pilots;
	Location3Pilots selectLeader _unitP0;

	_unit0H = Location3ReinFINF createUnit [GLOBAL_Soldier_Type1, _AITempSpawn, [], 0, "NONE"];
    _unit1H = Location3ReinFINF createUnit [GLOBAL_Soldier_Type2, _AITempSpawn, [], 0, "NONE"];
    _unit2H = Location3ReinFINF createUnit [GLOBAL_Soldier_Type3, _AITempSpawn, [], 0, "NONE"];
    _unit3H = Location3ReinFINF createUnit [GLOBAL_Soldier_Type4, _AITempSpawn, [], 0, "NONE"];
    _unit4H = Location3ReinFINF createUnit [GLOBAL_Soldier_Type2, _AITempSpawn, [], 0, "NONE"];
	_unit5H = Location3ReinFINF createUnit [GLOBAL_Soldier_Type1, _AITempSpawn, [], 0, "NONE"];


	[_unit0H, _unit1H, _unit2H, _unit3H, _unit4H,_unit5H] join Location3ReinFINF;

	Location3ReinFINF selectLeader _unit0H;
	_heliInfUnits = units Location3ReinFINF;


	
	

	
	
	//Heli is made global, its a fairly bad way of doing this, should have been stored in setVariable, but Im lazy
	//Also, heli does not join group, only the pilot does
	
	heliL3 = createVehicle ["I_Heli_Light_03_unarmed_F", _Rein3HeliINFSpawn, [], 0, "FLY"];
	heliL3 lock 3;
	heliL3 lockInventory true;
	

	_unitP0 moveInDriver heliL3;

		{

		_x moveInCargo heliL3;
	} forEach _heliInfUnits;


	_wpp = Location3Pilots addWaypoint[_HeliDrop3, 0];
	_wpp setWaypointType "TR UNLOAD";
	_wpp setWaypointSpeed "FULL";
	_wpp setWaypointBehaviour "COMBAT";



	_wpp3 = Location3Pilots addWaypoint[_Rein3HeliINFSpawn, 0];
	_wpp3 setWaypointType "MOVE";
	_wpp3 setWaypointSpeed "FULL";
	_wpp3 setWaypointBehaviour "COMBAT";

	
	_wpp3 setWaypointStatements ["true","{deleteVehicle _x} forEach crew (heliL3) + [heliL3]"];
	
	




//Waypoint mechanics
	_infWP = Location3ReinFINF addWaypoint[_centerBase,0];
	_infWP setWaypointType "MOVE";
	_infWP setWaypointSpeed "FULL";

	//Makes it so the squad inside the heli actually gets a waypoint
	[Location3Pilots, 2] synchronizeWaypoint [[Location3ReinFINF, 3]];

	_infWP = Location3ReinFINF addWaypoint[_centerBase,0];
	_infWP setWaypointType "MOVE";
	_infWP setWaypointSpeed "FULL";
};