package;

import flixel.addons.nape.*;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import gameobj.Player;
import logic.PlayerController;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
    var you: Player;
    var allPlayers: FlxGroup = new FlxGroup();
    var level: FlxNapeTilemap;
    var player: FlxNapeSprite;
	var _temp:Bool;
	var playerctrl:PlayerController;
	
    override public function create(): Void {
        Cache.init();
        FlxNapeSpace.init();
        FlxNapeSpace.space.gravity.setxy(0, 2000);
        FlxG.camera.bgColor = FlxColor.WHITE;
        level = Cache.loadLevel("default", "assets/data/map.csv");
		player = new Player(100, 100, FlxColor.BLUE);
		playerctrl = new PlayerController(player.body, level.body);

        add(level);
        add(player);
		add(playerctrl);
    }

    override public function update(dt: Float) {
        super.update(dt);
    }

    override public function destroy(): Void {
        super.destroy();
    }
}