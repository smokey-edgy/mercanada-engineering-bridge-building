class CfgFunctions {
	class MerCanada	{
		tag = "MC";
		class Functions {
		  file = "\mercanada-engineering-bridge-building\functions";
			class objectMaxWidthLengthHeight {};
			class spawnObjectInFront {};
		}
		class Engineering	{
			class BridgeBuilding {
				file = "\mercanada-engineering-bridge-building\init.sqf";
				postInit = 1;
			};
		};
	};
};
