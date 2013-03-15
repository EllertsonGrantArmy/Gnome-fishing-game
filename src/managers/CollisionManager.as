package managers
{
  import flash.events.TimerEvent;
  import flash.geom.Point;
  import flash.sampler.stopSampling;
  import flash.utils.Timer;
  
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
    private var callOnce:Boolean;
    private static const SET_HOOK_TIME:int = 2000;
    
    public function CollisionManager(play:Play)
    {
      this.play = play;
      pointArray = new Array;
    }
    
    public function update():void
    {
      updateInterval++;
      if(updateInterval == 0 && play.baitManager.isCast == true) 
      {
        a = new Point(play.baitManager.bait.x, play.baitManager.bait.y);
        
        for(var i:int=0; i<play.fishManager.fish.length; i++)
        {
          b = new Point(play.fishManager.fish[i].x, play.fishManager.fish[i].y);
          pointArray[i] = b;
        }
        
        if(Math.abs(a.x - b.x) <= 20 && Math.abs(a.y - b.y) <= 20) 
        {
          
          if(callOnce == true){
            callOnce = false;  
            if(Math.floor(Math.random()*3) == 1) {
              trace("bite");
              biting();
            } else {
              trace("no bite");
            }
          }
        } else {
          callOnce = true;
        }
      } else if(updateInterval == 1) {
        updateInterval = -1;
      }
    }
    
    private function biting():void {
      play.pauseGame();
      var timer:Timer=new Timer(SET_HOOK_TIME,1);
      timer.addEventListener(TimerEvent.TIMER, biteOver);
      timer.start();
    }
    
    protected function biteOver(event:TimerEvent):void {
      // TODO Auto-generated method stub
      play.resumeGame();
    }
    
    public function destroy():void
    {
    }
  }
}