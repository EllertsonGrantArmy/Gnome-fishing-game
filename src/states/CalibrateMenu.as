package states
{
	import core.Game;
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	import interfaces.IState;
	
	import objects.WaterParallax;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class CalibrateMenu extends Sprite implements IState
	{
		private var game:Game;
		private var waterParallax:WaterParallax;
		private var calibrateBtn:Button;
		
		public function CalibrateMenu(game:Game)
		{
			this.game = game;
      addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
    private function init(event:Event):void
    {
      waterParallax = new WaterParallax;
      addChild(waterParallax);
      
      var shape:Shape = new Shape();
      shape.graphics.beginFill(Color.WHITE);
      shape.graphics.drawRect(0,0,150,50);
      shape.graphics.endFill();
      var bmpData:BitmapData = new BitmapData(150,50, true, 0x0);
      bmpData.draw(shape);
      var texture:Texture = Texture.fromBitmapData(bmpData);
      calibrateBtn = new Button(texture, "Calibrate");
      calibrateBtn.addEventListener(Event.TRIGGERED, calibrateStart);
      calibrateBtn.pivotX = calibrateBtn.width/2;
      calibrateBtn.x = 350;
      calibrateBtn.y = 350;
      addChild(calibrateBtn);
    }
    
    private function calibrateStart():void
    {
      
    }
    
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}