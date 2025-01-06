/*********************************************\
* Based upon Interactivity4 :                 *
* Smooth movement controlled by the keyboard. *
/*********************************************/

package code
{
	//Standard AS3 Imports
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	
	// Public Allows 'Shared Access' to every Class on Screen. 
	// Extends means that the class inheritants or receives from the AS3 MovieClip.
	public class Interactivity extends MovieClip
	{
		// Add Variables
		public var up:Boolean = false;
		public var down:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		
		// Set Animation Speed
		public var speed:Number = 5;
		
		// Add Shared Function
		public function Interactivity()
		{
			// Add Nested Add Event Listeners
			// Listen to keyboard presses
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyReleaseHandler);
			
			// Update Screen Movement Every Frame
			addEventListener(Event.ENTER_FRAME,enterFrameHandler);
		}
		
		// Add Subclass Functions:
		/** KEYBOARD KEY PRESS **/ 
		protected function keyPressHandler(event:KeyboardEvent):void{
			switch (event.keyCode){
				case Keyboard.UP:
					up = true;
					break;
					
				case Keyboard.DOWN:
					down = true;
					break;
					
				case Keyboard.LEFT:
					left = true;
					break;
					
				case Keyboard.RIGHT:
					right = true;
					break;
			}
		}
		
		/** KEYBOARD KEY RELEASE **/ 
		protected function keyReleaseHandler(event:KeyboardEvent):void {
			switch (event.keyCode){
				case Keyboard.UP:
					up = false;
					break;
					
				case Keyboard.DOWN:
					down = false;
					break;
					
				case Keyboard.LEFT:
					left = false;
					break;
					
				case Keyboard.RIGHT:
					right = false;
					break;
			}
		}
		
		protected function enterFrameHandler(event:Event):void{
			/** SET HELICOPTER L, R, U, D MOVEMENT **/ 
			// Move Left
			if (left && !right){
				Helicopter_mc.x -= speed;
				Helicopter_mc.rotation = 0;
				Helicopter_mc.scaleX = -1;
			}
				
			// Move Right
			if (right && !left){
				Helicopter_mc.x += speed;
				Helicopter_mc.rotation = 0;
				Helicopter_mc.scaleX = 1;
			}
				
			// Move Up
			if (up && !down){
				Helicopter_mc.y -= speed;
				Helicopter_mc.rotation = 0;
			}
				
			// Move Down
			if (down && !up){
				Helicopter_mc.y += speed;
				Helicopter_mc.rotation = 0;
			}
				
			/** SET HELICOPTER DIAGONAL MOVEMENT **/
				
			// Move Left/Up Diagonal
			if (left && up && !right && !down){
				Helicopter_mc.rotation = 315;
			}
				
			// Move Right/Up Diagonal
			if (right && up && !left && !down){
				Helicopter_mc.rotation = 45;
			}
				
			// Move Left/Down Diagonal
			if (left && down && !right && !up){
				Helicopter_mc.rotation = -45;
			}
				
			// Move Right/Down Diagonal
			if (right && down && !left && !up){
				Helicopter_mc.rotation = 45;
			}
				
			/** SET HELICOPTER BOUNDING BOX **/ 
				
			//UP Area Bounding Box
			if (Helicopter_mc.y < 90){
				Helicopter_mc.y = 90;
			}
				
			//DOWN Area Bounding Box
			if (Helicopter_mc.y > 570){
				Helicopter_mc.y = 570;
			}
				
			//LEFT Area Bounding Box
			if (Helicopter_mc.x < 55){
				Helicopter_mc.x = 55;
			}
				
			//RIGHT Area Bounding Box
			if (Helicopter_mc.x > 945){
				Helicopter_mc.x = 945;
			}
		}
		
		
	}
}