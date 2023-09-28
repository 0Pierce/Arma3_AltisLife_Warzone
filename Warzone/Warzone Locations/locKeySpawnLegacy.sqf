hint"Ran KeySpawn";

LOC3_Key1 = createVehicle ["Box_CSAT_Equip_F", [9781.915,9392.567,3.231]]; //Command Post
LOC3_Key2 = createVehicle ["Box_CSAT_Equip_F", [9762.994,9366.421]];//Camp site

LOC3_Key3 = createVehicle ["Box_CSAT_Equip_F", [9748.597,9348.902]]; //Tent Outside
LOC3_Key4 = createVehicle ["Box_CSAT_Equip_F", [9738.28,9387.251]]; //Outside House
LOC3_Key5 = createVehicle ["Box_CSAT_Equip_F", [9724.453,9360.099]]; LOC3_Key5 setDir 90; //Tent Inside
LOC3_Key6 = createVehicle ["Box_CSAT_Equip_F", [9731.193,9397.106,6.102]]; //2nd Floor House
//LOC3_Unlocker = createVehicle ["Land_MultiScreenComputer_01_black_F", [9763.171,9368.1785,0.865]]; LOC3_Unlocker setDir 210;

//Grabs the ID of the table from LOC3Buildings and then creates a computer on top of said table that is then stored in LOC3_Unlocker.
//3am :(
LOC3_Temp = [[LOC3_Table, "TOP"], "Land_MultiScreenComputer_01_black_F",1,[0,0,0], 260] call BIS_fnc_spawnObjects;

LOC3_TEST = createVehicle ["IG_supplyCrate_F", [9752.994,9366.421]];// NEAR Camp site



LOC3_TEST, true remoteExec ["lockInventory", LOC3_TEST, true];

LOC3_Unlocker = LOC3_Temp select 0;

//LOC3_Unlocker setDir 210;
//Creates a 2D array that stores all the locations a key can spawn
KEY_Spawn_Positions = [
//Location 3 Array


//Index 0 Of Master array
//Outpost #1
[
LOC3_Key1,
LOC3_Key2,  
LOC3_Key3,  
LOC3_Key4,  
LOC3_Key5,  
LOC3_Key6
]





];


//["Land_WoodenTable_small_F",[8.60449,-4.50293,0.00113678],298.666,1,0,[],"","",true,false] 
//["Land_MultiScreenComputer_01_black_F",[8.60449,-4.60449,-0.00239563],208.121,1,0,[],"","",true,false] 


private _selectedKeySpawn = KEY_Spawn_Positions select 0;

//Puts the key into a random box
Random_Location = selectRandom KEY_Spawn_Positions;
Random_Crate = selectRandom Random_Location;
Random_Crate addMagazineCargoGlobal ["Keys", 1];



//Goes through the entire array of crates and deletes all their contents
for "_i" from 0 to count KEY_Spawn_Positions -1 do
{
	KEY_Spawn_Positions select _i apply {clearItemCargoGlobal _x};
};


//ORIGINAL
/*
//Locks all the crates inventories
for "_i" from 0 to count KEY_Spawn_Positions -1 do
{
	 //KEY_Spawn_Positions select _i apply {_x lockInventory true};
	 KEY_Spawn_Positions select _i apply {[_x, true] remoteExecCall ["lockInventory", _x], true};
};
*/

LOC3_TEST lockInventory true;
//Lock crates

/*
{
    [_x,true] remoteExec ["lockInventory", [0, -2] select isDedicated,true];
} forEach (KEY_Spawn_Positions select 0);
*/


{
    [_x,true] remoteExec ["lockInventory",0];
} forEach _selectedKeySpawn;




//https://community.bistudio.com/wiki/publicVariableServer
//publicVariableServer

//Lock3Count = 0;
//Lets players open the crates

LOC3_Caller_count = 0;
[LOC3_Unlocker,["Unlock Crates",{



		LOC3_Caller_count = LOC3_Caller_count+1;

		//Makes sure only one person can call this action, onces its activated another person cannot call it

		//TESTING ======================
		
		//TESTING ======================
			params ["_target", "_caller", "_actionId", "_arguments"];
			hint"Unlocking";

				
    		private _lockedInventorys = _arguments select 0;
			systemchat "Ran unlock";

			//The timeleft variable not actually getting updated because the globalKeyCrate is begin run on server only needs to be ran on clients too
			timeLeft = GLOBAL_KeyCrate_Open_Time;
			timeLeft = 5;
			//Sets the timer to open all the crates
			
		//Needs to check if player is still alive, if not cancel and reset
			systemchat format ["player detect %1",Near_Crate];
			//Not entering loop
			//|| Near_Crate == false
				while{timeLeft > 0} do{
				systemchat "Ran loop";
				//Makes sure the player is near the computer
				//if(Near_Crate == true) then{
				systemchat "Player detected";
				
				["Unlocking in: %1s",timeLeft] remoteExecCall ["hint format", 0];


				
				hint format["Unlocking in: %1s",timeLeft];
				//format ["%1 Message",_timeLeft] remoteExec ["hint", [0,-2] select isDedicated];
				sleep 1;
				timeLeft=timeLeft-1;

				
/*
				//If player is alive
				//TESTING ======================
				if(!alive _caller )then{
					break;
				}else{
					format ["Ur alive"] remoteExec ["hint", [0,-2] select isDedicated];
				}
*/
			//TESTING ======================
			//	}else{
			//		systemchat "Player not detect";
					
			//		hint "You are too far";
			//	}
			
			
				
			};

			
			systemchat format ["Player not detect %1", timeLeft];
			systemchat "Unlocked";
			hint"Crates Unlocked!";
			LOC3_Unlocker removeAction _actionId;

			/*
			
			{
				KEY_Spawn_Positions, false remoteExec ["lockInventory", LOC3_TEST, true];
			} forEach (KEY_Spawn_Positions select 0);
			*/


			   {
        [_x, false] remoteExec ["lockInventory", 0, true];
        systemchat format ["UNLOCKED CRATE %1",_x];
    	} forEach _lockedInventorys;
			
			

			systemchat "TESTING FOR GAY ASS ERROR";

//Unlocks the crates



/*
	{
    _x lockInventory false;
} forEach (KEY_Spawn_Positions select 0);
*/

			

	

		


	
	
	





},[],6,false,true,"","_this distance _target < 3"]] remoteExec ["addAction",0];
















































	
	
