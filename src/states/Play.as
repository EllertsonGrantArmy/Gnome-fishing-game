package states
{
	import core.Game;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import interfaces.IState;
	
	import managers.BaitManager;
	import managers.FishManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Play extends Sprite implements IState
	{
		private var game:Game;
		private var castState:Boolean = false;
		private var ns:Stage;
		private var fishManager:FishManager;
		private var baitManager:BaitManager;
		
		public function Play(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{      
			ns = Starling.current.nativeStage;
			ns.addEventListener(MouseEvent.MOUSE_DOWN, cast);
      
			fishManager = new FishManager(this, 1);
			
			baitManager = new BaitManager(this);
		}
		
		private function cast(event:MouseEvent):void
		{
      trace("casting");
			baitManager.castBait(20,-8);
		}
		
		public function update():void
		{
			fishManager.update();
			baitManager.update();
		}
		
		public function destroy():void
		{
		}
	}
}