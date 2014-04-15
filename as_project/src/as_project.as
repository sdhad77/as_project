package {
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.utils.Timer;
	
	public class as_project extends Sprite {
		private var mySprite:Sprite = new Sprite(); 
		private var delay:uint = 20;
		private var repeat:uint = 3000;
		private var myTimer:Timer = new Timer(delay, repeat);
		private var posX:int = 0;
		private var posY:int = 0;
		private var plusX:int = 6;
		private var plusY:int = 6;
		private var displayX:int = 1080;
		private var dispalyY:int = 1920;
		private var boxSizeX:int = 200;
		private var boxSizeY:int = 200;
		private var limiteX:int = displayX - boxSizeX;
		private var limiteY:int = dispalyY - boxSizeY;
		private var stateBox:int = 0;
		
		public function as_project() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;  
			stage.addEventListener(Event.DEACTIVATE, deactivate); 
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT; 
			
			mySprite.graphics.beginFill(0x336699); 
			mySprite.graphics.drawRect(posX,posY,boxSizeX,boxSizeY); 
			addChild(mySprite); 
			
			mySprite.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);	
			
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);	
			
			myTimer.start();
		}
		
		private function timerHandler(e:TimerEvent):void{
			if(stateBox == 0){
				posX += plusX;
				if(posX >= limiteX) 
				{
					stateBox = 1
					posX = limiteX;
				}
				mySprite.x = posX;
				addChild(mySprite); 
			}
			else if(stateBox == 1)
			{
				posY += plusY;
				if(posY >= limiteY) 
				{
					stateBox = 2
					posY = limiteY;
				}
				mySprite.y = posY;
				addChild(mySprite); 
			}
			else if(stateBox == 2){
				posX -= plusX;
				if(posX <= 0) 
				{
					stateBox = 3
					posX = 0;
				}
				mySprite.x = posX;
				addChild(mySprite); 
			}
			else
			{
				posY -= plusY;
				if(posY <= 0) 
				{
					stateBox = 0
					posY = 0;
				}
				mySprite.y = posY;
				addChild(mySprite); 
			}
		}
		
		private function completeHandler(e:TimerEvent):void {
			myTimer.reset();
			stateBox = 0;
			posX = 0;
			posY = 0;
			mySprite.x = posX;
			mySprite.y = posY;
			addChild(mySprite); 
		}
		
		private function onTouchBegin(evt:TouchEvent): void { 
			myTimer.reset();
			stateBox = 0;
			posX = 0;
			posY = 0;
			mySprite.x = posX;
			mySprite.y = posY;
			addChild(mySprite); 
			myTimer.start();
		} 		
		
		private function deactivate(e:Event):void   
		{  
			// auto-close  
			NativeApplication.nativeApplication.exit();  
		}  
	}
}