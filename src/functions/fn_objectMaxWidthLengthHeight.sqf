/*
	Author: Smoke

	Description:
	Returns the maximum width, length and height of an object via
  boundingBoxReal

	Parameter(s):
	0: An object

	Returns:
	An array: [_maxWidth, _maxLength, _maxHeight]

  Example:
  _maxs = [player] call MC_fnc_objectMaxWidthLengthHeight;

  _maxWidth = (_maxs select 0);
  _maxLength = (_maxs select 1);
  _maxHeight = (_maxs select 2);
*/

params ["_object"];
private ["_bbr", "_p1", "_p2", "_maxWidth", "_maxLength", "_maxHeight"];

_bbr = boundingBoxReal _object;

_p1 = _bbr select 0;
_p2 = _bbr select 1;

_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

[_maxWidth, _maxLength, _maxHeight];
