package states
{
	import core.Game;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import interfaces.IState;
	
	import managers.BaitManager;
	import managers.CollisionManager;
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
		public var fishManager:FishManager;
		public var baitManager:BaitManager;
		private var collisionManager:CollisionManager;
		private var pause:Boolean;
		
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
      collisionManager = new CollisionManager(this);
      
		}
		
		private function cast(event:MouseEvent):void
		{
      trace("casting");
			baitManager.castBait(20,-8);
      ns.removeEventListener(MouseEvent.MOUSE_DOWN, cast);
      ns.addEventListener(MouseEvent.MOUSE_DOWN, reel);
		}
    
    private function reel(event:MouseEvent):void
    {
      baitManager.reelBait();
    }
		
		public function update():void
		{
      if(pause != true) {
  			fishManager.update();
  			baitManager.update();
        collisionManager.update();
      }
		}
    
    public function pauseGame():void {
      pause = true;
    }
		
    public function resumeGame():void {
      pause = false;
    }
		public function destroy():void
		{
		}
	}
}