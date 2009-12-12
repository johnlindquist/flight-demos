package 
{
	import com.flightxd.hellounion.domains.union.UnionContext;
	import assets.ChatView;
	import flash.display.Sprite;

	/**
	 * @author John Lindquist
	 */
	[SWF(width="550", height="400", frameRate="31", backgroundColor="#ffffff")]
	public class Main extends Sprite 
	{
		public var context:UnionContext;
		public var connectView:ChatView;

		public function Main()
		{
			context = new UnionContext(this);
			connectView = new ChatView();
			
			addChild(connectView);	
		}
	}
}
