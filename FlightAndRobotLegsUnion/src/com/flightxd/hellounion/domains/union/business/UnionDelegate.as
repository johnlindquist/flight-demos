package com.flightxd.hellounion.domains.union.business 
{
	import flight.net.IResponse;
	import flight.net.Response;

	import net.user1.reactor.ReactorEvent;

	import com.flightxd.hellounion.config.UnionConfig;
	import com.flightxd.hellounion.domains.union.UnionController;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author John Lindquist
	 */
	public class UnionDelegate extends Actor
	{
		[Inject]
		public var config:UnionConfig;
		[Inject]
		public var controller:UnionController;

		public function connect():IResponse
		{
			var response:Response = new Response();
			response.addCompleteEvent(controller.model.reactor, ReactorEvent.READY);
			controller.model.reactor.connect(config.unionServer, config.unionPort);
			
			return response;
		}
	}
}
