package states
{
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	
	public class Map extends Sprite implements IState
	{
		private var game:Game;
		public function Map(game:Game)
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