package com.flightxd.hellounion.domains.union 
{
	import flight.domain.DomainController;

	import net.user1.logger.LogEvent;
	import net.user1.logger.Logger;

	import com.flightxd.hellounion.domains.union.model.UnionModel;

	/**
	 * @author John Lindquist
	 */
	public class UnionController extends DomainController
	{
		public var model:UnionModel = new UnionModel();

		public function UnionController()
		{
			//mapping commands in the context seems to make the domain controller feel useless?
			//Thoughts?
			
			
			var logger:Logger = model.reactor.getLog();
			logger.addEventListener(LogEvent.UPDATE, logger_logHandler);
		}

		public function connectSuccess():void
		{
			model.isConnected = true;
		}

		protected function logger_logHandler(event:LogEvent):void
		{
			model.connectionStatus = event.getMessage();
		}
	}
}
