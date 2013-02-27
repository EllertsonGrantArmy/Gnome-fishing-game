package objects
{
  import core.Assets;
  
  import starling.display.MovieClip;
  
  public class Bait extends MovieClip
  {
    private var _vx:int;
    private var _vy:int;
    
    public function Bait()
    {
      super(Assets.ta.getTextures("bait"));
      pivotX = width/2;
      pivotY = height/2;
    }
    
    public function get vx():int
    {
      return _vx;
    }
    
    public function set vx(num:int):void
    {
      this._vx = num;
    }

    public function get vy():int
    {
      return _vy;
    }
    
    public function set vy(num:int):void
    {
      this._vy = num;
    }

  }
}