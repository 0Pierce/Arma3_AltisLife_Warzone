

//Sleeps the designated amount before respawning each locations
if(LOC_count == 1) then{

	hint "respawn started on LOC1";
	//Adjust respawn time
	sleep GLOBAL_AI_Respawn_Timer;
	execVM "Warzone\Warzone Locations\loc1.sqf";
};



if(LOC_count == 3) then{

	//hint "respawn started on LOC3";
	//Adjust respawn time
	sleep GLOBAL_AI_Respawn_Timer;
	execVM "Warzone\Warzone Locations\loc3.sqf";
};