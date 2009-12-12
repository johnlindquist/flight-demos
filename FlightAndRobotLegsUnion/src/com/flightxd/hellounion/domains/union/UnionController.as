package com.flightxd.hellounion.domains.union
{
	import com.flightxd.hellounion.domains.union.commands.Connect;
	import com.flightxd.hellounion.domains.union.commands.SendMessage;
	import com.flightxd.hellounion.domains.union.model.UnionModel;
	import flight.commands.ICommand;
	import flight.domain.DomainController;
	import flight.net.IResponse;
	import org.robotlegs.core.IInjector;

	/**
	 * @author John Lindquist
	 */
	public class UnionController extends DomainController
	{
		public static const CONNECT:String = "CONNECT";

		public static const SEND_MESSAGE:String = "SEND_MESSAGE";

		[Inject]
		public var injector:IInjector;

		public var model:UnionModel = new UnionModel();

		public function connect():IResponse
		{
			return execute(CONNECT);
		}

		//"CyborgController" the 'adapter' for Robotlegs->Flight commands
		override public function createCommand(type:String, properties:Object = null):ICommand
		{
			var command:ICommand = super.createCommand(type, properties);
			injector.injectInto(command);
			return command;
		}

		public function sendMessage(message:String):IResponse
		{
			return execute(SEND_MESSAGE, { message: message });
		}

		override protected function init():void
		{
			addCommand(CONNECT, Connect);
			addCommand(SEND_MESSAGE, SendMessage);
		}
	}
}