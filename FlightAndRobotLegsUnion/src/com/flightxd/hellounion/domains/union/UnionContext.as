package com.flightxd.hellounion.domains.union
{
	import com.flightxd.hellounion.config.UnionConfig;
	import com.flightxd.hellounion.domains.union.commands.AddClient;
	import com.flightxd.hellounion.domains.union.commands.LogMessage;
	import com.flightxd.hellounion.domains.union.commands.RemoveClient;
	import com.flightxd.hellounion.domains.union.commands.UpdateClientAttribute;
	import com.flightxd.hellounion.domains.union.commands.UpdateMessages;
	import com.flightxd.hellounion.events.ChatEvent;
	import com.flightxd.hellounion.services.UnionServices;
	import com.flightxd.hellounion.view.ChatViewMediator;
	import flash.display.DisplayObjectContainer;
	import assets.ChatView;
	import net.user1.logger.LogEvent;
	import net.user1.reactor.RoomEvent;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

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
			//singletons
			injector.mapSingleton(UnionController);
			injector.mapSingleton(UnionServices);
			//classes
			injector.mapClass(UnionConfig, UnionConfig);
			//views
			mediatorMap.mapView(ChatView, ChatViewMediator);
			//commands
			commandMap.mapEvent(LogEvent.UPDATE, LogMessage);
			commandMap.mapEvent(RoomEvent.ADD_CLIENT, AddClient);
			commandMap.mapEvent(RoomEvent.REMOVE_CLIENT, RemoveClient);
			commandMap.mapEvent(ChatEvent.UPDATE_CLIENT_ATTRIBUTE, UpdateClientAttribute);
			commandMap.mapEvent(ChatEvent.RECEIVE_MESSAGE, UpdateMessages);
			//startup
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}