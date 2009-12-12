package com.flightxd.hellounion.events 
{
	import flash.events.Event;

	/**
	 * @author John Lindquist
	 */
	public class ChatEvent extends Event 
	{
		public var clientID:String;
		public var messageText:String;
		public static const RECEIVE_MESSAGE:String = "RECEIVE_MESSAGE";

		public function ChatEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
