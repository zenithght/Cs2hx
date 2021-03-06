package system.xml.linq;
import system.io.File;
import system.NotImplementedException;

class XDocument extends XContainer
{
	public var Root:XElement;
	
	public function new()
	{
		super(null);
	}
	
	public static function Parse(str:String):XDocument
	{
		var d = new XDocument();
		d._x = Xml.parse(str);
		d.Root = new XElement();
		d.Root._x = d._x.firstElement();
		return d;
	}
	
	public static function Load(path:String):XDocument
	{
		return Parse(File.ReadAllText(path));
	}

	public override function Add(x:XElement):Void
	{
		Root = x;
		_x = x._x;
	}
	
	public function DescendantNodes():Array<XNode>
	{
		return throw new NotImplementedException();
	}
}