package gameobj;

import flixel.graphics.FlxGraphic;
import nape.phys.Material;
import nape.geom.Vec2;
using logic.PhyUtil;
import flixel.addons.nape.FlxNapeTilemap;

class CustomNapeTilemap extends FlxNapeTilemap {
	public function new(tiles: String, graphics: FlxGraphic, tilesize: Int) { super();
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
		vertices[0] = Vec2.get(0, 0.5);
		vertices[1] = Vec2.get(8, 0);
		vertices[2] = Vec2.get(16, 0.5);
		vertices.push(Vec2.get(16, 4));
		vertices.push(Vec2.get(0, 4));
		setOneWay(6, vertices);
	}
	
}