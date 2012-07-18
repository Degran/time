package {
	
	import org.cove.ape.*;
	
	public class Surfaces extends Group {
		
		public function Surfaces(colA:uint , colB:uint) {
			
			var floor:RectangleParticle = new RectangleParticle(340,327,200,50,-0.7,true,1,0,0.05);
			floor.setStyle(0, colA, 1, colB);
			addParticle(floor);
			
		}
	}
}