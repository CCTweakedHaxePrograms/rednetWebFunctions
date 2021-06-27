# Rednet Web Functions

A macro to easily set up rednet style functions (only client side for now).

Usage:
```haxe
class Api extends Client {
  function getCount(id:String):Int {return 0;}
}
```
```haxe
function main() {
  var api: Api = new Api();
  trace(api.getCount("minecraft:diamond"));
}
```

ToDO:
* [ ] Add Server side macros to make adding new functions easier
* [ ] Add a security system to limit access to networked functions
