package managers
{
	import com.leebrimelow.starling.StarlingPool;
	
	import interfaces.IState;
	
	import objects.Fish;
	
	import starling.display.Sprite;
	
	import states.Play;

	public class FishManager implements IState
	{
		private var play:Play;
		public var fish:Array;
		private var pool:StarlingPool;
		private var fishNum:int;
		public function FishManager(play:Play, fishNum:int)
		{
			this.play = play;
			this.fishNum = fishNum;
			fish = new Array();
			pool = new StarlingPool(Fish, 7);
			spawn();
		}
		
		public function update():void
		{
			var len:int = fish.length;
			var f:Fish;
			
			for(var i:int=len-1; i>=0; i--)
			{
				f = fish[i];
				f.x += f.vx;
				if(f.x >= f.rBound){
					f.vx = -f.vx;
          flipFish(f, "RIGHT");
				}	else if(f.x <= f.lBound) 
        {
					f.vx = -f.vx;
          flipFish(f, "LEFT");
				}
			}
		}
    private function flipFish(fishy:Fish, lr:String):void {
      if(lr == "LEFT"){
        fishy.scaleX = -0.25;
        fishy.x += fishy.width/2;
      } else if(lr == "RIGHT") {
        fishy.scaleX = 0.25;
        fishy.x -= fishy.width/2;
      }
    }
		
		public function destroy():void
		{
			
		}
		
		private function spawn():void
		{
			for(var i:int=0; i<fishNum; i++)
			{
				var e:Fish = pool.getSprite() as Fish;
				e.vx = 1;
				e.rBound = 650;
				e.lBound = 200;
				e.height = e.height/4;
				e.width = e.width/4;
				e.y = 400;
				e.x = 400;
				fish.push(e);
				play.addChild(e);
        flipFish(e, "LEFT");
			}
		}
	}
}