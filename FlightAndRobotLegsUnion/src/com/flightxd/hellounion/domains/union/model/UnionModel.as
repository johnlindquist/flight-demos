package com.flightxd.hellounion.domains.union.model
{

	/**
	 * @author John Lindquist
	 */
	public class UnionModel
	{

		[Bindable]
		public var clients:Array;

		[Bindable]
		public var connectionStatus:String = "not connected";

		[Bindable]
		public var isConnected:Boolean = false;
	}
}