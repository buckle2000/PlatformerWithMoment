package;
import nape.callbacks.CbType;
import nape.phys.Material;

/**
 * ...
 * @author buckle2000
 */

@:final
class Constants
{
	public static inline var TILESIZE = 16;
	public static var oneWayType:CbType;
	public static var platformMaterial:Material = new Material(0.2, 0.8, 0.4, 1);
	public static var playerMaterial:Material = new Material(0.5, 0.001, 0.005, 1);
}