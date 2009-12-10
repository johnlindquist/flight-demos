package com.flightxd.hellounion.domains.union 
{
	import com.flightxd.hellounion.config.UnionConfig;
	import com.flightxd.hellounion.domains.union.business.UnionDelegate;
	import com.flightxd.hellounion.domains.union.commands.Connect;
	import com.flightxd.hellounion.events.ConnectEvent;
	import com.flightxd.hellounion.view.ConnectView;
	import com.flightxd.hellounion.view.ConnectViewMediator;

	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author John Lindquist
	 */
	public class UnionContext extends Context 
	{
		public function UnionContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{
			injector.mapSingleton(UnionController);
			
			injector.mapClass(UnionConfig, UnionConfig);
			injector.mapClass(UnionDelegate, UnionDelegate);
			
			mediatorMap.mapView(ConnectView, ConnectViewMediator);
			commandMap.mapEvent(ConnectEvent.CONNECT, Connect);

			super.startup();
		}
	}
}
