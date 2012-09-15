jsthrift
========

Javascript/Jison port of the thrift compiler.

Initially a coding exercise and excuse to try out a few ideas.

To run from node:

NODE_PATH=/usr/local/lib/node_modules/jison/lib node bin/runparser.js

To generate a web-usable parser:

jison -o htdocs/thriftweb.js thrift.y thrift.l