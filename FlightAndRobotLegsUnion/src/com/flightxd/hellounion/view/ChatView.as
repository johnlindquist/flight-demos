package com.flightxd.hellounion.view 
{
	import com.flightxd.hellounion.events.ConnectEvent;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author John Lindquist
	 */
	public class ChatView extends Sprite 
	{
		public var connectionStatusDisplay:TextField = new TextField();
		public var connectButton:Sprite = new Sprite();
		public var receivedMessageDisplay:TextField = new TextField();
		public var inputMessageDisplay:TextField = new TextField();
		

		public function ChatView()
		{
			//textfield for showing union logs
			connectionStatusDisplay.width = 500;
			addChild(connectionStatusDisplay);

			//connection status button. green = connected, red = disconnected
			showDisconnectedButton();
			connectButton.x = 450;
			addChild(connectButton);
			
			//textfield for showing received messages
			receivedMessageDisplay.x = 25;
			receivedMessageDisplay.y = 30;
			receivedMessageDisplay.height = 300;
			receivedMessageDisplay.width = 500;
			receivedMessageDisplay.border = true;
			receivedMessageDisplay.multiline = true;
			addChild(receivedMessageDisplay);
			
			
			
			connectButton.addEventListener(MouseEvent.CLICK, connectButton_clickHandler);
		}

		public function showDisconnectedButton():void
		{
			connectButton.graphics.clear();
			connectButton.graphics.beginFill(0xcc0000);
			connectButton.graphics.drawRect(0, 0, 100, 20);
			connectButton.graphics.endFill();
		}

		public function showConnectedButton():void
		{
			connectButton.graphics.clear();
			connectButton.graphics.beginFill(0x00cc00);
			connectButton.graphics.drawRect(0, 0, 100, 20);
			connectButton.graphics.endFill();
		}

		protected function connectButton_clickHandler(event:MouseEvent):void
		{
			dispatchEvent(new ConnectEvent(ConnectEvent.CONNECT));	
		}
	}
}
