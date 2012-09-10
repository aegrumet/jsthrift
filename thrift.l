/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/*
 * JISON port of Thrift scanner
 * Based on thriftl.ll
 * http://svn.apache.org/viewvc/thrift/trunk/compiler/cpp/src/thriftl.ll?view=co
 */

/**
 * Helper definitions, comments, constants, and whatnot
 */

intconstant   ([+-]?[0-9]+(?!\.))
hexconstant   ("0x"[0-9A-Fa-f]+)
dubconstant   ([+-]?([0-9]*\.)?([0-9]+)([eE][+-]?[0-9]+)?)
identifier    ([a-zA-Z_][\.a-zA-Z_0-9]*)
whitespace    ([ \t\r\n]+)
sillycomm     ("/*""*"*"*/")
multicomm     ("/*"[^*]"/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/")
doctext       ("/**"([^*/]|[^*]"/"|"*"[^/])*"*"*"*/")
comment       ("//"[^\n]*)
unixcomment   ("#"[^\n]*)
symbol        ([:;\,\{\}\(\)\=<>\[\]])
st_identifier ([a-zA-Z-][\.a-zA-Z_0-9-]*)
literal_begin (['\"])

%%

{whitespace}         { /* do nothing */                 }
{sillycomm}          { /* do nothing */                 }
{multicomm}          { /* do nothing */                 }
{comment}            { /* do nothing */                 }
{unixcomment}        { /* do nothing */                 }

{symbol}             { return yytext[0];                }
"*"                  { return yytext[0];                }

"false"              { yytext = "0"; return "tok_int_constant"; }
"true"               { yytext = "1"; return "tok_int_constant"; }
"namespace"          { return "tok_namespace";            }
"cpp_namespace"      { return "tok_cpp_namespace";        }
"cpp_include"        { return "tok_cpp_include";          }
"cpp_type"           { return "tok_cpp_type";             }
"java_package"       { return "tok_java_package";         }
"cocoa_prefix"       { return "tok_cocoa_prefix";         }
"csharp_namespace"   { return "tok_csharp_namespace";     }
"delphi_namespace"   { return "tok_delphi_namespace";     }
"php_namespace"      { return "tok_php_namespace";        }
"py_module"          { return "tok_py_module";            }
"perl_package"       { return "tok_perl_package";         }
"ruby_namespace"     { return "tok_ruby_namespace";       }
"smalltalk_category" { return "tok_smalltalk_category";   }
"smalltalk_prefix"   { return "tok_smalltalk_prefix";     }
"xsd_all"            { return "tok_xsd_all";              }
"xsd_optional"       { return "tok_xsd_optional";         }
"xsd_nillable"       { return "tok_xsd_nillable";         }
"xsd_namespace"      { return "tok_xsd_namespace";        }
"xsd_attrs"          { return "tok_xsd_attrs";            }
"include"            { return "tok_include";              }
"void"               { return "tok_void";                 }
"bool"               { return "tok_bool";                 }
"byte"               { return "tok_byte";                 }
"i16"                { return "tok_i16";                  }
"i32"                { return "tok_i32";                  }
"i64"                { return "tok_i64";                  }
"double"             { return "tok_double";               }
"string"             { return "tok_string";               }
"binary"             { return "tok_binary";               }
"slist"              { return "tok_slist";                }
"senum"              { return "tok_senum";                }
"map"                { return "tok_map";                  }
"list"               { return "tok_list";                 }
"set"                { return "tok_set";                  }
"oneway"             { return "tok_oneway";               }
"typedef"            { return "tok_typedef";              }
"struct"             { return "tok_struct";               }
"union"              { return "tok_union";                }
"exception"          { return "tok_xception";             }
"extends"            { return "tok_extends";              }
"throws"             { return "tok_throws";               }
"service"            { return "tok_service";              }
"enum"               { return "tok_enum";                 }
"const"              { return "tok_const";                }
"required"           { return "tok_required";             }
"optional"           { return "tok_optional";             }
"async" {
  pwarning(0, "\"async\" is deprecated.  It is called \"oneway\" now.\n");
  return "tok_oneway";
}


"BEGIN"              { this.yy.thrift_reserved_keyword(yytext); }
"END"                { this.yy.thrift_reserved_keyword(yytext); }
"__CLASS__"          { this.yy.thrift_reserved_keyword(yytext); }
"__DIR__"            { this.yy.thrift_reserved_keyword(yytext); }
"__FILE__"           { this.yy.thrift_reserved_keyword(yytext); }
"__FUNCTION__"       { this.yy.thrift_reserved_keyword(yytext); }
"__LINE__"           { this.yy.thrift_reserved_keyword(yytext); }
"__METHOD__"         { this.yy.thrift_reserved_keyword(yytext); }
"__NAMESPACE__"      { this.yy.thrift_reserved_keyword(yytext); }
"abstract"           { this.yy.thrift_reserved_keyword(yytext); }
"alias"              { this.yy.thrift_reserved_keyword(yytext); }
"and"                { this.yy.thrift_reserved_keyword(yytext); }
"args"               { this.yy.thrift_reserved_keyword(yytext); }
"as"                 { this.yy.thrift_reserved_keyword(yytext); }
"assert"             { this.yy.thrift_reserved_keyword(yytext); }
"begin"              { this.yy.thrift_reserved_keyword(yytext); }
"break"              { this.yy.thrift_reserved_keyword(yytext); }
"case"               { this.yy.thrift_reserved_keyword(yytext); }
"catch"              { this.yy.thrift_reserved_keyword(yytext); }
"class"              { this.yy.thrift_reserved_keyword(yytext); }
"clone"              { this.yy.thrift_reserved_keyword(yytext); }
"continue"           { this.yy.thrift_reserved_keyword(yytext); }
"declare"            { this.yy.thrift_reserved_keyword(yytext); }
"def"                { this.yy.thrift_reserved_keyword(yytext); }
"default"            { this.yy.thrift_reserved_keyword(yytext); }
"del"                { this.yy.thrift_reserved_keyword(yytext); }
"delete"             { this.yy.thrift_reserved_keyword(yytext); }
"do"                 { this.yy.thrift_reserved_keyword(yytext); }
"dynamic"            { this.yy.thrift_reserved_keyword(yytext); }
"elif"               { this.yy.thrift_reserved_keyword(yytext); }
"else"               { this.yy.thrift_reserved_keyword(yytext); }
"elseif"             { this.yy.thrift_reserved_keyword(yytext); }
"elsif"              { this.yy.thrift_reserved_keyword(yytext); }
"end"                { this.yy.thrift_reserved_keyword(yytext); }
"enddeclare"         { this.yy.thrift_reserved_keyword(yytext); }
"endfor"             { this.yy.thrift_reserved_keyword(yytext); }
"endforeach"         { this.yy.thrift_reserved_keyword(yytext); }
"endif"              { this.yy.thrift_reserved_keyword(yytext); }
"endswitch"          { this.yy.thrift_reserved_keyword(yytext); }
"endwhile"           { this.yy.thrift_reserved_keyword(yytext); }
"ensure"             { this.yy.thrift_reserved_keyword(yytext); }
"except"             { this.yy.thrift_reserved_keyword(yytext); }
"exec"               { this.yy.thrift_reserved_keyword(yytext); }
"finally"            { this.yy.thrift_reserved_keyword(yytext); }
"float"              { this.yy.thrift_reserved_keyword(yytext); }
"for"                { this.yy.thrift_reserved_keyword(yytext); }
"foreach"            { this.yy.thrift_reserved_keyword(yytext); }
"function"           { this.yy.thrift_reserved_keyword(yytext); }
"global"             { this.yy.thrift_reserved_keyword(yytext); }
"goto"               { this.yy.thrift_reserved_keyword(yytext); }
"if"                 { this.yy.thrift_reserved_keyword(yytext); }
"implements"         { this.yy.thrift_reserved_keyword(yytext); }
"import"             { this.yy.thrift_reserved_keyword(yytext); }
"in"                 { this.yy.thrift_reserved_keyword(yytext); }
"inline"             { this.yy.thrift_reserved_keyword(yytext); }
"instanceof"         { this.yy.thrift_reserved_keyword(yytext); }
"interface"          { this.yy.thrift_reserved_keyword(yytext); }
"is"                 { this.yy.thrift_reserved_keyword(yytext); }
"lambda"             { this.yy.thrift_reserved_keyword(yytext); }
"module"             { this.yy.thrift_reserved_keyword(yytext); }
"native"             { this.yy.thrift_reserved_keyword(yytext); }
"new"                { this.yy.thrift_reserved_keyword(yytext); }
"next"               { this.yy.thrift_reserved_keyword(yytext); }
"nil"                { this.yy.thrift_reserved_keyword(yytext); }
"not"                { this.yy.thrift_reserved_keyword(yytext); }
"or"                 { this.yy.thrift_reserved_keyword(yytext); }
"pass"               { this.yy.thrift_reserved_keyword(yytext); }
"public"             { this.yy.thrift_reserved_keyword(yytext); }
"print"              { this.yy.thrift_reserved_keyword(yytext); }
"private"            { this.yy.thrift_reserved_keyword(yytext); }
"protected"          { this.yy.thrift_reserved_keyword(yytext); }
"public"             { this.yy.thrift_reserved_keyword(yytext); }
"raise"              { this.yy.thrift_reserved_keyword(yytext); }
"redo"               { this.yy.thrift_reserved_keyword(yytext); }
"rescue"             { this.yy.thrift_reserved_keyword(yytext); }
"retry"              { this.yy.thrift_reserved_keyword(yytext); }
"register"           { this.yy.thrift_reserved_keyword(yytext); }
"return"             { this.yy.thrift_reserved_keyword(yytext); }
"self"               { this.yy.thrift_reserved_keyword(yytext); }
"sizeof"             { this.yy.thrift_reserved_keyword(yytext); }
"static"             { this.yy.thrift_reserved_keyword(yytext); }
"super"              { this.yy.thrift_reserved_keyword(yytext); }
"switch"             { this.yy.thrift_reserved_keyword(yytext); }
"synchronized"       { this.yy.thrift_reserved_keyword(yytext); }
"then"               { this.yy.thrift_reserved_keyword(yytext); }
"this"               { this.yy.thrift_reserved_keyword(yytext); }
"throw"              { this.yy.thrift_reserved_keyword(yytext); }
"transient"          { this.yy.thrift_reserved_keyword(yytext); }
"try"                { this.yy.thrift_reserved_keyword(yytext); }
"undef"              { this.yy.thrift_reserved_keyword(yytext); }
"union"              { this.yy.thrift_reserved_keyword(yytext); }
"unless"             { this.yy.thrift_reserved_keyword(yytext); }
"unsigned"           { this.yy.thrift_reserved_keyword(yytext); }
"until"              { this.yy.thrift_reserved_keyword(yytext); }
"use"                { this.yy.thrift_reserved_keyword(yytext); }
"var"                { this.yy.thrift_reserved_keyword(yytext); }
"virtual"            { this.yy.thrift_reserved_keyword(yytext); }
"volatile"           { this.yy.thrift_reserved_keyword(yytext); }
"when"               { this.yy.thrift_reserved_keyword(yytext); }
"while"              { this.yy.thrift_reserved_keyword(yytext); }
"with"               { this.yy.thrift_reserved_keyword(yytext); }
"xor"                { this.yy.thrift_reserved_keyword(yytext); }
"yield"              { this.yy.thrift_reserved_keyword(yytext); }

{intconstant} {
  $$ = Number(yytext);
  if ( $$ === Infinity ) {
    integer_overflow(yytext);
  }
  return "tok_int_constant";
}

{hexconstant} {
  $$ = Number(yytext);
  if ( $$ === Infinity ) {
    integer_overflow(yytext);
  }
  return "tok_int_constant";
}

{dubconstant} {
  $$ = Number(yytext);
  return "tok_dub_constant";
}

{identifier} {
  return "tok_identifier";
}

{st_identifier} {
  return "tok_st_identifier";
}

{literal_begin} {
  var mark = yytext[0];
  var result;
  for(;;)
  {
    var ch = this.input();
    switch (ch) {
      case this.EOF:
        yyerror("End of file while read string at %d\n", yylineno);
        exit(1);
      case '\n':
        yyerror("End of line while read string at %d\n", yylineno - 1);
        exit(1);
      case '\\':
        ch = this.input();
        switch (ch) {
          case 'r':
            result += '\r';
            continue;
          case 'n':
            result += '\n';
            continue;
          case 't':
            result += '\t';
            continue;
          case '"':
            result += '"';
            continue;
          case '\'':
            result += '\'';
            continue;
          case '\\':
            result += '\\';
            continue;
          default:
            yyerror("Bad escape character\n");
            return -1;
        }
        break;
      default:
        if (ch == mark) {
          $$ = result;
          return "tok_literal";
        } else {
          result += ch;
        }
    }
  }
}


{doctext} {
 /* This does not show up in the parse tree. */
 /* Rather, the parser will grab it out of the global. */
  var g_parse_mode = 1; //AG: tmp
  var PROGRAM = 1;      //AG: tmp
  var clear_doctext = function() {
    //util.debug_log("clearing doctext");
  }; //AG: tmp
  var clean_up_doctext = function(g_doctext) {
    //util.debug_log("cleaning up doctext: "+g_doctext);
    return g_doctext;
  }; //AG: tmp
  if (g_parse_mode == PROGRAM) {
    clear_doctext();
    g_doctext = yytext.substr(3, yytext.length - 5);
    g_doctext = clean_up_doctext(g_doctext);
    g_doctext_lineno = yylineno;
  }
}

. {
  unexpected_token(yytext);
}


. {
  /* Catch-all to let us catch "*" in the parser. */
  return Number(yytext[0]);
}

