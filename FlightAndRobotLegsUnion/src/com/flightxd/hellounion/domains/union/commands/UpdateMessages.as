package com.flightxd.hellounion.domains.union.commands
{
	import com.flightxd.hellounion.events.ChatEvent;
	import com.flightxd.hellounion.view.ChatViewMediator;
	import flight.domain.Command;

	/**
	 * @author John Lindquist
	 */
	public class UpdateMessages extends Command
	{

		[Inject]
		public var event:ChatEvent;

		[Inject]
		public var mediator:ChatViewMediator;

		override public function execute():void
		{
			var message:String;
			var clientID:String = event.clientID;
			var messageText:String = event.messageText;
			message = "Guest" + clientID + ": " + messageText;
			mediator.updateReceivedMessages(message);
		}
	}
}