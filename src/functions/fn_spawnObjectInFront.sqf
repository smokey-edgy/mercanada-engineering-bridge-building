/*
	Author: Smoke

	Description:
	Spawns in object of class _className in front of _object

	Parameter(s):
	0: An object that will have a newly spawned object placed in front of it
  1: The class name to spawn
  2: Newly spawned object should be rotated 90 degrees, true or false
  3: Distance ahead relative to object to be placed in front of
  4: Elevation offset to place newly spawned object

	Returns:
	The newly spawned object

  Example:
  _bridgeSegment = [
    player,
    "Land_Pier_F",
    true,
    10,
    -1.2
  ] call MC_fnc_spawnObjectInFront;
*/

params ["_object", "_className", "_rotate90Degrees", "_distanceAhead", "_elevation"];
private ["_spawnedObject", "_maxs", "_maxWidth", "_maxLength", "_center", "_degreesToRotate", "_pos"];

if(isNil "_rotate90Degrees") then {
  _rotate90Degrees = false;
  _degreesToRotate = 0;
};

if(isNil "_distanceAhead") then {
  _distanceAhead = 0;
};

if(isNil "_elevation") then {
  _elevation = 0;
};

_spawnedObject = createVehicle [
    _className,
    (getPos _object),
    [],
    0,
    "CAN_COLLIDE"
];

_maxs = [_spawnedObject] call MC_fnc_objectMaxWidthLengthHeight;

if(_rotate90Degrees) then {
  _center = (_maxs select 0) / 2;
  _degreesToRotate = 90;
} else {
  _center = (_maxs select 0) / 1;
};

_spawnedObject setVectorUp [0,0,1];
_spawnedObject setDir ((direction _object) + _degreesToRotate);

_pos = _object modelToWorld [0, _center + _distanceAhead, 0];

_spawnedObject setPos ([(_pos select 0), (_pos select 1), (_pos select 2) + _elevation]);

_spawnedObject
