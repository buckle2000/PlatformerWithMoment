package logic;

import flixel.math.FlxMath;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.dynamics.Arbiter;
import nape.dynamics.ArbiterType;


@:final
class PhyUtil {
	public static function contacts(b1:Body,b2:Body):Bool {
		for (i in b1.arbiters) {
			if ((i.body1 == b2 || i.body2 == b2) && i.type == ArbiterType.COLLISION)
			return true;
		}
		return false;
	}
	
	public static function getcolarbiter(b1:Body,b2:Body):Arbiter {
		for (i in b1.arbiters) {
			if ((i.body1 == b2 || i.body2 == b2) && i.type == ArbiterType.COLLISION)
			return i;
		}
		return null;
	}
	
	public static function on(thing: Body, surface:Body):Bool {
		var contact = getcolarbiter(thing, surface);
		if (contact == null) return false;
		var normal:Float = contact.collisionArbiter.normal.angle;		
		if (contact.body1 == thing) normal += Math.PI;
		return Math.abs(normal+Math.PI/2)<0.35;
	}
	
}