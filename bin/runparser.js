// run me like this
//   NODE_PATH=/usr/local/lib/node_modules/jison/lib node bin/runparser.js
//

var JISON = require('jison'),
    IO = require('jison/util/io');

var raw = IO.read(IO.join(IO.cwd(),'thrift.y'));
var lex = IO.read(IO.join(IO.cwd(),'thrift.l'));

console.log("raw length: "+raw.length);
console.log("lex length: "+lex.length);

var grammar = require("jison/bnf").parse(raw);
grammar.lex = require("jison/jisonlex").parse(lex);

var Parser = require("jison").Parser;
var parser = new Parser(grammar);
parser.yy = require(IO.join(IO.cwd(),"htdocs/parse/all.js"));

var input = IO.read(IO.join(IO.cwd(),'idl/ThriftTest.thrift'));
parser.parse(input);




