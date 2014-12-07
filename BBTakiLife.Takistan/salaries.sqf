while {iscop} do
{
  sleep 170;
  player groupChat format[localize "STRS_dollarz_countdown", "2"];
  sleep 60;
  player groupChat format[localize "STRS_dollarz_countdown", "1"];
  sleep 60;
  
  _income = 200 + extrapay;
  
  if ("patrol_training" call INV_HasLicense) then { _income = _income + (25); };
  if ("response_training" call INV_HasLicense) then { _income = _income + (50); };
  if ("sobr_training" call INV_HasLicense) then { _income = _income + (75); };
  if ("copAir" call INV_HasLicense) then { _income = _income + (50); };
  
  if (!(convoywinner == "Cops and UN") && !(convoywinner == "Neither")) then  
  {
  	 player groupChat format["No paychecks have been delivered by the last convoy, you'll receive less payment!"];
  	 _income = _income - 150;
  };
  
  if (ischief) then {	_income = _income + chiefExtraPay; };
  
  _coptax = round(INV_SteuernGezahlt * 0.05);
  [(round _income) + _coptax] call setMoney;
  INV_SteuernGezahlt = 0;
  
  player groupchat format["You received $%1. as payment including taxes.", ((round _income) call ISSE_str_IntToStr)];
  
  sleep 1;
  if(ischief)then{player groupchat format["As the Chief Constable you get an extra paycheck of $%1.", (chiefExtraPay call ISSE_str_IntToStr)]};
  ["save"] execVM "armitxes\_db.sqf"; 
};

while {isun} do
{
  sleep 170;
  player groupChat format[localize "STRS_dollarz_countdown", "2"];
  sleep 60;
  player groupChat format[localize "STRS_dollarz_countdown", "1"];
  sleep 60;
  
  _untax = round(INV_SteuernGezahlt * 0.025);
  INV_SteuernGezahlt = 0;  
  
  _incomeun = 100 + extrapay;
	_incomeun = _incomeun + 400 + _untax;
	
	if (!(convoywinner == "Cops and UN") && !(convoywinner == "Neither")) then  
  {
		player groupChat format["No paychecks have been delivered by the last convoy, you'll receive less payment!"];
	  _incomeun = _incomeun - 150;
  };
  player groupChat format["The United Nations gave you a paycheck of $%1 and an extra of $%2 as bonus.",_incomeun,paybonus];
  [(_incomeun + paybonus)] call setMoney;
  paybonus = 0;
  ["save"] execVM "armitxes\_db.sqf";
};

while {isciv} do
{
  sleep 170;
  player groupChat format[localize "STRS_dollarz_countdown", "2"];
  sleep 60;
  player groupChat format[localize "STRS_dollarz_countdown", "1"];
  sleep 60;
  
  if ((alive player) and (deadcam == 0)) then

	{

	_workplacepaycheck = 0;
	_uniPaycheck       = 0;
	_unimsg            = "";
	_atworkplacemsg    = localize "STRS_dollarz_nowere";
	_hashideoutmsg     = "";
	
	_income            = 100 + extrapay;
	_mygang		   = "None";
	_activecount	   = 0;

	if (convoywinner == "Civs" && !(convoywinner == "Neither")) then
	{
		player groupChat format["The robbers are sharing the robbed Paychecks! You receive extra money."];
		_income = _income + 100;
	};

	for [{_i=0}, {_i < (count BuildingsOwnerArray)}, {_i=_i+1}] do

		{

		_check = ( round( (random 2)*((BuyAbleBuildingsArray select _i) select 4) ) );
		_income = _income + _check;

		};

	if (timeinworkplace > 0) then

		{

		_workplacepaycheck = (round(add_workplace/180*timeinworkplace));
		_income = _income + _workplacepaycheck;
		_atworkplacemsg     = localize "STRS_dollarz_were";

		};

		for "_c" from 0 to (count gangsarray - 1) do

		{

		_gangarray = gangsarray select _c;
		_gangname  = _gangarray select 0;
		_members   = _gangarray select 1;

		if((name player) in _members)then

			{

			_mygang = _gangname;

			for "_i" from 0 to (count _members - 1) do

				{

				_civ = [(_members select _i), civarray] call INV_findunit;

				if(!isnull _civ)then{_activecount = _activecount + 1};

				};

			};

		};

	if(_mygang != "None") then

		{

		if(gangarea1 getvariable "control" == _mygang)then{_income = _income + (gangincome/_activecount)};
		if(gangarea2 getvariable "control" == _mygang)then{_income = _income + (gangincome/_activecount)};
		if(gangarea3 getvariable "control" == _mygang)then{_income = _income + (gangincome/_activecount)};

		};


	timeinworkplace = 0;
	_income = round _income;
	[_income] call setMoney;
	player groupChat format[localize "STRS_dollarz_civmoneyadd", rolestring, (_income call ISSE_str_IntToStr)];
	
  if (isMayor) then
	{
  	MayorSteuern = MayorSteuern + INV_SteuernGezahlt;
  	MayorSteuern = round((MayorSteuern / 100) * MayorBekommtSteuern);
  	[MayorSteuern + MayorExtraPay] call setMoney;
  	player groupchat format["As a Prime Minister you get an extra paycheck of $%1. You also got $%2 taxes.", (MayorExtraPay call ISSE_str_IntToStr), (MayorSteuern call ISSE_str_IntToStr)];
	}
	else
	{ 
    if (INV_SteuernGezahlt > 0) then { (format["if (isMayor) then {MayorSteuern = MayorSteuern + %1;};", INV_SteuernGezahlt]) call toClients; };
	};

	MayorSteuern   = 0;
	INV_SteuernGezahlt = 0;

	}
	else { player groupChat format[localize "STRS_dollarz_paycheckdead"]; };
  ["save"] execVM "armitxes\_db.sqf";
};