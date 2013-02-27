package managers
{
  import core.Assets;
  
  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.Sprite;
  
  import interfaces.IState;
  
  import objects.Bait;
  
  import starling.display.Image;
  import starling.events.Event;
  import starling.textures.Texture;
  
  import states.Play;
  
  public class BaitManager implements IState
  {
    private var play:Play;
    private var bait:Bait;
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
      
      if(cast == true && updateInterval == 0)
      {
        bait.x += bait.vx;
        bait.vy += gravity;
        bait.y += bait.vy;
        trace(bait.x + " | " + bait.y);
        
        baitLine.graphics.clear();
        bmd = null;
        
        baitLine.graphics.lineStyle(1, 0x000000, 1);
        baitLine.graphics.moveTo(25,25);
        baitLine.graphics.lineTo(bait.x,bait.y);
        
        bmd = new BitmapData(700,700,true, 0x000000);
        bmd.draw(baitLine);
        
        texture = Texture.fromBitmapData(bmd);
        img.texture = texture;
      } else if(updateInterval == 1) {updateInterval = -1;}
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
    
    private function spawn():void
    {
      bait = new Bait;
      bait.x = 25;
      bait.y = 25;
      play.addChild(bait);
      
      baitLine = new flash.display.Sprite();
      baitLine.graphics.lineStyle(1, 0x000000, 1);
      baitLine.graphics.moveTo(25,25);
      baitLine.graphics.lineTo(25,25);
      
      bmd = new BitmapData(700,700,true, 0x000000);
      bmd.draw(baitLine);
      
      texture = Texture.fromBitmapData(bmd);
      img = new Image(texture);
      play.addChild(img);
    }    
  }
}
