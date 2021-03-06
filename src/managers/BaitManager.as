package managers
{
  import interfaces.IState;
  
  import objects.Bait;
  
  import starling.animation.Transitions;
  import starling.animation.Tween;
  import starling.core.Starling;
  import starling.display.Shape;
  
  import states.Play;
  
  public class BaitManager implements IState
  {
    private var play:Play;
    public var bait:Bait;
    private var vx:int;
    private var vy:int;
    private var gravity:int = 2;
    private var casting:Boolean = false;
    private var updateInterval:int = -1;
    private var line:Shape;
    private var line_color:uint = 0x00000;
    public var isCast:Boolean = false;
    
    public function BaitManager(play:Play)
    {
      this.play = play;
      spawn();
    }
    
    public function update():void
    {
      updateInterval++;
      
      if(bait.x > 400 && bait.x < 600)
      {
        bait.vy -= 1;
      } 
      if(bait.x > 600 || bait.y > 600)
      {
        casting = false;
        isCast = true;
      }
      
      //position line when casting
      if(casting == true && updateInterval == 0)
      {
        bait.x += bait.vx;
        bait.vy += gravity;
        bait.y += bait.vy;
        
        
      } else if(updateInterval == 1) {updateInterval = -1;}
				
			drawLine();
    }
		
		private function drawLine():void
    {
			line.graphics.clear();
			line.graphics.beginFill(line_color);
			line.graphics.lineStyle(2, line_color);
			line.graphics.moveTo(110, 0);
			line.graphics.lineTo(bait.x, bait.y);
			line.graphics.endFill();
		}
		
    public function destroy():void
    {
      
    }
    
    public function castBait(vx:int, vy:int):void
    {
      bait.vx = vx;
      bait.vy = vy;
      casting = true;
    }
    
    public function reelBait():void
    {
      var slope:Number = (bait.y - 0)/(bait.x-0);
      trace("Slope: " + slope);
      var tween:Tween = new Tween(bait,.5, Transitions.EASE_OUT);
      tween.animate("x", bait.x - 25);
      tween.animate("y", bait.y - 25);
      Starling.juggler.add(tween);
    }
    
    private function spawn():void
    {
      bait = new Bait;
      bait.x = 25;
      bait.y = 25;
      play.addChild(bait);
			
			line = new Shape();
			play.addChild(line);
    }    
  }
}
