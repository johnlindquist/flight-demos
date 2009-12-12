package com.flightxd.hellounion.view 
{
	import flight.binding.Bind;
	import flight.events.PropertyEvent;
	import flight.net.IResponse;

	import com.flightxd.hellounion.domains.union.UnionController;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import assets.ChatView;

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
			message += "\n";
			view.chatDisplay.appendText(message);	
		}
		
		override public function onRegister():void
		{
			view.connectButton.addEventListener(MouseEvent.CLICK, connectButton_clickHandler);
			
			Bind.addBinding(view, "statusDisplay.text", controller, "model.connectionStatus");
			Bind.addListener(connectionChanged, controller, "model.isConnected");	
		}
		
		protected function connectButton_clickHandler(event:Event):void
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
			var isConnected:Boolean = event.newValue as Boolean;
			if(isConnected)
			{
				view.statusIndicator.gotoAndStop("connected");
			}
			else
			{
				view.statusIndicator.gotoAndStop("disconnected");
			}
		}
	}
}
