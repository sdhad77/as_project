package {
	import flash.filesystem.*;
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	import flash.text.TextField;
	import flash.utils.CompressionAlgorithm;
	
	public class as_project extends Sprite
	{
		public function as_project()
		{
			var bytes:ByteArray = new ByteArray();
			var myLabel:TextField = new TextField();
			myLabel.x = 150;
			myLabel.y = 150;
			myLabel.width = 200;
			addChild(myLabel);
			var myXML:XML =
				<order>
				<item id='1'>
				<menuName>burger</menuName>
				<price>3.95</price>
				</item>
				<item id='2'>
				<menuName>fries</menuName>
				<price>1.45</price>
				</item>
				</order>;
			// Write XML object to ByteArray
			bytes.writeObject(myXML);
			bytes.position = 0;//reset position to beginning
			bytes.compress(CompressionAlgorithm.DEFLATE);// compress ByteArray
			writeBytesToFile("order.xml", bytes);
			myLabel.text = "Wrote order file to desktop!";
		}
		private function writeBytesToFile(fileName:String, data:ByteArray):void
		{
			var outFile:File = File.desktopDirectory; // dest folder is desktop
			outFile = outFile.resolvePath(fileName); // name of file to write
			var outStream:FileStream = new FileStream();
			// open output file stream in WRITE mode
			outStream.open(outFile, FileMode.WRITE);
			// write out the file
			outStream.writeBytes(data, 0, data.length);
			// close it
			outStream.close();
		}
	}
}

//as_project