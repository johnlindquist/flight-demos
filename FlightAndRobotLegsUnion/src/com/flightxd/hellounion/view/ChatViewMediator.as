package com.flightxd.hellounion.view 
{
	import flight.net.IResponse;
	import com.flightxd.hellounion.events.ConnectEvent;
	import flight.binding.Bind;
	import flight.events.PropertyEvent;

	import com.flightxd.hellounion.domains.union.UnionController;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author John Lindquist
	 */
	public class ChatViewMediator extends Mediator 
	{
		[Inject]
		public var view:ChatView;
		
		[Inject]
		public var controller:UnionController;
		
		public function updateReceivedMessages(message:String):void
		{
			view.receivedMessageDisplay.appendText(message);	
		}
		
		override public function onRegister():void
		{
			view.addEventListener(ConnectEvent.CONNECT, view_connectHandler);
			
			Bind.addBinding(view, "connectionStatusDisplay.text", controller, "model.connectionStatus");
			Bind.addListener(connectionChanged, controller, "model.isConnected");	
		}
		
		protected function view_connectHandler(event:Event):void
		{
			var finishedConnectingResponse:IResponse = controller.connect();
			finishedConnectingResponse.addResultHandler(connectedHandler);
		}
		
		private function connectedHandler(data:*):void
		{
			trace("Look at me, I'm in the Mediator after all the connection logic is done! Amazing!", data);
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
