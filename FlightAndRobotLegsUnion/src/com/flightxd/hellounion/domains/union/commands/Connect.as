package com.flightxd.hellounion.domains.union.commands 
{
	import flight.domain.AsyncCommand;
	import flight.net.IResponse;

	import net.user1.reactor.Reactor;

	import com.flightxd.hellounion.domains.union.UnionController;
	import com.flightxd.hellounion.domains.union.business.UnionDelegate;

	/**
	 * @author John Lindquist
	 */
	public class Connect extends AsyncCommand
	{
		[Inject]
		public var delegate:UnionDelegate;
		
		[Inject]
		public var controller:UnionController;

		override public function execute():void
		{
			var commandResponse:IResponse = delegate.connect();
			response = commandResponse;
			response.addResultHandler(connectResult);
		}

		private function connectResult(reactor:Reactor):void
		{
			controller.connectSuccess();
		}
	}
}
