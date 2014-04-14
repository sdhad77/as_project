package 
{  
	import flash.desktop.NativeApplication;  
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.Bitmap;
	
	public class as_project extends Sprite 
	{ 
		var loader:Loader = new Loader;
		var images:Array = [];
		
		public function as_project() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;  
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);  
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			
			loader.load(new URLRequest("http://worldhdwallpaper.com/wp-content/uploads/2013/03/lion-background-colorful-.jpg.jpg"));
		}
		
		protected function completeHandler(e:Event):void {
			// you can pull out the loader content and cast it as a bitmap...
			images.push(loader.content as Bitmap);
			
			// or you can simply add the loader to the stage
			addChild(loader);
			clearListeners();
			
		}
		
		protected function errorHandler(e:IOErrorEvent):void {
			trace("Error loading image! Here's the error:\n" + e);
			clearListeners();
		}
		
		protected function progressHandler(e:ProgressEvent):void {
			trace("Load is " + (100 * e.bytesLoaded / e.bytesTotal) + " percent complete...");
		}
		
		protected function clearListeners():void {
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
		}
		
		private function deactivate(e:Event):void   
		{  
			// auto-close  
			NativeApplication.nativeApplication.exit();  
		}  
	} 
} 