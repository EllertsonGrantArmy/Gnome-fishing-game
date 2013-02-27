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
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class Menu extends Sprite implements IState
	{
		private var game:Game;
		private var waterParallax:WaterParallax;
		private var calibrateText:TextField;
		private var calibrateBtn:Button;
		private var playBtn:Button;
		public function Menu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			waterParallax = new WaterParallax();
			addChild(waterParallax);
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(Color.WHITE);
			shape.graphics.drawRect(0,0,150,50);
			shape.graphics.endFill();
			var bmpData:BitmapData = new BitmapData(150,50, true, 0x0);
			bmpData.draw(shape);
			var texture:Texture = Texture.fromBitmapData(bmpData);
			calibrateBtn = new Button(texture, "Calibrate");
			calibrateBtn.addEventListener(Event.TRIGGERED, onCalibrate);
			calibrateBtn.pivotX = calibrateBtn.width/2;
			calibrateBtn.x = 350;
			calibrateBtn.y = 350;
			addChild(calibrateBtn);
			
			playBtn = new Button(texture, "Play");
			playBtn.addEventListener(Event.TRIGGERED, onPlay);
			playBtn.pivotX = playBtn.width/2;
			playBtn.x = 350;
			playBtn.y = 550;
			addChild(playBtn);
		}
		
		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		private function onCalibrate(event:Event):void
		{
			game.changeState(Game.CALIBRATE_STATE);
			
		}
		
		public function update():void
		{
			waterParallax.update();
		}
		
		public function destroy():void
		{
			removeChild(waterParallax);
			waterParallax = null;
			removeChild(calibrateBtn);
			calibrateBtn = null;
			removeChild(playBtn);
			playBtn = null;
		}
	}
}