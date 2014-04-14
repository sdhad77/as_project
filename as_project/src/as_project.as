package
{
	import flash.desktop.NativeApplication;  
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.TouchEvent;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class as_project extends Sprite
	{
		public function as_project() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;  
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT; 
			
			var mySprite:Sprite = new Sprite(); 
			mySprite.graphics.beginFill(0x336699); 
			mySprite.graphics.drawRect(0,0,300,300); 
			addChild(mySprite); 
			
			mySprite.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin); 
			mySprite.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove); 
			mySprite.addEventListener(TouchEvent.TOUCH_END, onTouchEnd); 
		}
		private function onTouchBegin(evt:TouchEvent): void { 
			evt.target.startTouchDrag(evt.touchPointID); 
		} 
		
		private function onTouchMove(evt:TouchEvent): void { 
			evt.target.alpha = 0.5; 
		} 
		
		private function onTouchEnd(evt:TouchEvent): void { 
			evt.target.stopTouchDrag(evt.touchPointID); 
			evt.target.alpha = 1; 
		}
	
		private function deactivate(e:Event):void   
		{  
			// auto-close  
			NativeApplication.nativeApplication.exit();  
		}  
	}
}