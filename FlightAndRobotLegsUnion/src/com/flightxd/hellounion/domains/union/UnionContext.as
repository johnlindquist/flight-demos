package com.flightxd.hellounion.domains.union 
{
	import com.flightxd.hellounion.domains.union.commands.AddClient;
	import net.user1.reactor.RoomEvent;
	import net.user1.logger.LogEvent;

	import com.flightxd.hellounion.config.UnionConfig;
	import com.flightxd.hellounion.domains.union.commands.LogMessage;
	import com.flightxd.hellounion.services.UnionServices;
	import com.flightxd.hellounion.view.ChatView;
	import com.flightxd.hellounion.view.ChatViewMediator;

	import org.robotlegs.base.ContextEvent;
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
			injector.mapClass(UnionServices, UnionServices);
			
			mediatorMap.mapView(ChatView, ChatViewMediator);
			
			commandMap.mapEvent(LogEvent.UPDATE, LogMessage);
			commandMap.mapEvent(RoomEvent.ADD_CLIENT, AddClient);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}
