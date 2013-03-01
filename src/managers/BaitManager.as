package managers
{
  import core.Assets;
  
  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.Sprite;
  
  import interfaces.IState;
  
  import objects.Bait;
  
  import starling.animation.Transitions;
  import starling.animation.Tween;
  import starling.core.Starling;
  import starling.display.Image;
  import starling.events.Event;
  import starling.textures.Texture;
  
  import states.Play;
  
  public class BaitManager implements IState
  {
    private var play:Play;
    public var bait:Bait;
    private var vx:int;
    private var vy:int;
    private var gravity:int = 2;
    public var cast:Boolean = false;
    private var updateInterval:int = -1;
    private var baitLine:flash.display.Sprite;
    private var bitmap1:Bitmap;
    private var bmd:BitmapData;
    private var texture:Texture;
    private var img:Image;
    private var dist:int;
    private var slope:Number;
    private var tween:Tween;
    
    public function BaitManager(play:Play)
    {
      this.play = play;
      spawn();
    }
    
    public function update():void
    {
      updateInterval += 1;
      
      if(bait.x > 400 && bait.x < 600)
      {
        bait.vy -= 1;
      } 
      if(bait.x > 600 || bait.y > 600)
      {
        cast = false;
      }
      
      //position line when casting
      if(cast == true && updateInterval == 0)
      {
        bait.x += bait.vx;
        bait.vy += gravity;
        bait.y += bait.vy;
        
        
      } else if(updateInterval == 1) {updateInterval = -1;}
      dist = Math.sqrt((bait.x - 25)*(bait.x - 25) + (bait.y - 25)*(bait.y - 25));
      img.scaleX = dist;
      img.rotation = Math.atan2(bait.y, bait.x)
    }
    
    public function destroy():void
    {
      
    }
    
    public function castBait(vx:int, vy:int):void
    {
      bait.vx = vx;
      bait.vy = vy;
      cast = true;
    }
    
    public function reelBait():void
    {
      slope = (bait.y - 0)/(bait.x-0);
      trace("Slope: " + slope);
      tween = new Tween(bait,.5, Transitions.EASE_OUT);
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
      
      //create fising line img
      baitLine = new flash.display.Sprite();
      baitLine.graphics.beginFill(0x000000, 1);
      baitLine.graphics.drawRect(0, 0, 1, 1);
      baitLine.graphics.endFill();
      
      bmd = new BitmapData(1, 1, true, 0x000000);
      bmd.draw(baitLine);
      texture = Texture.fromBitmapData(bmd);
      
      img = new Image(texture);
      img.x = 25;
      img.y = 25;
      play.addChild(img)
    }    
  }
}
