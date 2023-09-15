if(LOC_tracker == 1) then
{
hint "Despawned 1";
//How long do you want the troops to linger after the player has left the area
sleep GLOBAL_AI_Despawn;
//Deletes all the units
LOC1_units apply {deleteVehicle _x};

deleteVehicle LOC1_loot;
};



if(LOC_tracker == 3) then
{
hint "Despawned 3";
//How long do you want the troops to linger after the player has left the area
sleep GLOBAL_AI_Despawn;
//Deletes all the units
LOC3_units apply {deleteVehicle _x};

};