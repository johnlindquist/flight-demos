package com.flightxd.hellounion.domains.union.commands
{
	import com.flightxd.hellounion.domains.union.UnionController;
	import com.flightxd.hellounion.events.ChatEvent;
	import flight.domain.Command;

	/**
	 * @author John Lindquist
	 */
	public class UpdateClientAttribute extends Command
	{

		[Inject]
		public var controller:UnionController;

		[Inject]
		public var event:ChatEvent;

		override public function execute():void
		{
			controller.model.clients = event.clients;
		}
	}
}