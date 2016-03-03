package;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxTileFrames;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.addons.nape.FlxNapeTilemap;
import flixel.math.FlxRect;
import flixel.graphics.frames.FlxFrame;
import AssetPaths;

/**
 * Handy, pre-built Registry class that can be used to store
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Cache {
    /**
     * Generic levels Array that can be used for cross-state stuff.
     * Example usage: Storing the levels of a platformer.
    */
    public static inline var TILESIZE = 16;
    public static var tilegraphics: FlxGraphic;

    public static function init(): Void {
        tilegraphics = FlxG.bitmap.add("assets/images/tiles.png");

    }

    public static function loadLevel(name: String, file: String): FlxNapeTilemap {

        if (levels.exists(name))
            return levels.get(name);
        var tilemap = new FlxNapeTilemap();
        tilemap.loadMapFromCSV(file, tilegraphics, TILESIZE, TILESIZE);
        tilemap.setupTileIndices([1]);
        levels.set(name, tilemap);
        return tilemap;
    }

    public static var levels = new Map<String, FlxNapeTilemap>();
}