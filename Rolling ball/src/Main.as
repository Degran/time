package 
{
	import flash.display.GraphicsPath;
	import flash.display.Loader;
	import org.cove.ape.*;
	import flash.net.URLRequest;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import org.cove.ape.CircleParticle;
	import org.cove.ape.Group;
	
	/**
	 * ...
	 * @author Moens
	 */
	public class Main extends Sprite 
	{
		private static var colA:uint = 0x334433;
		private static var colB:uint = 0x3366aa;
		
		public function Main():void 
		{
			stage.frameRate = 55;
			addEventListener(Event.ENTER_FRAME, run);
			
			// Initialize the engine. The argument here is the time step value. 
			// Higher values scale the forces in the sim, making it appear to run
			// faster or slower. Lower values result in more accurate simulations.
			APEngine.init(1/4);
			
			// set up the default diplay container
			APEngine.container = this;
			
			// gravity -- particles of varying masses are affected the same
			APEngine.addMasslessForce(new org.cove.ape.Vector(0, 3));
			
			// groups - all these classes extend group
			var surfaces:Surfaces = new Surfaces(colA, colB);
			APEngine.addGroup(surfaces);
			
			
			var ball:WheelParticle = new WheelParticle(380, 20 , 10, false, 1.3,0);
			var mine:Loader = new Loader();
			var relPath:String = this.loaderInfo.url.substr(0, this.loaderInfo.url.lastIndexOf("Time"))+"Time/";
			//mine.load(new URLRequest("F:/My_Files/Programming/Flash/Escape/mine.swf"));
			mine.load(new URLRequest("../src/Rasta.swf"));
			ball.setDisplay(mine,0,0,90);
			var ballGroup:Group = new Group();
			ballGroup.addParticle(ball);
			APEngine.addGroup(ballGroup);
			
			ballGroup.addCollidable(surfaces);
		}
		
		private function run(evt:Event):void {
			APEngine.step();
			APEngine.step();
			APEngine.paint();
		}

		
		
		
	}
	
}