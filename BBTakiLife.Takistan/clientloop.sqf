_art = _this select 0;
if (_art == "clientloop") then {
  while {true} do {
    _vcl = vehicle player; 
    _nextspike = getPos player nearestObject "Fort_RazorWire";
    if((_vcl distance _nextspike) < 5 && _vcl != player) then { [_vcl] call veh_desWheels; };

	  {if ((player distance (_x select 0)) < (_x select 1)) then {timeinworkplace = timeinworkplace + 1;};} forEach workplacearray;

  	_dollarz = 'dollarz' call INV_GetItemAmount;
  	if (_dollarz < 0) then {['dollarz', 0] call INV_SetItemAmount; _dollarz = 0;};
    
    _dblimit = 15000000;
    if ((PLAYERDATA select 1) > _dblimit) then { PLAYERDATA set [1,_dblimit]; hint format["You are not allowed to have more than $%1! Money has been removed",_dblimit]; };
	  sleep 0.5;
	};
};