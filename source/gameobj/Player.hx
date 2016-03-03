package gameobj;

import logic.PlayerController;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.addons.nape.FlxNapeSprite;

@: final
class Player extends FlxNapeSprite {
    public function new(X: Float, Y: Float, fillcolor:FlxColor) {
        super(X, Y);
        makeGraphic(18, 26, fillcolor);
        createRectangularBody(16, 25);
        body.allowRotation = true;
        setBodyMaterial(0.5, 1);
    }
}
