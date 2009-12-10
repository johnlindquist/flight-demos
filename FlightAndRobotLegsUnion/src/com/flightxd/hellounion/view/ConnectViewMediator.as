package com.flightxd.hellounion.view 
{
	import com.flightxd.hellounion.events.ConnectEvent;
	import flight.binding.Bind;
	import flight.events.PropertyEvent;

	import com.flightxd.hellounion.domains.union.UnionController;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author John Lindquist
	 */
	public class ConnectViewMediator extends Mediator 
	{
		[Inject]
		public var view:ConnectView;
		
		[Inject]
		public var controller:UnionController;
		
		override public function onRegister():void
		{
			view.addEventListener(ConnectEvent.CONNECT, view_connectHandler);
			
			Bind.addBinding(view, "connectionStatusDisplay.text", controller, "model.connectionStatus");
			Bind.addListener(connectionChanged, controller, "model.isConnected");	
		}
		
		protected function view_connectHandler(event:Event):void
		{
			controller.connect();
		}

		protected function connectionChanged(event:PropertyEvent):void
		{
			if(controller.model.isConnected)
			{
				view.showConnectedButton();
			}
			else
			{
				view.showDisconnectedButton();
			}
		}
	}
}
