package com.flightxd.hellounion.domains.union 
{
	import flash.utils.getDefinitionByName;
	import net.user1.logger.LogEvent;
	import net.user1.reactor.RoomEvent;

	import com.flightxd.hellounion.config.UnionConfig;
	import com.flightxd.hellounion.domains.union.commands.LogMessage;
	import com.flightxd.hellounion.domains.union.commands.UpdateClients;
	import com.flightxd.hellounion.domains.union.commands.UpdateMessages;
	import com.flightxd.hellounion.events.ChatEvent;
	import com.flightxd.hellounion.services.UnionServices;
	import com.flightxd.hellounion.view.ChatViewMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;
	
	import assets.ChatView;

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
			
			trace("this won't work");
			mediatorMap.mapView(ChatView, ChatViewMediator);
			
			commandMap.mapEvent(LogEvent.UPDATE, LogMessage);
			commandMap.mapEvent(RoomEvent.ADD_CLIENT, UpdateClients);
			commandMap.mapEvent(ChatEvent.RECEIVE_MESSAGE, UpdateMessages);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}
