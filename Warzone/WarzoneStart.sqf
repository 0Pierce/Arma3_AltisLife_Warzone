

marker1E = createMarker ["Mkr1E", [12294.837, 8879.797]];
marker1 = createMarker ["Mkr1", [12294.837, 8879.797]];

	marker1E setMarkerShape "ELLIPSE";
	marker1E setMarkerSize [100,100];
	marker1E setMarkerColor "ColorRed";

	

	
	marker1 setMarkerType "hd_warning";
	marker1 setMarkerSize [1.5,1.5];
	marker1 setMarkerColor "ColorRed";
	marker1 setMarkerText "Facility #1";






//Markers for location 3

marker13E = createMarker ["Mkr3E", [9773.811, 9400.008]];
marker13 = createMarker ["Mkr3", [9773.811, 9400.008]];

	marker13E setMarkerShape "ELLIPSE";
	marker13E setMarkerSize [100,100];
	marker13E setMarkerColor "ColorRed";

	

	
	marker13 setMarkerType "hd_warning";
	marker13 setMarkerSize [1.5,1.5];
	marker13 setMarkerColor "ColorYellow";
	marker13 setMarkerText "Outpost #1";








//Starts warzone
execVM "Warzone\WarzoneControl.sqf";
//Spawns the first key
execVM "Warzone\Warzone Locations\locKeySpawn.sqf";







//_openColor = {220,20,60};







