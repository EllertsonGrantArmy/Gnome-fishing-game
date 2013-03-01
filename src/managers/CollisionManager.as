package managers
{
  import interfaces.IState;
  
  import starling.display.Sprite;
  
  import states.Play;
  
  public class CollisionManager extends Sprite implements IState
  {
    private var play:Play;
    
    public function CollisionManager(play:Play)
    {
      this.play = play;
    }
    
    public function update():void
    {
    }
    
    public function destroy():void
    {
    }
  }
}