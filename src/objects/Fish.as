package objects
{
	import core.Assets;
	
	import starling.display.MovieClip;
	
	public class Fish extends MovieClip
	{
		private var _vx:int;
		private var _rBound:int;
		private var _lBound:int;
		
		public function Fish()
		{
			super(Assets.ta.getTextures("fishSketch"));
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
		
		public function get rBound():int
		{
			return _rBound;
		}
		
		public function set rBound(num:int):void
		{
			this._rBound = num;
		}
		
		public function get lBound():int
		{
			return _lBound;
		}
		
		public function set lBound(num:int):void
		{
			this._lBound = num;
		}
	}
}