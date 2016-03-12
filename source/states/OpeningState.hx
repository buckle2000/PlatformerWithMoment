package states;

import openfl.Assets;
import flixel.FlxState;
import flixel.text.FlxText;

class OpeningState extends FlxState {
    public static inline var FontSize: Int = 20;
    var txt_d: FlxText;
    var txt_s: FlxText;
    var txt_erivatives: FlxText;
    var txt_tudio: FlxText;


    override public function create(): Void {
        Assets.getFont("assets/font/cambria.ttc");
        txt_d = new FlxText(0, 0, null, "d", FontSize);
        txt_s = new FlxText(0, 0, null, "s", FontSize);
        txt_erivatives = new FlxText(0, 0, null, "erivatives", FontSize);
        txt_tudio = new FlxText(0, 0, null, "tudio", FontSize);
    }

    override public function destroy(): Void {
        super.destroy();
    }
}