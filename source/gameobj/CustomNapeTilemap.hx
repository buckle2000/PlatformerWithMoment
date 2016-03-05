package gameobj;

import flixel.graphics.FlxGraphic;
import flixel.input.FlxPointer;
import flixel.math.FlxPoint;
import nape.phys.Material;
import nape.geom.Vec2;
using logic.PhyUtil;
import flixel.addons.nape.FlxNapeTilemap;

class CustomNapeTilemap extends FlxNapeTilemap {
    public function new(tiles: String, graphics: FlxGraphic, tilesize: Int) {
        super();
        loadMapFromCSV(tiles, graphics, tilesize, tilesize);
        setupTileIndices([1, 8]);

        var vertices = new Array<Vec2>();
        vertices.push(Vec2.get(16, 0));
        vertices.push(Vec2.get(16, 16));
        vertices.push(Vec2.get(0, 16));
        placeCustomPolygon([2], vertices);
        vertices[0] = Vec2.get(0, 0);
        placeCustomPolygon([3], vertices);
        vertices[1] = Vec2.get(16, 0);
        placeCustomPolygon([4], vertices);
        vertices[2] = Vec2.get(16, 16);
        placeCustomPolygon([5], vertices);
        /*
        vertices[0] = Vec2.get(0, 0.5);
        vertices[1] = Vec2.get(8, 0);
        vertices[2] = Vec2.get(16, 0.5);
        vertices.push(Vec2.get(16, 4));
        vertices.push(Vec2.get(0, 4));
        setOneWay(6, vertices);
        */
        var prevOneWay = false;
        var length : Int = 0;
        var startx: Int = 0;
        var starty: Int = 0;

        for (ty in 0...heightInTiles) {
            for (tx in 0...widthInTiles) {
                if (isTileOneWay(getTileByIndex(ty * widthInTiles + tx))) {
                    if (!prevOneWay) {
                        prevOneWay = true;
                        length = 0;
                        startx = tx;
                        starty = ty;
                    }
                    ++length;
                } else {
                    if (prevOneWay) {
                        prevOneWay = false;
                        PhyUtil.setOneWayLong(this, getTileCoordsByIndex(starty * widthInTiles + startx,
                                              false), length);
                    }
                }
            }
            if (prevOneWay) {
                prevOneWay = false;
                PhyUtil.setOneWayLong(this, getTileCoordsByIndex(starty * widthInTiles + startx,
                                      false), length);
            }
        }
    }

    public static function isTileOneWay(type: Int): Bool {
        return type == 6;
    }
}