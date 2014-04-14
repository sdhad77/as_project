package
{
	import flash.desktop.NativeApplication;  
	import flash.events.Event;  
	import flash.display.Sprite;  
	import flash.display.StageAlign;  
	import flash.display.StageScaleMode;  
	import flash.events.MouseEvent;  
	import flash.text.TextField;  
	import flash.ui.Multitouch;  
	import flash.ui.MultitouchInputMode; 
	
	public class as_project extends Sprite
	{
		public function as_project()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;  
			stage.align = StageAlign.TOP_LEFT;  
			stage.addEventListener(Event.DEACTIVATE, deactivate);  
			
			// touch or gesture?  
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;  
			
			// entry point  
			stage.addEventListener(MouseEvent.CLICK, onClick);  
			// new to AIR? please read *carefully* the readme.txt files! 
		}
		
		private function onClick(e:MouseEvent):void   
		{  
			var t:TextField = new TextField();  
			t.text = "Hello World!";  
			addChild(t);  
		}  
		
		private function deactivate(e:Event):void   
		{  
			// auto-close  
			NativeApplication.nativeApplication.exit();  
		}  
	}
}