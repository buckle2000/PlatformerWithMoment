package states;

import flixel.FlxState;

class OpeningState extends FlxState
{

	public function new() 
	{
		
	}
	
	override public function create(): Void {
		
		
	}
	
	override public function destroy(): Void {
        FlxG.stage.removeChild(_sprite);
		super.destroy();
	}
	
	}
	
    override public function update(dt: Float): Void {
        super.update(dt);
    }

}