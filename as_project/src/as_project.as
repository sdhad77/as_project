package {
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	public class as_project extends Sprite {
		private var downloadURL:URLRequest;
		private var fileName:String = "gpl-3.0.txt";
		private var file:FileReference;
		
		public function as_project() {
			downloadURL = new URLRequest();
			downloadURL.url = "http://www.gnu.org/licenses/gpl-3.0.txt";
			file = new FileReference();
			configureListeners(file);
			file.download(downloadURL, fileName);
		}
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener(Event.CANCEL, cancelHandler);
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispatcher.addEventListener(Event.SELECT, selectHandler);
		}
		
		private function cancelHandler(event:Event):void {
			trace("cancelHandler: " + event);
		}
		
		private function completeHandler(event:Event):void {
			trace("completeHandler: " + event);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			trace("ioErrorHandler: " + event);
		}
		
		private function openHandler(event:Event):void {
			trace("openHandler: " + event);
		}
		
		private function progressHandler(event:ProgressEvent):void {
			var file:FileReference = FileReference(event.target);
			trace("progressHandler name=" + file.name + " bytesLoaded=" + event.bytesLoaded + " bytesTotal=" + event.bytesTotal);
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void {
			trace("securityErrorHandler: " + event);
		}
		
		private function selectHandler(event:Event):void {
			var file:FileReference = FileReference(event.target);
			trace("selectHandler: name=" + file.name + " URL=" + downloadURL.url);
		}
	}
}

//as_project