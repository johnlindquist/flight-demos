package com.flightxd.hellounion.domains.union.commands 
{
	import flight.domain.Command;

	import net.user1.reactor.IClient;
	import net.user1.reactor.RoomEvent;

	import com.flightxd.hellounion.view.ChatViewMediator;

	/**
	 * @author John Lindquist
	 */
	public class AddClient extends Command 
	{
		[Inject]
		public var mediator:ChatViewMediator;

		[Inject]
		public var event:RoomEvent;

		override public function execute():void
		{
			var user:String = getUserName(event.getClient());
			var joinedMessage:String = " has joined the room";
			var message:String = user + joinedMessage;
			mediator.updateReceivedMessages(message);
		}

		protected function getUserName(client:IClient):String 
		{
			var username:String = client.getAttribute("username");
			if (username == null) 
			{
				return "Guest" + client.getClientID();
			} 
			else 
			{
				return username;
			}
		}
	}
}
