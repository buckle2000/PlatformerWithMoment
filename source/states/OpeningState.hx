package states;

import flixel.FlxState;
import flixel.text.FlxText;

class OpeningState extends FlxState {
    var text1: FlxText;
    var text2: FlxText;

    override public function create(): Void {
        var a: Int;
        a = 1 + 2 + (3 + 4);
    }

    override public function destroy(): Void {
        super.destroy();
    }

}