/*
	Author: Smoke

	Description:
	Spawns and attachs an object of class _className to _object in front of _object

	Parameter(s):
	0: The class name of the newly spawned object
  1: An object in which to attach the newly spawned object to
  2: The object in which the attached object will be placed in front of

	Returns:
	The newly spawned attached object

  Example:
  _finalBridgeSegment = [
        "Land_Pier_F",
        _nearestBridgeSegment,
        player
    ] call MC_fnc_spawnAndAttachObject;
*/

params ["_className", "_object", "_inFrontOf"];
private ["_newObject", "_objPos", "_objDir", "_objectZ", "_maxs", "_maxWidth"];

_newObject = [
  _inFrontOf,
  _className
] call MC_fnc_spawnObjectInFront;

_maxs = [_newObject] call MC_fnc_objectMaxWidthLengthHeight;
_maxWidth = (_maxs select 0);

_newObject attachTo [_object, [-_maxWidth + 1, 0, 0]];

_objPos = getPos _newObject;
_objDir = getDir _newObject;

detach _newObject;
_newObject setDir _objDir;

_objectZ = ((getPos _object) select 2);
_newObject setPos [(_objPos select 0), (_objPos select 1), _objectZ];

_newObject
