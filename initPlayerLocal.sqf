
//Gives player action

player addAction ["Load", {execVM "Warzone\WarzoneStart.sqf";}];
player addAction ["God", {player allowDamage false; hint"god";}];

player addAction ["Loc3 Reinf", {LOC_tracker = 3;execVM "Warzone\Warzone Locations\locReinforce.sqf";}];
//player addRating -5000;