package com.flightxd.hellounion.services 
{
	import com.flightxd.hellounion.events.ChatEvent;
	import flight.net.IResponse;
	import flight.net.Response;

	import net.user1.logger.LogEvent;
	import net.user1.logger.Logger;
	import net.user1.reactor.ConnectionManagerEvent;
	import net.user1.reactor.IClient;
	import net.user1.reactor.Reactor;
	import net.user1.reactor.ReactorEvent;
	import net.user1.reactor.Room;
	import net.user1.reactor.RoomEvent;

	import com.flightxd.hellounion.config.UnionConfig;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author John Lindquist
	 */
	public class UnionServices extends Actor
	{
		private var logger:Logger;

		[Inject]
		public var $:UnionConfig;
		public var reactor:Reactor = new Reactor();
		public var room:Room;

		[Bindable]
		public var logMessage:String = "waiting to connect";
		private static const CHAT_MESSAGE:String = "CHAT_MESSAGE";

		public function UnionServices()
		{
			logger = reactor.getLog();
			logger.addEventListener(LogEvent.UPDATE, logger_logHandler);
		}

		protected function logger_logHandler(event:LogEvent):void
		{
			eventDispatcher.dispatchEvent(event);
		}

		public function connect():IResponse
		{
			var connectResponse:Response = new Response();
			connectResponse.addCompleteEvent(reactor, ReactorEvent.READY);
			connectResponse.addCancelEvent(reactor.getConnectionManager(), ConnectionManagerEvent.CONNECT_FAILURE);
			reactor.connect($.unionServer, $.unionPort);
			return connectResponse;
		}

		public function join():IResponse
		{
			var joinResponse:Response = new Response();
			
			room = reactor.getRoomManager().createRoom($.chatRoom);
			room.addMessageListener(CHAT_MESSAGE, chatMessageListener);
			room.addEventListener(RoomEvent.SYNCHRONIZE, synchronizeRoomListener);
			room.addEventListener(RoomEvent.ADD_CLIENT, addClientListener);
			room.addEventListener(RoomEvent.REMOVE_CLIENT, removeClientListener);
			room.addEventListener(RoomEvent.UPDATE_CLIENT_ATTRIBUTE, updateClientAttributeListener);
			
			joinResponse.addCompleteEvent(room, RoomEvent.JOIN);
			
			room.join();
			
			return joinResponse;
		}

		private function updateClientAttributeListener(event:RoomEvent):void
		{
		}

		private function removeClientListener(event:RoomEvent):void
		{
		}

		private function addClientListener(event:RoomEvent):void
		{
			trace("update client attribute listener");
			dispatch(event);
		}

		private function synchronizeRoomListener(event:RoomEvent):void
		{
		}

		protected function chatMessageListener(fromClient:IClient, messageText:String):void 
		{
			var chatEvent:ChatEvent = new ChatEvent(ChatEvent.RECEIVE_MESSAGE);
			chatEvent.clientID = fromClient.getClientID();
			chatEvent.messageText = messageText;
			
			dispatch(chatEvent);
		}

		public function sendMessage():IResponse
		{
			var sendMessageResponse:Response = new Response();
			return sendMessageResponse;
		}	

		public function updateUserList():IResponse
		{
			var updateUserListResponse:Response = new Response();
			return updateUserListResponse;
		}

		public function getUserName():IResponse
		{
			var getUserNameResponse:Response = new Response();
			return getUserNameResponse;
		}
	}
}
