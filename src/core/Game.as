package core
{
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import states.Menu;
	import states.Calibrate;
	import states.Map;
	import states.Play;
	import states.GameOver;
	
	public class Game extends Sprite
	{
		public static const MENU_STATE:int = 0;
		public static const CALIBRATE_STATE:int = 1;
		public static const MAP_STATE:int = 2;
		public static const PLAY_STATE:int = 3;
		public static const GAME_OVER_STATE:int = 4;
		
		private var current_state:IState;
		
		public function Game()
		{
			Assets.init();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			changeState(MENU_STATE);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update():void
		{
			current_state.update();			
		}
		
		public function changeState(state:int):void
		{
			if(current_state != null)
			{
				current_state.destroy();
				current_state = null;
			}
			
			switch(state)
			{
				case MENU_STATE:
					current_state = new Menu(this);
					break;
				case CALIBRATE_STATE:
					current_state = new Calibrate(this);
					break;
				case MAP_STATE:
					current_state = new Map(this);
					break;
				case PLAY_STATE:
					current_state = new Play(this);
					break;
				case GAME_OVER_STATE:
					current_state = new GameOver(this);
					break;
			}
			addChild(Sprite(current_state));
		}
	}
}