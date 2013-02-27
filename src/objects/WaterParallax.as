package objects
{
	import core.Assets;
	
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class WaterParallax extends Sprite
	{
		public static var _vx:int = 1;
		private var water1:Image;
		private var water2:Image;
		
		public function WaterParallax()
		{
			water1 = new Image(Assets.tw);
			water1.pivotY = water1.height;
			water1.y = 700;
			addChild(water1);
			
			water2 = new Image(Assets.tw);
			water2.x = water1.width -2;
			water2.pivotY = water2.height;
			water2.y = 700;
			addChild(water2);
		}
		
		public function update():void
		{
			water1.x -= _vx;
			if(water1.x == -water1.width)
			{
				water1.x = water1.width-2;
			}
			water2.x -= _vx;
			if(water2.x == -water1.width)
			{
				water2.x = water1.width-2;
			}
		}
	}
}