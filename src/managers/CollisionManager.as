package managers
{
  import flash.geom.Point;
  
  import interfaces.IState;
  
  import starling.display.Sprite;
  
  import states.Play;
  
  public class CollisionManager extends Sprite implements IState
  {
    private var play:Play;
    private var a:Point;
    private var pointArray:Array;
    private var b:Point;
    private var updateInterval:int = -1;
    private var baitCast:Boolean = false;
    
    public function CollisionManager(play:Play)
    {
      this.play = play;
      pointArray = new Array;
    }
    
    public function update():void
    {
      updateInterval++;
      //TODO don't allow collison until cast is complete
      if(updateInterval == 0) 
      {
        a = new Point(play.baitManager.bait.x, play.baitManager.bait.y);
        
        for(var i:int=0; i<play.fishManager.fish.length; i++)
        {
          b = new Point(play.fishManager.fish[i].x, play.fishManager.fish[i].y);
          pointArray[i] = b;
        }
        
        if(Math.abs(a.x - b.x) <= 20 && Math.abs(a.y - b.y) <= 20) 
        {
          trace("touching");
        }
      } else if(updateInterval == 1) {updateInterval = -1;}
      
    }
    
    public function destroy():void
    {
    }
  }
}