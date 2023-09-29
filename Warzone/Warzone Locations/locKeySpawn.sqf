
LOC3_Key1 = createVehicle ["Box_CSAT_Equip_F", [9781.915,9392.567,3.231]]; //Command Post
LOC3_Key2 = createVehicle ["Box_CSAT_Equip_F", [9762.994,9366.421]];//Camp site
LOC3_Key3 = createVehicle ["Box_CSAT_Equip_F", [9748.597,9348.902]]; //Tent Outside
LOC3_Key4 = createVehicle ["Box_CSAT_Equip_F", [9738.28,9387.251]]; //Outside House
LOC3_Key5 = createVehicle ["Box_CSAT_Equip_F", [9724.453,9360.099]];  LOC3_Key5 setDir 90; //Tent Inside
LOC3_Key6 = createVehicle ["Box_CSAT_Equip_F", [9731.193,9397.106,6.102]]; //2nd Floor House

//LOC3_Unlocker = createVehicle ["Land_MultiScreenComputer_01_black_F", [9763.171,9368.1785,0.865]]; LOC3_Unlocker setDir 210;

LOC3_Temp = [[LOC3_Table, "TOP"], "Land_MultiScreenComputer_01_black_F",1,[0,0,0], 260] call BIS_fnc_spawnObjects;

LOC3_TEST = createVehicle ["IG_supplyCrate_F", [9752.994,9366.421]];
[LOC3_TEST, true] remoteExec ["lockInventory", 0, true];

LOC3_Unlocker = LOC3_Temp select 0;

KEY_Spawn_Positions = [
	[
	LOC3_Key1,
	LOC3_Key2,  
	LOC3_Key3,  
	LOC3_Key4,  
	LOC3_Key5,  
	LOC3_Key6
	]
];



private _selectedKeySpawn = KEY_Spawn_Positions select 0;
_selectedKeySpawn apply {clearItemCargoGlobal _x};

 Random_Location = selectRandom KEY_Spawn_Positions;
Random_Crate = selectRandom Random_Location;


//Locks the inventories of all the crates
{
    [_x,true] remoteExec ["lockInventory",0];
} forEach _selectedKeySpawn;

//LOC3_Caller_count = 0; // This is only global on server , if you want update/ change need globalVariable / get, setVariable to object




//Add Action
[LOC3_Unlocker,["Hack Crates",{



    //LOC3_Caller_count = LOC3_Caller_count+1;
    params ["_target", "_caller", "_actionId", "_arguments"];
    systemchat "Ran unlock";
    private _lockedInventorys = _arguments select 0;
    private _timeLeft = GLOBAL_KeyCrate_Open_Time;



	//Runs the countdown for the amount of time left
    while {_timeLeft > 0 && {_caller distance _target < GLOBAL_Computer_Crate_Open_Radius}} do {
        format ["Unlocking in: %1s",_timeLeft] remoteExec ["hint", [0,-2] select isDedicated];
        sleep 1;
        _timeLeft = _timeLeft-1;    
    };



    if (_timeLeft != 0) exitWith {
        format ["Cant reach computer"] remoteExec ["hint", [0,-2] select isDedicated];
    };


    format ["All crates is unlocked"] remoteExec ["hint", [0,-2] select isDedicated];
    Random_Crate addMagazineCargoGlobal ["Keys", 1];
    _target removeAction _actionId;

    {
        [_x, false] remoteExec ["lockInventory", 0, true];
        systemchat format ["UNLOCKED CRATE %1",_x];
        
    } forEach _lockedInventorys;

    
},[_selectedKeySpawn],6,false,true,"","_this distance _target < 3"]] remoteExec ["addAction",0];
