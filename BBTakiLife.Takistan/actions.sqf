_arena = 0;
_role = player;
//==================================== GANG MENU ======================================================
action1 =	_role addaction ["Gang Menu","maindialogs.sqf",["gangmenu"],1,false,true,"","player distance rathaus <= 3 and isciv"];
//====================================== BANK ROB =====================================================
action2 =	_role addaction ["<t color='#FF0000'>Rob safe</t>","bankrob.sqf", ["ausrauben", safe],1,false,true,"","player distance safe <= 3 and isciv"];
//========================================= HUNTING ===================================================
action3 =  _role addaction ["Take boar meat","noscript.sqf",'_no = ceil(random 7);if (((call INV_GetOwnWeight) + ("boar" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["wildboar"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["wildboar"],  3] select 0);["boar", _no] call INV_AddInventoryItem;hintSilent format["you got %1 boar meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["wildboar"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["wildboar"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["wildboar"],  3] select 0) and isciv'];
action4 =	_role addaction ["Take rabbit meat","noscript.sqf",'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("rabbit" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["rabbit"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["rabbit"],  3] select 0);["rabbit", _no] call INV_AddInventoryItem;hintSilent format["you got %1 rabbit meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["rabbit"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["rabbit"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["rabbit"],  3] select 0)'];
//===================================== IMPOUND AREA ==================================================
action5 = _role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","(player distance impoundbuy <= 5) || (player distance copcar <= 5) || (player distance unair <= 5)"];
action6 = _role addAction ["<t color='#FF0000'>Steal Government Paychecks</t>", "stealgovmoney.sqf",[""],1,false,true,"","isciv && player distance convoytruck < 5 && (call INV_isArmed)"];
//================================== COP DELETE EVIDENCE ================================================
action7 = _role addaction ["<t color='#00FFFF'>Take evidence</t>","noscript.sqf",'hintSilent "evidence removed."; {deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])',1,true,true,"",'_weps = (nearestobjects [getpos player, ["weaponholder"], 3] select 0); player distance _weps < 5 and !(isciv)'];
//================================== COP SLAVE ACTIONS ================================================
action8 = _role addaction ["<t color='#00FFFF'>Set slave free</t>","noscript.sqf",'_slave = (nearestobjects [getpos player, civslavearray,  3] select 0); _civ = leader _slave; deletevehicle _slave; hintSilent "The slave has been freed!";',1,true,true,"",'_slave = (nearestobjects [getpos player, civslavearray, 3] select 0); !(_slave in playerarray) and player distance _slave < 5 and (leader _slave) in playerarray && !(isciv)'];
//==================================== OBJECT ACTIONS =================================================
action30 = _role addaction ["Remove Searchlight","noscript.sqf",'if (((call INV_GetOwnWeight) + ("SearchLight_US_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["SearchLight_US_EP1"], 3] select 0);["SearchLight_US_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a searchlight";',1,true,true,"",'_light = (nearestobjects [getpos player, ["SearchLight_US_EP1"],  3] select 0); !(_light in speedcamarray) and player distance _light < 5 and (iscop || isun || ispmc)'];
action31 = _role addaction ["Remove Roadblock","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadblock" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  3] select 0);["roadblock", 1] call INV_AddInventoryItem;hintSilent "you picked up a roadblock";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  3] select 0) < 5 and (iscop || isun || ispmc)'];
action32 = _role addaction ["Remove Bargate","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Bargate" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0);["Bargate", 1] call INV_AddInventoryItem;hintSilent "you picked up a bargate";',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 && (iscop || isun || ispmc)'];
action33 = _role addaction ["Remove Road Cone","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadcone" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0);["roadcone", 1] call INV_AddInventoryItem;hintSilent "you picked up a road cone";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0) < 5 and (iscop || isun || ispmc)'];
action34 = _role addaction ["Remove M2 Static","noscript.sqf",'if (((call INV_GetOwnWeight) + ("M2StaticMG_US_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["M2StaticMG_US_EP1"],  3] select 0);["M2StaticMG_US_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a M2 Static";',1,true,true,"",'player distance (nearestobjects [getpos player, ["M2StaticMG_US_EP1"],  3] select 0) < 5 and !(isciv)'];
action35 = _role addaction ["Remove DSHKM Static","noscript.sqf",'if (((call INV_GetOwnWeight) + ("DSHKM_TK_INS_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["DSHKM_TK_INS_EP1"],  3] select 0);["DSHKM_TK_INS_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a DSHKM Static";',1,true,true,"",'player distance (nearestobjects [getpos player, ["DSHKM_TK_INS_EP1"],  3] select 0) < 5'];
action36 = _role addaction ["Open/close gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and !(isciv)'];
action37 = _role addaction ["Remove Big bag fence (corner)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("BigbagfenceCorner" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_corner"],  3] select 0);["BigbagfenceCorner", 1] call INV_AddInventoryItem;hintSilent "you picked up a sandbag wall (corner)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_corner"],  3] select 0) < 5'];
action38 = _role addaction ["Remove Big bag fence","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bigbagfence" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_long"],  3] select 0);["bigbagfence", 1] call INV_AddInventoryItem;hintSilent "you picked up a sandbag wall";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_long"],  3] select 0) < 5'];
action39 = _role addaction ["Remove Big bag fence (round)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bigbagfenceRound" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_round"],  3] select 0);["bigbagfenceRound", 1] call INV_AddInventoryItem;hintSilent "you picked up a sandbag wall (round)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_round"],  3] select 0) < 5'];
action40 = _role addaction ["Remove Bunker (small)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bunkersmall" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fortified_nest_small"],  3] select 0);["bunkersmall", 1] call INV_AddInventoryItem;hintSilent "you picked up a bunker (small)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fortified_nest_small"],  3] select 0) < 5 and !(isciv)'];
action41 = _role addaction ["Remove Office Building","noscript.sqf",'if (((call INV_GetOwnWeight) + ("officebuilding" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["land_A_Office01"],  3] select 0);["officebuilding", 1] call INV_AddInventoryItem;hintSilent "you picked up a officebuilding";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_A_office01"],  3] select 0) < 5 and isciv'];
action42 = _role addaction ["Remove Hedgehog","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Hedgehog_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Hedgehog_EP1"],  3] select 0);["Hedgehog_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Hedgehog";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Hedgehog_EP1"],  3] select 0) < 5 and !(isciv)'];
action43 = _role addaction ["Remove Checkpoint sign","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Sign_Checkpoint_US_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Sign_Checkpoint_US_EP1"],  3] select 0);["Sign_Checkpoint_US_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Checkpoint sign";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Sign_Checkpoint_US_EP1"],  3] select 0) < 5 and !(isciv)'];
action44 = _role addaction ["Remove Camo net","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_CamoNetVar_NATO_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_CamoNetVar_NATO_EP1"],  3] select 0);["Land_CamoNetVar_NATO_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Camo net";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_CamoNetVar_NATO_EP1"],  3] select 0) < 5'];
action45 = _role addaction ["Remove Breaching ladder","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_ladderEP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_ladderEP1"],  5] select 0);["Land_ladderEP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Breaching Ladder";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_ladderEP1"],  5] select 0) < 5 and !(isciv)'];
action46 = _role addaction ["Remove Campfire","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_Campfire_burning" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Campfire_burning"],  5] select 0);["Land_Campfire_burning", 1] call INV_AddInventoryItem;hintSilent "you picked up a Campfire";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Campfire_burning"],  5] select 0) < 5'];
action47 = _role addaction ["Remove Road Barricade","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Fort_Barricade_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Fort_Barricade_EP1"],  5] select 0);["Fort_Barricade_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Road Barricade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Fort_Barricade_EP1"],  5] select 0) < 5'];
action48 = _role addaction ["Remove Command Centre","noscript.sqf",'if (((call INV_GetOwnWeight) + ("US_WarfareBUAVterminal_Base_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["US_WarfareBUAVterminal_Base_EP1"],  5] select 0);["US_WarfareBUAVterminal_Base_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Command Centre";',1,true,true,"",'player distance (nearestobjects [getpos player, ["US_WarfareBUAVterminal_Base_EP1"],  5] select 0) < 5'];
action49 = _role addaction ["Remove Tent","noscript.sqf",'if (((call INV_GetOwnWeight) + ("CampEast_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["CampEast_EP1"],  5] select 0);["CampEast_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Tent";',1,true,true,"",'player distance (nearestobjects [getpos player, ["CampEast_EP1"],  5] select 0) < 5'];
action50 = _role addaction ["Remove Sunshade","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_sunshade_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_sunshade_EP1"],  5] select 0);["Land_sunshade_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Sunshade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_sunshade_EP1"],  5] select 0) < 5'];
action51 = _role addaction ["Remove H-Barrier","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_HBarrier5" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_HBarrier5"],  5] select 0);["Land_HBarrier5", 1] call INV_AddInventoryItem;hintSilent "you picked up a H-Barrier";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_HBarrier5"],  5] select 0) < 5 and (iscop || isun || ispmc)'];
action52 = _role addaction ["Remove Road Barrier","noscript.sqf",'if (((call INV_GetOwnWeight) + ("RoadBarrier" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["RoadBarrier_light"],  5] select 0);["RoadBarrier", 1] call INV_AddInventoryItem;hintSilent "you picked up a Road Barrier";',1,true,true,"",'player distance (nearestobjects [getpos player, ["RoadBarrier_light"],  5] select 0) < 5 and (iscop || isun || ispmc)'];
action53 = _role addaction ["Remove Small Breaching ladder","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Land_ladder_half_EP1" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{hintSilent localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_ladder_half_EP1"],  5] select 0);["Land_ladder_half_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Small Breaching Ladder";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_ladder_half_EP1"],  5] select 0) < 5 and !(isciv)'];
action54 = _role addaction ["Remove UN Flag","noscript.sqf",'deletevehicle (nearestobjects [getpos player, ["FlagCarrierUNO_EP1"],  5] select 0);["FlagCarrierUNO_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a UN Flag";',1,true,true,"",'player distance (nearestobjects [getpos player, ["FlagCarrierUNO_EP1"],  5] select 0) < 5 && isun && (typeOf (nearestobjects [getpos player, ["FlagCarrierUNO_EP1"],  5] select 0) == "FlagCarrierUNO_EP1")'];
action55 = _role addaction ["Remove Police Flag","noscript.sqf",'deletevehicle (nearestobjects [getpos player, ["FlagCarrierBLUFOR_EP1"],  5] select 0);["FlagCarrierBLUFOR_EP1", 1] call INV_AddInventoryItem;hintSilent "you picked up a Police Flag";',1,true,true,"",'player distance (nearestobjects [getpos player, ["FlagCarrierUNO_EP1"],  5] select 0) < 5 && iscop && (typeOf (nearestobjects [getpos player, ["FlagCarrierBLUFOR_EP1"],  5] select 0) == "FlagCarrierBLUFOR_EP1")'];
action56 = _role addaction ["Remove Spikestrip","noscript.sqf",'deletevehicle (nearestobjects [getpos player, ["Fort_RazorWire"],  5] select 0);["Spikestrip", 1] call INV_AddInventoryItem;hintSilent "You removed a Spikestrip";',1,true,true,"",'_spike = nearestobjects [getPos player, ["Fort_RazorWire"],  5] select 0; player distance _spike < 5 && (isun || iscop) && damage _spike == 1'];
action57 = _role addAction ["Pickup Camera","noscript.sqf",'deletevehicle (nearestobjects [getpos player, ["Misc_Videoprojektor"],  5] select 0);["seccam", 1] call INV_AddInventoryItem;',1,true,true,"",'player distance (nearestobjects [getpos player, ["Misc_Videoprojektor"],  5] select 0) < 5 && (isun || iscop)'];
//================================== ELECTION SYSTEM ===============================================
action102 = _role addaction ["Change the Law","maindialogs.sqf",["gesetz"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
action103 = _role addaction ["Change taxes","maindialogs.sqf",["steuern"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
//======================================= CRIMELOG ====================================================
action111 = _role addaction ["Crime Log","maindialogs.sqf",["coplog"],1,false,true,"","player distance rathaus <= 3"];
//======================================== SLAVES =====================================================
action112 = _role addaction [format ["<t color='#FF0000'>Buy Slave ($%1)</t>", slave_cost],"slaves.sqf", ["slave"],1,false,true,"","player distance slaveflag <= 5 and isciv"];
//==================================== PRIVATE STORAGE ================================================
action113 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance atm1 < 7"];
action114 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance copbank < 7"];
action115 = _role addaction ["Private storage","storage.sqf",["private_storage", "save"],1,false,true,"","player distance uncar < 7"];
//========================================= BAIL ======================================================
action116 = _role addaction [format ["Pay Bail", slave_cost],"maindialogs.sqf", ["bail"],1,false,true,"","player distance bailflag <= 5"];
//===================================== ITEM PROCESS ==================================================
action117 = _role addaction ["Process Diamond rock","itemprocess.sqf",["Diamond rock", "Diamondring", 10, "diamond"],1,false,true,"","player distance Diamond_1 <= 5 and isciv"];
action118 = _role addaction ["Process Oil","itemprocess.sqf",["Oil", "OilBarrel", 10, "oil"],1,false,true,"","player distance Oil_1 <= 5 and isciv"];
action119 = _role addaction ["Make Glass","itemprocess.sqf",["Sand", "Glass", 2, "glassblowing"],1,false,true,"","player distance Glassblower <= 5 and isciv"];

action120 = _role addaction ["<t color='#FF0000'>Process LSD</t>","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga1"],1,false,true,"","isciv && (player distance gangarea1) <= 5"];
action121 = _role addaction ["<t color='#FF0000'>Process Cocaine</t>","itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5, "cocaine ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5"];
action122 = _role addaction ["<t color='#FF0000'>Process LSD</t>","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga2"],1,false,true,"","isciv && (player distance gangarea2) <= 5"];
action123 = _role addaction ["<t color='#FF0000'>Process Heroin</t>","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5"];
action124 = _role addaction ["<t color='#FF0000'>Process Heroin</t>","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5"];
action125 = _role addaction ["<t color='#FF0000'>Process Cannabis</t>","itemprocess.sqf",["Unprocessed_Cannabis", "Cannabis", 5, "Cannabis ga3"],1,false,true,"","isciv && (player distance gangarea3) <= 5"];
//======================================= WORKPLACE ====================================================
action126 = _role addaction ["Get courier job","delivery.sqf", ["getajob_delivery"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv"];
action127 = _role addaction ["Cancel delivery mission","delivery.sqf", ["cancel"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv and alreadygotaworkplacejob == 1"];
//====================================== VEHICLE ACTIONS ================================================
action130 = _role addAction [localize "STRS_addaction_trunk_see","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0);_str = format["%1_storage", _vcl];[_str] execVM "vehiclecheck.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0);player distance _vcl < 10 and !(_vcl in INV_VehicleArray) and !(isciv)'];
action131 = _role addAction ["Search Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0);_str = format["%1_storage", _vcl];if([_vcl,_str] call INV_RemoveIllegalStorage)then{call compile format["publicvariable ""%1"";", _str]};',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0);player distance _vcl < 10 and !(_vcl in INV_VehicleArray) and !(isciv)'];
action132 = _role addAction ["<t color='#00FFFF'>Impound vehicle</t>","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["LandVehicle"], 9] select 0);[_vcl, "impound"] execVM "impound.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["LandVehicle"],9] select 0); player distance _vcl < 10 and (iscop || ismedic || isun)'];
action134 = _role addAction ["Pull out","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0) execVM "pullout.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0);player distance _vcl < 10 and count (crew _vcl) > 0 and (call INV_isArmed)'];
action135 = _role addAction ["<t color='#00FFFF'>Vehicle Information</t>","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0) execVM "vehinfo.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"],9] select 0);player distance _vcl < 10'];
//======================================== GANG FLAGS ===================================================
action136 = _role addaction ["Capture Gang Area","gangflags.sqf",[gangarea1, "capture"],1,false,true,"",'_control = gangarea1 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea1 <= 8 and gangmember'];
action137 = _role addaction ["Capture Gang Area","gangflags.sqf",[gangarea2, "capture"],1,false,true,"",'_control = gangarea2 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea2 <= 8 and gangmember'];
action138 = _role addaction ["Capture Gang Area","gangflags.sqf",[gangarea3, "capture"],1,false,true,"",'_control = gangarea3 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea3 <= 8 and gangmember'];
//======================================== SHOP EXPORT ==================================================
_num1  = (shop1 call INV_getshopnum);
_num2  = (shop2 call INV_getshopnum);
action139 = _role addaction ["Shop 1 export","shopdialogs.sqf",[_num1],1,false,true,"","player distance shop1export <= 3"];
action140 = _role addaction ["Shop 2 export","shopdialogs.sqf",[_num2],1,false,true,"","player distance shop2export <= 3"];
//======================================= GANG GUNSHOPS ==================================================
_num1  = (gangarea1 call INV_getshopnum);
_num2  = (gangarea2 call INV_getshopnum);
_num3  = (gangarea3 call INV_getshopnum);
action141 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num1],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 && (gangsarray select _control) select 1 == group player"];
action142 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num2],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 && (gangsarray select _control) select 1 == group player"];
action143 = _role addaction ["Gang Shop","shopdialogs.sqf",[_num3],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 && (gangsarray select _control) select 1 == group player"];
//========================   unflip vehicle     ================================
action144 = _role addaction ["Unflip vehicle","armitxes\vehtools.sqf",["carjack"],1,false,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and _vcl in INV_VehicleArray'];
//=========================    Cop Patrol actions   ==============================
action145 = _role addaction["<t color='#00FFFF'>Get patrol mission</t>","coppatrol.sqf",["start"],1,false,true,"","iscop and player distance copbank <= 4 and !pmissionactive and !patrolwaittime"];
action146 = _role addaction["<t color='#00FFFF'>Cancel patrol mission</t>","coppatrol.sqf",["end"],1,false,true,"","iscop and pmissionactive and player distance copbank <= 4"];
//========================   HOSTAGE  ================================================
action147 = _role addaction ["<t color='#FF0000'>Take Hostage Mission</t>","hostage.sqf",["getajob_hostage"],1,false,true,"","player distance hostage <= 3 and isciv"];
action148 = _role addaction ["<t color='#FF0000'>Take Hostage</t>", "noscript.sqf", "[hostage1] join (group player); hintSilent ""Keep the hostage close or you will fail!"";",1,false,true,"","player distance hostage1 < 5 and isciv"];
//=======================   STAFF STUFF ==============================================
action149 = _role addAction ["<t color='#FF69B4'>Devtool</t>","noscript.sqf","createDialog ""dev_menu"";",1,true,true,"","(PLAYERDATA select 2) > 229"];
action150 = _role addAction ["<t color='#FF69B4'>Moderator Menu</t>","AdminMenu.sqf",[],1,false,true,"","(PLAYERDATA select 2) > 217"];
action151 = _role addAction ["<t color='#FF69B4'>AdminCam</t>","gcam.sqf",[],1,false,true,"","(PLAYERDATA select 2) > 218"];
//======================= CLOTHING SHOP ===============================================
action152 = _role addAction ["<t color='#FFFF00'>Access Clothing Shop</t>","shopdialogs.sqf",[(clothciv call INV_getshopnum)],1,false,true,"","(player distance clothshop) <= 3 && isciv"];
action153 = _role addAction ["<t color='#FFFF00'>Access Hospital Shop</t>","shopdialogs.sqf",[(clothciv call INV_getshopnum)+1],1,false,true,"","(player distance doc1 < 4) && ismedic"];
action154 = _role addAction ["<t color='#FFFF00'>Access Hospital Air Shop</t>","shopdialogs.sqf",[(clothciv call INV_getshopnum)+2],1,false,true,"","(player distance doc1 < 4) && ismedic"];
action155 = _role addAction ["<t color='#FFFF00'>Access Clothing Shop</t>","shopdialogs.sqf",[(clothcivbase call INV_getshopnum)],1,false,true,"","(player distance clothshop2) <= 3 && isciv"];
action156 = _role addAction ["<t color='#FFFF00'>Access Clothing Shop</t>","shopdialogs.sqf",[(clothcivbase call INV_getshopnum)+1],1,false,true,"","(player distance clothshop3) <= 3 && isciv"];
profAction = _role addAction ["<t color='#FFFF00'>Profession</t>","armitxes\dialogs\controller.sqf","profession",1,false,true,"","(player distance doc1) < 4 || (player distance clothshop2) <= 3 || (player distance Jshop) < 4"];


action157 = _role addAction ["<t color='#FF0000'>Declare Terrorism</t>","terror.sqf",[],1,false,true,"","isciv and isterror"];
action158 = _role addAction ["<t color='#00FFFF'>Release</t>","drag.sqf",[],1,false,true,"","dragging"];
action159 = _role addAction ["<t color='#00FFFF'>Pull and Drag</t>","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0) execVM "pulldrag.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0);player distance _vcl < 10 and count (crew _vcl) > 0 and (call INV_isArmed)'];
action160 = _role addAction ["<t color='#00FFFF'>Put in Vehicle</t>","putinvehicle.sqf",[],1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 9] select 0); player distance _vcl < 10 and dragging'];

memkey = _role addaction ["Member Keypad","CodePad.sqf",[[2,4,8,5,2], {["door",hgate] execVM "armitxes\remote.sqf"}, {ctrlSetText [999,"Wrong code!"]; sleep 1; ctrlSetText [999, ""];}],1,false,true,"","player distance memcont <= 5"];
//==========  CASINO ======================
action161 =_role addAction ["<t color='#FFD700'>Low Slotmachine ($100)</t>","casino.sqf",["slotmachineB"],1,false,true,"","player distance gamble1 < 4 && isciv && !isbet && !nobet"];
action162 =_role addAction ["<t color='#FFD700'>Low Slotmachine ($100)</t>","casino.sqf",["slotmachineB"],1,false,true,"","player distance gamble2 < 4 && isciv && !isbet && !nobet"];
action163 =_role addAction ["<t color='#FFD700'>High Slotmachine ($2000)</t>","casino.sqf",["slotmachine"],1,false,true,"","player distance gamble3 < 4 && isciv && !isbet && !nobet"];
action164 =_role addAction ["<t color='#FFD700'>High Slotmachine ($2000)</t>","casino.sqf",["slotmachine"],1,false,true,"","player distance gamble4 < 4 && isciv && !isbet && !nobet"];
action165 =_role addAction ["<t color='#FF0000'>Rob Casino</t>","casrob.sqf", ["robcas", csafe],1,false,true,"","player distance csafe <= 3 and isciv"];
// ====== Armis Medic ======  
medAct = _role addAction ["Remove Body","noscript.sqf",'deleteVehicle cursorTarget; ["dollarz",1500] call INV_AddInventoryItem;',1,false,true,"",'ismedic && !(alive cursorTarget) && cursorTarget isKindOf "Man"'];                                                                                                                       
medAct2 = _role addAction ["Revive","noscript.sqf",'_tar = cursorTarget; [_tar] spawn plr_heal; format [''%1 switchMove "AmovPsitMstpSlowWrflDnon_ground";'',_tar] call toClients; if !(isheal) then {["dollarz",2000] call INV_AddInventoryItem;};',1,false,true,"",'ismedic && ([cursorTarget] call plr_isUnConscious)'];
medAct3 = _role addAction ["Heal","noscript.sqf",'[cursorTarget] spawn plr_heal; if !(isheal) then {["dollarz",2000] call INV_AddInventoryItem;};',1,false,true,"",'ismedic && alive cursorTarget && [cursorTarget] call plr_isWounded && cursorTarget isKindOf "Man"'];
medAct4 = _role addAction ["Repair vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["LandVehicle"], 3] select 0); ["repair"] execVM "armitxes\vehtools.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["LandVehicle"], 3] select 0); player distance _vcl < 10 and ismedic'];
medAct5 = _role addAction ["Scrap vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air","Ship","LandVehicle"], 3] select 0); deleteVehicle _vcl; ["dollarz",2000] call INV_AddInventoryItem;',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air","Ship","LandVehicle"], 3] select 0); player distance _vcl < 10 and (damage _vcl > 0.9) and ismedic'];
// ====== Armis C4 ======
c4Act1 = _role addAction ["Defuse Bomb","armitxes\explosive.sqf","defuse",1,false,true,"",'(count (nearestObjects [player, ["Explosive"], 5])) > 0 && (iscop || isun)'];
c4ActBoom = _role addAction ["Detonate Bomb","armitxes\explosive.sqf","explode",1,false,true,"",'!isNil "bombAttachment"'];
armiPhone = _role addAction ["<t color='#FFA500'>ArmiPhone</t>","noscript.sqf",'createDialog "ArmiPhone"',20,false,true,"","('handy' call INV_GetItemAmount) > 0"];
//======= PM/CC Resign============
CCAct = _role addAction ["<t color ='#58ACFA'>Resign from office </t>","resign.sqf",["CCresign"],0,false,true,"","player distance rathaus < 3 && isChief"]; 
MayAct =  _role addAction ["<t color ='#FFD700'>Resign from office </t>","resign.sqf",["PMresign"],0,false,true,"","player distance rathaus < 3 && isMayor"]; 
protest = _role addAction ["<t color ='#FFD700'>Protest</t>","noscript.sqf",'protesters = protesters + [player];',0,false,true,"","player distance rathaus < 20 && !(player in protesters) && isciv"];

holsterPrim = _role addAction ["Holster Primary","armitxes\holster.sqf",0,1,false,true,"","((primaryWeapon player) call INV_GetWeaponTyp) == 2"];
unholsterPrim = _role addAction ["Unholster Primary","armitxes\holster.sqf",0,1,false,true,"","primHolster != ''"];
holsterPist = _role addAction ["Holster Pistol","armitxes\holster.sqf",1,1,false,true,"","player call INV_getPistol != ''"];
unholsterPist = _role addAction ["Unholster Pistol","armitxes\holster.sqf",1,1,false,true,"","pistolHolster != ''"];

actPGarage = _role addAction ["Put in Garage","armitxes\remote.sqf","pGarage",1,false,true,"",'_vcl = (nearestobjects [getpos player, ["LandVehicle"], 3] select 0);player distance _vcl < 5 and _vcl in INV_VehicleArray'];
actSGarage = _role addAction ["Garage","armitxes\remote.sqf","gGarage",1,false,true,"",'(player distance impoundbuy <= 5) || (player distance copcar <= 5) || (player distance unair <= 5) || (player distance carshop3 <= 5) || (player distance carshop1 <= 5)'];
actSergeant = _role addAction ["Sergeant Menu","armitxes\dialogs\controller.sqf","sergeant",1,false,true,"",'iscop && (((PLAYERDATA select 4 == 1) && (PLAYERDATA select 5 > 6) && (PLAYERDATA select 5 < 51)) || PLAYERDATA select 2 > 237)'];
actOffDuty = _role addAction ["On/Off Duty","armitxes\districts.sqf","offduty",1,false,true,"",'iscop'];
actClearance = _role addAction ["Give Flight Permission","noscript.sqf",'_vcl = nearestObject [player,"Air"]; _vcl setVariable ["airWarnings",[0,time],true];',1,false,true,"",'_vcl = nearestObject [player,"Air"]; isun && player distance _vcl < 6'];