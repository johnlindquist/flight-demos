package com.flightxd.hellounion.domains.union 
{
	import flight.commands.ICommand;
	import flight.domain.DomainController;
	import flight.net.IResponse;

	import com.flightxd.hellounion.domains.union.commands.Connect;
	import com.flightxd.hellounion.domains.union.model.UnionModel;

	import org.robotlegs.core.IInjector;

	/**
	 * @author John Lindquist
	 */
	public class UnionController extends DomainController
	{
		public static const CONNECT:String = "CONNECT";

		[Inject]
		public var injector:IInjector;

		public var model:UnionModel = new UnionModel();

		public function UnionController()
		{
		}

		public function connect():IResponse
		{
			return execute(CONNECT);
		}

		override protected function init():void
		{
			addCommand(CONNECT, Connect);
		}
		
		//"CyborgController" the 'adapter' for Robotlegs->Flight commands
		override public function createCommand(type:String, properties:Object = null):ICommand
		{
			var command:ICommand = super.createCommand(type, properties);
			injector.injectInto(command);
			return command;
		}
	}
}
