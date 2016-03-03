package logic;

import flixel.FlxG;
import flixel.math.FlxMath;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.dynamics.Arbiter;
import nape.dynamics.ArbiterType;


@: final
class PhyUtil {
    public static function contacts(b1: Body, b2: Body): Bool {
        for (i in b1.arbiters) {
            if ((i.body1 == b2 || i.body2 == b2) && i.type == ArbiterType.COLLISION)
                return true;
        }
        return false;
    }

    public static function onTop(thing: Body, ?surface: Body): Bool {
        for (contact in thing.arbiters) {
            if ((surface == null || contact.body1 == thing || contact.body2 == thing) && contact.type == ArbiterType.COLLISION) {
                var normal: Float = contact.collisionArbiter.normal.angle;
                FlxG.watch.addQuick("c",normal);
                if (contact.body1 == thing) normal = normal - Math.PI;
                if (Math.abs(normal + Math.PI / 2) < 0.35)
                    return true;
            }
        }
        return false;
    }

}