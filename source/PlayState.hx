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
    var allPlayers: FlxGroup = new FlxGroup();
    var level: FlxNapeTilemap;

    override public function create(): Void {
        Cache.init();
        FlxNapeSpace.init();
        FlxNapeSpace.space.gravity.setxy(0, 2000);
        FlxG.camera.bgColor = FlxColor.WHITE;
        level = Cache.loadLevel("default", "assets/data/map.csv");
        add(level);

        var player: FlxNapeSprite;
        var playerctrl: PlayerController;
        player = new Player(100, 100, FlxColor.BLUE);
        playerctrl = new PlayerController(player.body, level.body, new PlayerControl([LEFT], [RIGHT], [UP]));
        add(player);
        add(playerctrl);

        player = new Player(100, 100, FlxColor.RED);
        playerctrl = new PlayerController(player.body, level.body, new PlayerControl([A], [D], [W]));
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