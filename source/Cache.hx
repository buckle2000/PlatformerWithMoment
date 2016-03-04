package;

import flixel.addons.nape.FlxNapeTilemap;
import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import nape.geom.Vec2;
import nape.phys.Material;

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

    public static function loadLevel(name: String, file: String, ?material: Material): FlxNapeTilemap {
        if (levels.exists(name))
            return levels.get(name);
        var tilemap = new FlxNapeTilemap();
		if (material == null) material = new Material(0.2, 0, 0);
		tilemap.body.setShapeMaterials(material);

        tilemap.loadMapFromCSV(file, tilegraphics, TILESIZE, TILESIZE);
        tilemap.setupTileIndices([1, 8]);
		
		var vertices = new Array<Vec2>();
		vertices.push(Vec2.get(16, 0));
		vertices.push(Vec2.get(16, 16));
		vertices.push(Vec2.get(0, 16));
		tilemap.placeCustomPolygon([2], vertices);
		vertices[0] = Vec2.get(0, 0);
		tilemap.placeCustomPolygon([3], vertices);
		vertices[1] = Vec2.get(16, 0);
		tilemap.placeCustomPolygon([4], vertices);
		vertices[2] = Vec2.get(16, 16);
		tilemap.placeCustomPolygon([5], vertices);
		
        levels.set(name, tilemap);
        return tilemap;
    }

    public static var levels = new Map<String, FlxNapeTilemap>();
}