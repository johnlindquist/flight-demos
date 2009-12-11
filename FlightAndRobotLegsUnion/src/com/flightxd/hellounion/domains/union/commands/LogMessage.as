package com.flightxd.hellounion.domains.union.commands 
{
	import flight.domain.Command;

	import net.user1.logger.LogEvent;

	import com.flightxd.hellounion.domains.union.UnionController;

	/**
	 * @author John Lindquist
	 */
	public class LogMessage extends Command 
	{
		[Inject]
		public var controller:UnionController;
		
		[Inject]
		public var event:LogEvent;
		
		override public function execute():void
		{
			controller.model.connectionStatus = event.getMessage();
		}
	}
}
