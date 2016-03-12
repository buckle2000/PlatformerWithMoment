package states;

import motion.Actuate;
import flash.display.Graphics;
import flash.display.Sprite;
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
	var _sprite: Sprite;
	var _gfx: Graphics;
    /**
     * Function that is called up when to state is created to set it up.
     */
    override public function create(): Void {
        btnStart = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Start Game", btnStart_Onclick);
        add(btnStart);
		/*
		_sprite = new Sprite();
		_gfx = _sprite.graphics;
		_gfx.beginFill(0xFF0000FF);
		_gfx.moveTo(0, 0);
		_gfx.lineTo(0, 100);
		_gfx.lineTo(100, 100);
		_gfx.lineTo(100, 0);
		_gfx.lineTo(0, 0);		
		_gfx.endFill();
		FlxG.stage.addChild(_sprite);
		Actuate.timer(1).onComplete(btnStart_Onclick);
		*/
        super.create();
    }

    override public function destroy(): Void {
        //FlxG.stage.removeChild(_sprite);
		super.destroy();
	}
	
    override public function update(dt: Float): Void {
        super.update(dt);
    }

    public function btnStart_Onclick(): Void {
        FlxG.switchState(new states.PlayState());
    }
}