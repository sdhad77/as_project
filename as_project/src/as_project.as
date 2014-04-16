package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	public class as_project extends Sprite
	{
		private var ldr:Loader;
		public function as_project()
		{
			ldr = new Loader();
			var req:URLRequest = new URLRequest("Greeter.swf");
			var ldrContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			ldr.load(req, ldrContext);    
		
		}
		
		private function completeHandler(event:Event):void
		{
			var ClassRef:Class = ApplicationDomain.currentDomain.getDefinition("Greeter") as Class;
			var myGreeter:* = new ClassRef();
			var message:String = myGreeter.welcome("Tommy");
			trace(message); 
			// Hello, Tommy
		}
	}
}
	
//as_project