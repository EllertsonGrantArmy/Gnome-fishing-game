package states
{
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	
	public class Calibrate extends Sprite implements IState
	{
		private var game:Game;
		
		public function Calibrate(game:Game)
		{
			this.game = game;
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}