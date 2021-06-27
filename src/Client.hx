@:autoBuild(ClientMacro.build())
class Client {
	var serverID:Int;

	function new(protocol:String) {
		serverID = cc.Rednet.lookup(protocol)[0];
	}
}
