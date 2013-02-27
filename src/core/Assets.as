package core
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source="assets/water.png")]
		private static var water:Class;
		public static var tw:Texture;
		
		[Embed(source="assets/atlas.png")]
		private static var atlas:Class;
		public static var ta:TextureAtlas;
		
		[Embed(source="assets/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;
		
		public static function init():void {
			tw = Texture.fromBitmap(new water());
			ta = new TextureAtlas(Texture.fromBitmap(new atlas()), XML(new atlasXML()));
		}
	}
}