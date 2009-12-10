package com.flightxd.hellounion.events 
{
	import flash.events.Event;

	/**
	 * @author John Lindquist
	 */
	public class ConnectEvent extends Event 
	{
		public static const CONNECT:String = "CONNECT";
		
		public function ConnectEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
