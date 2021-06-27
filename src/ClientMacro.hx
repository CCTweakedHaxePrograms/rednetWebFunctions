import haxe.macro.Context;
import haxe.macro.Expr;

class ClientMacro {
	macro static public function build():Array<Field> {
		var fields = Context.getBuildFields();
		// var newField = {
		// 	name: fieldName,
		// 	doc: null,
		// 	meta: [],
		// 	access: [AStatic, APublic],
		// 	kind: FVar(macro:String, macro "my default"),
		// 	pos: Context.currentPos()
		// };
		for (field in fields) {
			// trace(field);
			switch (field.kind) {
				case FFun(a):
					if (field.name != "new") {
						var paramList = "";
						for (arg in a.args) {
							paramList += (', ${arg.name}: ${arg.name}');
						}

						var codeStart = '{
							var respProtocol = Random.string(16);
							while (true) {
								cc.Rednet.send(serverID, {type: \'${field.name}\', resp: respProtocol$paramList});
								var message = cc.Rednet.receive(respProtocol, 1000);
								if (message != null && message.senderID == serverID)
									return message.message;
							}
						}';

						a.expr = Context.parse(codeStart, Context.currentPos());
					}
				default:
			}
		}
		return fields;
	}
}
