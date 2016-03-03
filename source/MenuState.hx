package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState {
    var btnStart: FlxButton;
    /**
     * Function that is called up when to state is created to set it up.
     */
    override public function create(): Void {
        btnStart = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Start Game", btnStart_Onclick);
        add(btnStart);
        super.create();
    }

    /**
     * Function that is called when this state is destroyed - you might want to
     * consider setting all objects this state uses to null to help garbage collection.
     */
    override public function destroy(): Void {
        super.destroy();
    }

    /**
     * Function that is called once every frame.
     */
    override public function update(): Void {
        super.update();
    }

    public function btnStart_Onclick(): Void {
        FlxG.switchState(new PlayState());
    }
}