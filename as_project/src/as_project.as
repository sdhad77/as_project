package {
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.utils.Timer;
	
	public class as_project extends Sprite {
		private var delay:uint = 17;
		private var repeat:uint = 300;
		private var mySprite:Sprite = new Sprite(); 
		private var myTimer:Timer = new Timer(delay, repeat);
		private var posX:int = 0;
		private var posY:int = 0;
		private var isTouch:Boolean = false;
		
		public function as_project() {
			stage.addEventListener(Event.DEACTIVATE, deactivate); 
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT; 
			
			mySprite.graphics.beginFill(0x336699); 
			mySprite.graphics.drawRect(posX,posY,300,300); 
			addChild(mySprite); 
			
			mySprite.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);	
			
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);		
		}
		
		private function timerHandler(e:TimerEvent):void{
			repeat--;
			posX++;
			posY++;
			mySprite.x = posX;
			mySprite.y = posY;
			addChild(mySprite); 
		}
		
		private function completeHandler(e:TimerEvent):void {
			isTouch = false;
			repeat = 300;
			myTimer.reset();
			posX = 0;
			posY = 0;
			mySprite.x = posX;
			mySprite.y = posY;
			addChild(mySprite); 
		}
		
		private function onTouchBegin(evt:TouchEvent): void { 
			if(isTouch == false)
			{
				myTimer.start();
				isTouch = true;
			}
		} 
		
		private function deactivate(e:Event):void   
		{  
			// auto-close  
			NativeApplication.nativeApplication.exit();  
		}  
	}
}