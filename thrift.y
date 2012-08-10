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
 * JISON port of Thrift Grammar
 * Based on thrifty.yy
 * http://svn.apache.org/viewvc/thrift/trunk/compiler/cpp/src/thrifty.yy?view=co
 */

/**
 * Thrift Grammar Implementation.
 *
 * For the most part this source file works its way top down from what you
 * might expect to find in a typical .thrift file, i.e. type definitions and
 * namespaces up top followed by service definitions using those types.
 */

%%

Program:
  HeaderList DefinitionList
    {
      console.log("Program -> Headers DefinitionList");
    }
    ;

CaptureDocText:
    {
      console.log("CaptureDocText");
    }
    ;

DestroyDocText:
    {
      console.log("DestroyDocText");
    }
    ;

/* We have to DestroyDocText here, otherwise it catches the doctext
   on the first real element. */
HeaderList:
  HeaderList Header
    {
      console.log("HeaderList -> HeaderList Header");
    }
|
    {
      console.log("HeaderList -> ");
    }
    ;

Header:
  Include
    {
      console.log("Header -> Include");
    }
| tok_namespace tok_identifier tok_identifier
    {
      console.log("Header -> tok_namespace tok_identifier tok_identifier");
      yy.g_program.set_namespace($2, $3);
    }
| tok_namespace '*' tok_identifier
    {
      console.log("Header -> tok_namespace * tok_identifier");
      yy.g_program.set_namespace("*", $3);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_cpp_namespace tok_identifier
    {
      console.log("Header -> tok_cpp_namespace tok_identifier");
      yy.g_program.set_namespace("cpp", $2);
    }
| tok_cpp_include tok_literal
    {
      console.log("Header -> tok_cpp_include tok_literal");
      yy.g_program.add_cpp_include($2);
    }
| tok_php_namespace tok_identifier
    {
      console.log("Header -> tok_php_namespace tok_identifier");
      yy.g_program.set_namespace("php", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_py_module tok_identifier
    {
      console.log("Header -> tok_py_module tok_identifier");
      yy.g_program.set_namespace("py", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_perl_package tok_identifier
    {
      console.log("Header -> tok_perl_namespace tok_identifier");
      yy.g_program.set_namespace("perl", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_ruby_namespace tok_identifier
    {
      console.log("Header -> tok_ruby_namespace tok_identifier");
      yy.g_program.set_namespace("rb", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_smalltalk_category tok_st_identifier
    {
      console.log("Header -> tok_smalltalk_category tok_st_identifier");
      yy.g_program.set_namespace("smalltalk.category", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_smalltalk_prefix tok_identifier
    {
      console.log("Header -> tok_smalltalk_prefix tok_identifier");
      yy.g_program.set_namespace("smalltalk.prefix", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_java_package tok_identifier
    {
      console.log("Header -> tok_java_package tok_identifier");
      yy.g_program.set_namespace("java", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_cocoa_prefix tok_identifier
    {
      console.log("Header -> tok_cocoa_prefix tok_identifier");
      yy.g_program.set_namespace("cocoa", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_xsd_namespace tok_literal
    {
      console.log("Header -> tok_xsd_namespace tok_literal");
      yy.g_program.set_namespace("xsd", $2);
    }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_csharp_namespace tok_identifier
   {
     console.log("Header -> tok_csharp_namespace tok_identifier");
     yy.g_program.set_namespace("csharp", $2);
   }
/* TODO(dreiss): Get rid of this once everyone is using the new hotness. */
| tok_delphi_namespace tok_identifier
   {
     console.log("Header -> tok_delphi_namespace tok_identifier");
     yy.g_program.set_namespace("delphi", $2);
   }
    ;

Include:
  tok_include tok_literal
    {
      console.log("Include -> tok_include tok_literal");
      yy.g_program.add_include($2);
    }
    ;

DefinitionList:
  DefinitionList CaptureDocText Definition
    {
      console.log("DefinitionList -> DefinitionList Definition");
      if ($2 !== null && $3 !== null) {
      }
    }
|
    {
      console.log("DefinitionList -> ");
    }
    ;

Definition:
  Const
    {
      console.log("Definition -> Const");
      yy.g_program.add_const($1);
      $$ = 1;
    }
| TypeDefinition
    {
      console.log("Definition -> TypeDefinition");
      yy.g_scope.add_type($1.get_name(), $1);
      $$ = $1;
    }
| Service
    {
      console.log("Definition -> Service");
      yy.g_scope.add_service($1.get_name(), $1);
      yy.g_program.add_service($1);
      $$ = $1;
    }
    ;

TypeDefinition:
  Typedef
    {
      console.log("TypeDefinition -> Typedef");
      yy.g_program.add_typedef($1);
    }
| Enum
    {
      console.log("TypeDefinition -> Enum");
      yy.g_program.add_enum($1);
    }
| Senum
    {
      console.log("TypeDefinition -> Senum");
      yy.g_program.add_typedef($1);
    }
| Struct
    {
      console.log("TypeDefinition -> Struct");
      yy.g_program.add_struct($1);
    }
| Xception
    {
      console.log("TypeDefinition -> Xception");
      yy.g_program.add_xception($1);
    }
    ;

Typedef:
  tok_typedef FieldType tok_identifier
    {
      console.log("TypeDef -> tok_typedef FieldType tok_identifier");
      var td = new t_typedef(yy.g_program, $2, $3);
      $$ = td;
    }
    ;

CommaOrSemicolonOptional:
  ','
    {}
| ';'
    {}
|
    {}
    ;

Enum:
  tok_enum tok_identifier '{' EnumDefList '}'
    {
      console.log("Enum -> tok_enum tok_identifier { EnumDefList }");
      $$ = $4;
      $$.set_name($2);
    }
    ;

EnumDefList:
  EnumDefList EnumDef
    {
      console.log("EnumDefList -> EnumDefList EnumDef");
      $$ = $1;
      $$.append($2);
    }
|
    {
      console.log("EnumDefList -> ");
      $$ = new t_enum(yy.g_program);
    }
    ;

EnumDef:
  CaptureDocText tok_identifier '=' tok_int_constant CommaOrSemicolonOptional
    {
      console.log("EnumDef -> tok_identifier = tok_int_constant");
      $$ = new t_enum_value($2, $4);
    }
|
  CaptureDocText tok_identifier CommaOrSemicolonOptional
    {
      console.log("EnumDef -> tok_identifier");
      $$ = new t_enum_value($2);
    }
    ;

Senum:
  tok_senum tok_identifier '{' SenumDefList '}'
    {
      console.log("Senum -> tok_senum tok_identifier { SenumDefList }");
      $$ = new t_typedef(yy.g_program, $4, $2);
    }
    ;

SenumDefList:
  SenumDefList SenumDef
    {
      console.log("SenumDefList -> SenumDefList SenumDef");
      $$ = $1;
      $$.add_string_enum_val($2);
    }
|
    {
      console.log("SenumDefList -> ");
      $$ = new t_base_type("string", t_base_type.t_base_name.TYPE_STRING);
      $$.set_string_enum(true);
    }
    ;

SenumDef:
  tok_literal CommaOrSemicolonOptional
    {
      console.log("SenumDef -> tok_literal");
      $$ = 1;
    }
    ;

Const:
  tok_const FieldType tok_identifier '=' ConstValue CommaOrSemicolonOptional
    {
      console.log("Const -> tok_const FieldType tok_identifier = ConstValue");
      $$ = new yy.t_const($2, $3, $5);
    }
    ;

ConstValue:
  tok_int_constant
    {
      $$ = new t_const_value();
      $$.set_integer($1);
    }
| tok_dub_constant
    {
      $$ = new t_const_value();
      $$.set_double($1);
    }
| tok_literal
    {
      console.log("ConstValue => tok_literal");
      $$ = new t_const_value($1);
    }
| tok_identifier
    {
      console.log("ConstValue => tok_identifier");
      $$ = new t_const_value();
      $$.set_identifier($1);
    }
| ConstList
    {
      console.log("ConstValue => ConstList");
      $$ = $1;
    }
| ConstMap
    {
      console.log("ConstValue => ConstMap");
      $$ = $1;
    }
    ;

ConstList:
  '[' ConstListContents ']'
    {
      console.log("ConstList => [ ConstListContents ]");
      $$ = $2;
    }
    ;

ConstListContents:
  ConstListContents ConstValue CommaOrSemicolonOptional
    {
      console.log("ConstListContents => ConstListContents ConstValue CommaOrSemicolonOptional");
      $$ = $1;
      $$.add_list($2);
    }
|
    {
      console.log("ConstListContents =>");
      $$ = new t_const_value();
      $$.set_list();
    }
    ;

ConstMap:
  '{' ConstMapContents '}'
    {
      console.log("ConstMap => { ConstMapContents }");
      $$ = $2;
    }
    ;

ConstMapContents:
  ConstMapContents ConstValue ':' ConstValue CommaOrSemicolonOptional
    {
      console.log("ConstMapContents => ConstMapContents ConstValue CommaOrSemicolonOptional");
      $$ = $1;
      $$.add_map($2, $4);
    }
|
    {
      console.log("ConstMapContents =>");
      $$ = new t_const_value();
      $$.set_map();
    }
    ;

StructHead:
  tok_struct
    {
    }
| tok_union
    {
    }
    ;

Struct:
  StructHead tok_identifier XsdAll '{' FieldList '}' TypeAnnotations
    {
      console.log("Struct -> tok_struct tok_identifier { FieldList }");
//      $5.set_xsd_all($3);
      $$ = $5;
      $$.set_name($2);
    }
    ;
    
XsdAll:
  tok_xsd_all
    {
            $$ = true;
    }
|
    {
            $$ = false;
    }
    ;

XsdOptional:
  tok_xsd_optional
    {
            $$ = true;
    }
|
    {
            $$ = false;
    }
    ;

XsdNillable:
  tok_xsd_nillable
    {
            $$ = true;
    }
|
    {
            $$ = false;
    }
    ;

XsdAttributes:
  tok_xsd_attrs '{' FieldList '}'
    {
            $$ = $3;
    }
|
    {
            $$ = null;
    }
    ;

Xception:
  tok_xception tok_identifier '{' FieldList '}'
    {
      console.log("Xception -> tok_xception tok_identifier { FieldList }");
      $4.set_name($2);
      $4.set_xception(true);
      $$ = $4;
    }
    ;

Service:
  tok_service tok_identifier Extends '{' FlagArgs FunctionList UnflagArgs '}'
    {
      console.log("Service -> tok_service tok_identifier { FunctionList }");
      $$ = $6;
      $$.set_name($2);
      $$.set_extends($3);
    }
    ;

FlagArgs:
    {
      console.log("FlagArgs");
    }
    ;

UnflagArgs:
    {
      console.log("UnflagArgs");
    }
    ;

Extends:
  tok_extends tok_identifier
    {
      console.log("Extends -> tok_extends tok_identifier");
    }
|
    {
    }
    ;

FunctionList:
  FunctionList Function
    {
      console.log("FunctionList -> FunctionList Function");
      $$ = $1;
      $1.add_function($2);
    }
|
    {
      console.log("FunctionList -> ");
      $$ = new t_service(yy.g_program);
    }
    ;

Function:
  Oneway FunctionType tok_identifier '(' FieldList ')' Throws CommaOrSemicolonOptional
    {
            $5.set_name($3 + "_args");
            $$ = new t_function($2, $3, $5, $7, $1);
    }
|
  FunctionType tok_identifier '(' FieldList ')' Throws CommaOrSemicolonOptional
    ;

Oneway:
  tok_oneway
    {
      console.log("Oneway");
      $$ = true;
    }
    ;

Throws:
  tok_throws '(' FieldList ')'
    {
      console.log("Throws -> tok_throws ( FieldList )");
    }
|
    {
    }
    ;

FieldList:
  FieldList Field
    {
      console.log("FieldList -> FieldList , Field");
      $$ = $1;
      $$.append($2);
    }
|
    {
      console.log("FieldList -> ");
      $$ = new t_struct(yy.g_program);
    }
    ;

Field:
  CaptureDocText FieldIdentifier FieldRequiredness FieldType tok_identifier FieldValue XsdOptional XsdNillable XsdAttributes TypeAnnotations CommaOrSemicolonOptional
    {
      console.log("tok_int_constant : Field -> FieldType tok_identifier");
      console.log("field value literal " + $6);
      console.log("yy.lval: "+yy.lval);
      $$ = new t_field($4, $5, $2.value);
      $$.set_req($3);
    }
    ;

FieldIdentifier:
  tok_int_constant ':'
    {
            $$.value = $1;
    }
|
    {
            $$.value = $1;
    }
    ;

FieldRequiredness:
  tok_required
    {
    }
| tok_optional
    {
    }
|
    {
    }
    ;

FieldValue:
  '=' ConstValue
    {
    console.log("Field value with const value " + $2);
    $$ = $2;
    }
|
    {
    }
    ;

FunctionType:
  FieldType
    {
      console.log("FunctionType -> FieldType");
      $$ = $1;
    }
| tok_void
    {
      console.log("FunctionType -> tok_void");
    }
    ;

FieldType:
  tok_identifier
    {
      console.log("FieldType -> tok_identifier");
    }
| BaseType
    {
      console.log("FieldType -> BaseType");
      $$ = $1;
    }
| ContainerType
    {
      console.log("FieldType -> ContainerType");
      $$ = $1;
    }
    ;

BaseType: SimpleBaseType TypeAnnotations
    {
      console.log("BaseType -> SimpleBaseType TypeAnnotations");
      if ($2 !== null) {
          $$ = new t_base_type($1);
      } else {
          $$ = $1;
      }
    }
    ;

SimpleBaseType:
  tok_string
    {
      console.log("BaseType -> tok_string");
    }
| tok_binary
    {
      console.log("BaseType -> tok_binary");
    }
| tok_slist
    {
      console.log("BaseType -> tok_slist");
    }
| tok_bool
    {
      console.log("BaseType -> tok_bool");
    }
| tok_byte
    {
      console.log("BaseType -> tok_byte");
    }
| tok_i16
    {
      console.log("BaseType -> tok_i16");
    }
| tok_i32
    {
      console.log("BaseType -> tok_i32");
    }
| tok_i64
    {
      console.log("BaseType -> tok_i64");
    }
| tok_double
    {
      console.log("BaseType -> tok_double");
    }
    ;

ContainerType: SimpleContainerType TypeAnnotations
    {
      console.log("ContainerType -> SimpleContainerType TypeAnnotations");
      $$ = $1;
    }
    ;

SimpleContainerType:
  MapType
    {
      console.log("SimpleContainerType -> MapType");
      $$ = $1;
    }
| SetType
    {
      console.log("SimpleContainerType -> SetType");
    }
| ListType
    {
      console.log("SimpleContainerType -> ListType");
      $$ = $1;
    }
    ;

MapType:
  tok_map CppType '<' FieldType ',' FieldType '>'
    {
      console.log("MapType -> tok_map <FieldType, FieldType>");
      $$ = new t_map($4, $6);
    }
    ;

SetType:
  tok_set CppType '<' FieldType '>'
    {
      console.log("SetType -> tok_set<FieldType>");
    }
    ;

ListType:
  tok_list '<' FieldType '>' CppType
    {
      console.log("ListType -> tok_list<FieldType>");
      $$ = new t_list($3);
    }
    ;

CppType:
  tok_cpp_type tok_literal
    {
            $$ = $2;
    }
|
    {
            $$ = null;
    }
    ;

TypeAnnotations:
  '(' TypeAnnotationList ')'
    {
      console.log("TypeAnnotations -> ( TypeAnnotationList )");
    }
|
    {
    }
    ;

TypeAnnotationList:
  TypeAnnotationList TypeAnnotation
    {
      console.log("TypeAnnotationList -> TypeAnnotationList , TypeAnnotation");
    }
|
    {
    }
    ;

TypeAnnotation:
  tok_identifier '=' tok_literal CommaOrSemicolonOptional
    {
      console.log("TypeAnnotation -> tok_identifier = tok_literal");
    }
    ;

