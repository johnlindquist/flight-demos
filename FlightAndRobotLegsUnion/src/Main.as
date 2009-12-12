package
{
	import com.flightxd.hellounion.domains.union.UnionContext;
	import flash.display.Sprite;
	import assets.ChatView;

	/**
	 * @author John Lindquist
	 */
	[SWF(width="550", height="400", frameRate="31", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{

		public function Main()
		{
			context = new UnionContext(this);
			connectView = new ChatView();

			addChild(connectView);
		}

		public var connectView:ChatView;

		public var context:UnionContext;
	}
}
