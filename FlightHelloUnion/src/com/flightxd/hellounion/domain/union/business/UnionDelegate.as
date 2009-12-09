package com.flightxd.hellounion.domain.union.business 
{
	import flight.config.Config;
	import flight.net.IResponse;
	import flight.net.Response;

	import net.user1.reactor.ReactorEvent;

	import com.flightxd.hellounion.domain.union.model.UnionModel;

	/**
	 * @author John Lindquist
	 */
	public class UnionDelegate 
	{
		private var $:* = Config.main;
		private var model:UnionModel = UnionModel.getInstance();

		public function connect():IResponse
		{
			var response:Response = new Response();
			response.addCompleteEvent(model.reactor, ReactorEvent.READY);
			model.reactor.connect($.unionServer, $.unionPort);
			
			return response;
		}
	}
}
