package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState {
    var btnStart: FlxButton;
    
    override public function create(): Void {
        btnStart = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Start Game", btnStart_Onclick);
        add(btnStart);
        super.create();
    }

    override public function destroy(): Void {
		super.destroy();
	}

    public function btnStart_Onclick(): Void {
        FlxG.switchState(new states.PlayState());
    }
}