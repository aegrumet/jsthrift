jsthrift
========

Javascript/Jison port of the thrift compiler.

Initially a coding exercise and excuse to try out a few ideas.

To generate a web-usable parser:

jison -o htdocs/thriftweb.js thrift.y thrift.l