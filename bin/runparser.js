// run me like this
//   NODE_PATH=/usr/local/lib/node_modules/jison/lib node bin/runparser.js
//

var JISON = require('jison'),
    IO = require('jison/util/io');

var raw = IO.read(IO.join(IO.cwd(),'thrift.y'));
var lex = IO.read(IO.join(IO.cwd(),'thrift.l'));

var grammar = require("jison/bnf").parse(raw);
grammar.lex = require("jison/jisonlex").parse(lex);

var Parser = require("jison").Parser;
var parser = new Parser(grammar);
var yy = require(IO.join(IO.cwd(),"htdocs/parse/all.js"));
parser.yy = yy;

util.log_level = 1;
util.debug_log("raw length: "+raw.length);
util.debug_log("lex length: "+lex.length);

var input = IO.read(IO.join(IO.cwd(),'idl/ThriftTest.thrift'));
parser.parse(input);
