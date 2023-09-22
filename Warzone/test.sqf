private _test = createVehicle ["B_supplyCrate_F",player modelToWorld [0,1,0],[],0,"None"];
clearItemCargoGlobal _test;
clearMagazineCargoGlobal _test;
clearWeaponCargoGlobal _test;
clearBackpackCargoGlobal _test;
_test setVariable ["LEG_Timer",diag_tickTime,true];
[_test,true] remoteExec ["lockInventory",[0,-2] select isDedicated];


[_test, ["Unlock Inventory",{
        params ["_target", "_caller", "_actionId", "_arguments"];
        //check did timer pass if not return message wait for timer to end if it did unlockInventory.
        private _timeWhenIsCreated =  _target getVariable "LEG_Timer"; // time when craete is created.
        private _futureTime = _timeWhenIsCreated + 10; //Delay here how many secods it needs to to unlock.
        private _currentTime = diag_tickTime; // currentTime
        if(_currentTime > _futureTime) then {
            //chest is unlocked.
            hintSilent format ["Its unlocked Yay."];
            systemChat format ["Unlocked: CurrentTime: %1 Delay: %2 Time When Created: %3",_currentTime,_futureTime,_timeWhenIsCreated];
            [_target,false] remoteExec ["lockInventory",[0,-2] select isDedicated];
            _target setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"];
            _target removeAction _actionId;
        }else {
            //chest is locked.
            private _unlockIn = _futureTime - _currentTime;
            hintSilent format ["Chest will unlock in: %1 seconds",round _unlockIn];
            systemChat format ["Locked: CurrentTime: %1 Delay: %2 Time When Created: %3",_currentTime,_futureTime,_timeWhenIsCreated];
        };
},




nil,0.2,true,true,"","true",5,false,"",""]] remoteExec ["addAction",[0,-2] select isDedicated];