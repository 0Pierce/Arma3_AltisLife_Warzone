removebackpack _this; //gets rid of the current backpack

_backpack = _this addBackpack "B_ViperLightHarness_ghex_F"; //Replace classname with your choice of backpack, obviously, if you wish



_backpack addItemCargo ["FirstAidKit",3];
_this addHeadgear  ["H_HelmetB_TI_tna_F"];
_this addVest["V_HarnessO_ghex_F"];
_this addWeapon["srifle_DMR_01_F"];
_this addWeaponItem ["srifle_DMR_01_F","optic_Holosight"];
_this addWeaponItem ["srifle_DMR_01_F","bipod_03_F_blk"];
_this addWeaponItem ["srifle_DMR_01_F","muzzle_snds_B_arid_F"];
_this addGoggles[G_Balaclava_TI_G_blk_F];

_backpack addmagazinecargo ["SmokeShell", 2];
_backpack addmagazinecargo ["HandGrenade", 12];
_backpack addmagazinecargo ["100Rnd_65x39_caseless_mag",6];