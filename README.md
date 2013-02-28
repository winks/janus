## Janus

This is a small parser that allows the following JavaScript expressions:

  * `expr == expr`
  * `expr != expr`
  * `expr >= expr`
  * `expr > expr`
  * `expr <= expr`
  * `expr < expr`
  * `expr || expr`
  * `expr && expr`
  * `( expr )`
  * `variable`
  * `3`
  * `-4`
  * `'"There", he said.'`
  * `"\"There\", he said."`

and then returns a namespaced javascript expression (foo will become JANUS.foo)

### Requirements

  * [node.js](http://nodejs.org) v0.8.2 (might work with other versions)
  * [Jison](http://jison.org) v0.4.2, installing locally is fine

### Notes

  * The JS part "mocks" variable binding by assuming Math.PI for all variables. The tests reflect this.
  * the Makefile expects a jison checkout (commit 40d7bf69e1d83d33e281efb73c8d0c28bcc100df works) at ../jison (used for the php port)

### Thanks

  * [Jison](http://jison.org) for being awesome
  * Obeliks for fixing the last parser bug :P
