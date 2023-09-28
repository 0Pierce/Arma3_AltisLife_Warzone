removebackpack _this; //gets rid of the current backpack
_this addBackpack "B_ViperLightHarness_ghex_F"; //Replace classname with your choice of backpack, obviously, if you wish
 //creates a local variable for use in the rest of this script

_this addHeadgear  ["H_HelmetB_TI_tna_F",1];
_this addVest["V_HarnessO_ghex_F"];
_this addWeapon["srifle_DMR_01_F"];

_backpac kaddGoggles[];

_backpack addmagazinecargo ["SmokeShell", 2];
_backpack addmagazinecargo ["HandGrenade", 12];
_backpack addmagazinecargo ["100Rnd_65x39_caseless_mag",6];