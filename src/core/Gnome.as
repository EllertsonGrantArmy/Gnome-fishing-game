package core
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width=720, height=700, frameRate=60, backgroundColor=0xFFFFFF)]
	public class Gnome extends Sprite
	{
		public function Gnome()
		{
			var star:Starling = new Starling(Game, stage);
      star.showStats = true;
			star.start();
		}
	}
}