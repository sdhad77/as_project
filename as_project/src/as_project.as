package {
	import flash.filesystem.*;
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	import flash.utils.CompressionAlgorithm;
	import flash.text.TextField;
	
	public class as_project extends Sprite
	{
		public function as_project()
		{
			var inBytes:ByteArray = new ByteArray();
			// define text area for displaying XML content
			var myTxt:TextField = new TextField();
			myTxt.width = 550;
			myTxt.height = 400;
			addChild(myTxt);
			//display objectEncoding and file heading
			myTxt.text = "Object encoding is: " + inBytes.objectEncoding + "\n\n" + "order file: \n\n";
			readFileIntoByteArray("order.xml", inBytes);
			inBytes.position = 0; // reset position to beginning
			inBytes.uncompress(CompressionAlgorithm.DEFLATE);
			inBytes.position = 0;//reset position to beginning
			// read XML Object
			var orderXML:XML = inBytes.readObject();
			// for each node in orderXML
			for each (var child:XML in orderXML)
			{
				// append child node to text area
				myTxt.text += child + "\n";
			}
		}
		// read specified file into byte array
		private function readFileIntoByteArray(fileName:String, data:ByteArray):void
		{
			var inFile:File = File.desktopDirectory; // source folder is desktop
			inFile = inFile.resolvePath(fileName); // name of file to read
			var inStream:FileStream = new FileStream();
			inStream.open(inFile, FileMode.READ);
			inStream.readBytes(data);
			inStream.close();
		}
	}
}

//as_project