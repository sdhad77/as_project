package 
{  
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class as_project extends Sprite 
	{ 
		private var mySprite:Sprite = new Sprite;
		private var stream:ByteArray = new ByteArray();
		
		public function as_project() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;  
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);  
			
			// define the grocery list Array
			var groceries:Array = ["milk", 4.50, "soup", 1.79, "eggs", 3.19, "bread" , 2.35]
			// define the ByteArray
			var bytes:ByteArray = new ByteArray();
			// for each item in the array
			for (var i:int = 0; i < groceries.length; i++) {
				bytes.writeUTFBytes(groceries[i++]); //write the string and position to the next item
				bytes.writeFloat(groceries[i]);// write the float
				trace(i + " bytes.position is: " + bytes.position);//display the position in ByteArray
			}
			trace("bytes length is: " + bytes.length);// display the length
			bytes[bytes.length] = 84;
			bytes[bytes.length] = 85;
			bytes[bytes.length] = 86;
			bytes[bytes.length] = 87;
			bytes.position = 33;
			trace(bytes.readUTFBytes(4));
		}
		
		private function deactivate(e:Event):void   
		{  
			// auto-close  
			NativeApplication.nativeApplication.exit();  
		}  
	} 
} 

//as_project