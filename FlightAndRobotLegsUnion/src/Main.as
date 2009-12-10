package 
{
	import com.flightxd.hellounion.domains.union.UnionContext;
	import com.flightxd.hellounion.view.ConnectView;

	import flash.display.Sprite;

	/**
	 * @author John Lindquist
	 */
	public class Main extends Sprite 
	{
		public var context:UnionContext;
		public var connectView:ConnectView;

		public function Main()
		{
			context = new UnionContext(this);
			connectView = new ConnectView();
			
			addChild(connectView);	
		}
	}
}
