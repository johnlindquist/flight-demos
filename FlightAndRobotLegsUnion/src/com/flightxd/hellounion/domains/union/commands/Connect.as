package com.flightxd.hellounion.domains.union.commands 
{
	import net.user1.reactor.Room;
	import flight.domain.AsyncCommand;
	import flight.net.IResponse;

	import net.user1.reactor.Reactor;

	import com.flightxd.hellounion.domains.union.UnionController;
	import com.flightxd.hellounion.services.UnionServices;

	/**
	 * @author John Lindquist
	 */
	public class Connect extends AsyncCommand
	{
		[Inject]
		public var services:UnionServices;
		
		[Inject]
		public var controller:UnionController;

		override public function execute():void
		{
			var connectResponse:IResponse = services.connect();
			response = connectResponse;
			response.addResultHandler(connectResult);
			response.addFaultHandler(faultHandler);
			//execute after the chain is done
			response.addResultHandler(connectedAndJoined);
		}

		private function connectResult(reactor:Reactor):IResponse
		{
			controller.model.isConnected = true;
			
			var joinResponse:IResponse = services.join();
			response = joinResponse;
			response.addResultHandler(joinResult);
			return response;
		}
		
		private function faultHandler(data:*):void
		{
			trace("\n\n\n\n\nconnection failed\n\n\n\n\n\n");
		}

		private function joinResult(room:Room):void
		{
				
		}
				
		private function connectedAndJoined(data:*):void
		{
			trace("I magically go back to the Mediator if needed!");
		}
	}
}
