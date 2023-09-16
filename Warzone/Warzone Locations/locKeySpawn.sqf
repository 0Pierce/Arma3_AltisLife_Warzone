hint"Ran KeySpawn";

LOC3_Key1 =  createVehicle ["Box_CSAT_Equip_F", [9781.915,9392.567,3.231]]; //Command Post
LOC3_Key2 =  createVehicle ["Box_CSAT_Equip_F", [9762.994,9366.421]];//Camp site
LOC3_Key3 =  createVehicle ["Box_CSAT_Equip_F", [9748.597,9348.902]]; //Tent Outside
LOC3_Key4 = createVehicle ["Box_CSAT_Equip_F", [9738.28,9387.251]]; //Outside House
LOC3_Key5 = createVehicle ["Box_CSAT_Equip_F", [9724.453,9360.099]]; LOC3_Key5 setDir 90; //Tent Inside
LOC3_Key6 = createVehicle ["Box_CSAT_Equip_F", [9731.193,9397.106,6.102]]; //2nd Floor House


//Creates a 2D array that stores all the locations a key can spawn
KEY_Spawn_Positions = [
//Location 3 Array
[
LOC3_Key1,
LOC3_Key2,  
LOC3_Key3,  
LOC3_Key4,  
LOC3_Key5,  
LOC3_Key6

]
//KEY_Spawn_LOC4=[];
//KEY_Spawn_LOC5=[];
//KEY_Spawn_LOC6=[];


];



//Goes through the entire array of crates and deletes all their contents
for "_i" from 0 to count KEY_Spawn_Positions -1 do
{
	

	KEY_Spawn_Positions select _i apply {clearItemCargoGlobal _x};

};

//Selects a random crate to put the key in
Random_Location = selectRandom KEY_Spawn_Positions;
Random_Crate = floor random count Random_Location;
KEY_Spawn_Positions select Random_Location select Random_Crate addItemCargoGlobal ["Keys", 1];


