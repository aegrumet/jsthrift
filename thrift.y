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
      util.debug_log("Program -> Headers DefinitionList");
    }
    ;


/*  utility   */


CaptureDocText:
    {
      util.debug_log("CaptureDocText");
      $$ = g_doctext;
      g_doctext = null;
    }
    ;

DestroyDocText:
    {
      util.debug_log("DestroyDocText");
    }
    ;


/*  headers   */


HeaderList:
  HeaderList Header DestroyDocText 
    {
      util.debug_log("HeaderList -> HeaderList Header");
    }
| DestroyDocText 
    {
      util.debug_log("HeaderList -> ");
    }
  ;

Header:
  Include
    {
      util.debug_log("Header -> Include");
    }
| tok_namespace tok_identifier tok_identifier
    {
      util.debug_log("Header -> tok_namespace tok_identifier tok_identifier");
    }
| tok_namespace '*' tok_identifier
    {
      util.debug_log("Header -> tok_namespace * tok_identifier");
    }
| tok_cpp_namespace tok_identifier
    {
      util.debug_log("Header -> tok_cpp_namespace tok_identifier");
    }
| tok_cpp_include tok_literal
    {
      util.debug_log("Header -> tok_cpp_include tok_literal");
    }
| tok_php_namespace tok_identifier
    {
      util.debug_log("Header -> tok_php_namespace tok_identifier");
    }
| tok_py_module tok_identifier
    {
      util.debug_log("Header -> tok_py_module tok_identifier");
    }
| tok_perl_package tok_identifier
    {
      util.debug_log("Header -> tok_perl_namespace tok_identifier");
    }
| tok_ruby_namespace tok_identifier
    {
      util.debug_log("Header -> tok_ruby_namespace tok_identifier");
    }
| tok_smalltalk_category tok_st_identifier
    {
      util.debug_log("Header -> tok_smalltalk_category tok_st_identifier");
    }
| tok_smalltalk_prefix tok_identifier
    {
      util.debug_log("Header -> tok_smalltalk_prefix tok_identifier");
    }
| tok_java_package tok_identifier
    {
      util.debug_log("Header -> tok_java_package tok_identifier");
    }
| tok_cocoa_prefix tok_identifier
    {
      util.debug_log("Header -> tok_cocoa_prefix tok_identifier");
    }
| tok_xsd_namespace tok_literal
    {
      util.debug_log("Header -> tok_xsd_namespace tok_literal");
    }
| tok_csharp_namespace tok_identifier
    {
     util.debug_log("Header -> tok_csharp_namespace tok_identifier");
    }
| tok_delphi_namespace tok_identifier
    {
     util.debug_log("Header -> tok_delphi_namespace tok_identifier");
    }
  ;

Include:
  tok_include tok_literal
    {
      util.debug_log("Include -> tok_include tok_literal");
    }
  ;


/*  definitions   */


DefinitionList:
  DefinitionList CaptureDocText Definition
    {
      util.debug_log("DefinitionList -> DefinitionList Definition");
    }
|
    {
      util.debug_log("DefinitionList -> ");
    }
  ;

Definition:
  Const
    {
      util.debug_log("Definition -> Const");
    }
| TypeDefinition
    {
      util.debug_log("Definition -> TypeDefinition");
    }
| Service
    {
      util.debug_log("Definition -> Service");
    }
  ;


/*  definition types   */

Const:
  tok_const FieldType tok_identifier '=' ConstValue CommaOrSemicolonOptional
    {
      util.debug_log("Const -> tok_const FieldType tok_identifier = ConstValue");
    }
  ;

ConstValue:
  tok_int_constant
    {
      util.debug_log("ConstValue -> tok_int_constant");
    }
| tok_dub_constant
    {
      util.debug_log("ConstValue -> tok_dub_constant");
    }
| tok_literal
    {
      util.debug_log("ConstValue -> tok_literal");
    }
| tok_identifier
    {
      util.debug_log("ConstValue -> tok_identifier");
    }
| ConstList
    {
      util.debug_log("ConstValue -> ConstList");
    }
| ConstMap
    {
      util.debug_log("ConstValue -> ConstMap");
    }
  ;

ConstList:
  '[' ConstListContents ']'
    {
      util.debug_log("ConstList -> [ ConstListContents ]");
    }
  ;

ConstListContents:
  ConstListContents ConstValue CommaOrSemicolonOptional
    {
      util.debug_log("ConstListContents -> ConstListContents ConstValue CommaOrSemicolonOptional");
    }
|
    {
      util.debug_log("ConstListContents ->");
    }
  ;

ConstMap:
  '{' ConstMapContents '}'
    {
      util.debug_log("ConstMap -> { ConstMapContents }");
    }
  ;

ConstMapContents:
  ConstMapContents ConstValue ':' ConstValue CommaOrSemicolonOptional
    {
      util.debug_log("ConstMapContents -> ConstMapContents ConstValue CommaOrSemicolonOptional");
    }
|
    {
      util.debug_log("ConstMapContents ->");
    }
  ;


TypeDefinition:
  Typedef
    {
      util.debug_log("TypeDefinition -> Typedef");
    }
| Enum
    {
      util.debug_log("TypeDefinition -> Enum");
    }
| Senum
    {
      util.debug_log("TypeDefinition -> Senum");
    }
| Struct
    {
      util.debug_log("TypeDefinition -> Struct");
    }
| Xception
    {
      util.debug_log("TypeDefinition -> Xception");
    }
  ;

Typedef:
  tok_typedef FieldType tok_identifier
    {
      util.debug_log("TypeDef -> tok_typedef FieldType tok_identifier");
    }
  ;

Enum:
  tok_enum tok_identifier '{' EnumDefList '}'
    {
      util.debug_log("Enum -> tok_enum tok_identifier { EnumDefList }");
    }
  ;

EnumDefList:
  EnumDefList EnumDef
    {
      util.debug_log("EnumDefList -> EnumDefList EnumDef");
    }
|
    {
      util.debug_log("EnumDefList -> ");
    }
  ;

EnumDef:
  CaptureDocText tok_identifier '=' tok_int_constant CommaOrSemicolonOptional
    {
      util.debug_log("EnumDef -> tok_identifier = tok_int_constant");
    }
|
  CaptureDocText tok_identifier CommaOrSemicolonOptional
    {
      util.debug_log("EnumDef -> tok_identifier");
    }
  ;

Senum:
  tok_senum tok_identifier '{' SenumDefList '}'
    {
      util.debug_log("Senum -> tok_senum tok_identifier { SenumDefList }");
    }
  ;

SenumDefList:
  SenumDefList SenumDef
    {
      util.debug_log("SenumDefList -> SenumDefList SenumDef");
    }
|
    {
      util.debug_log("SenumDefList -> ");
    }
  ;

SenumDef:
  tok_literal CommaOrSemicolonOptional
    {
      util.debug_log("SenumDef -> tok_literal");
    }
  ;


StructHead:
  tok_struct
    {
      util.debug_log("StructHead -> tok_struct");
    }
| tok_union
    {
      util.debug_log("StructHead -> tok_union");
    }
  ;

Struct:
  StructHead tok_identifier XsdAll '{' FieldList '}' TypeAnnotations
    {
      util.debug_log("Struct -> tok_struct tok_identifier { FieldList }");
    }
  ;
    
Xception:
  tok_xception tok_identifier '{' FieldList '}'
    {
      util.debug_log("Xception -> tok_xception tok_identifier { FieldList }");
    }
  ;


Service:
  tok_service tok_identifier Extends '{' FunctionList '}'
    {
      util.debug_log("Service -> tok_service tok_identifier { FunctionList }");
    }
  ;

Extends:
  tok_extends tok_identifier
    {
      util.debug_log("Extends -> tok_extends tok_identifier");
    }
|
    {
    }
  ;

FunctionList:
  FunctionList Function
    {
      util.debug_log("FunctionList -> FunctionList Function");
    }
|
    {
      util.debug_log("FunctionList -> ");
    }
  ;

Function:
  CaptureDocText Oneway FunctionType tok_identifier '(' FieldList ')' Throws CommaOrSemicolonOptional
    {
     util.debug_log("Function -> FunctionType tok_identifier (FieldList) ");
    }
  ;

Oneway:
  tok_oneway
    {
      util.debug_log("Oneway -> tok_oneway");
    }
|
    {
    }
  ;

Throws:
  tok_throws '(' FieldList ')'
    {
      util.debug_log("Throws -> tok_throws ( FieldList )");
    }
|
    {
    }
  ;

FieldList:
  FieldList Field
    {
      util.debug_log("FieldList -> FieldList Field");
    }
|
    {
      util.debug_log("FieldList -> ");
    }
  ;

Field:
  CaptureDocText FieldIdentifier FieldRequiredness FieldType tok_identifier FieldValue XsdOptional XsdNillable XsdAttributes TypeAnnotations CommaOrSemicolonOptional
    {
      util.debug_log("Field -> FieldIdentifier FieldRequiredness FieldType tok_identifier FieldValue XsdOptional XsdNillable XsdAttributes TypeAnnotations CommaOrSemicolonOptional");
    }
  ;

FieldIdentifier:
  tok_int_constant ':'
    {
      util.debug_log("FieldIdentifier -> tok_int_constant");
    }
|
    {
      util.debug_log("FieldIdentifier -> ");
    }
  ;

FieldRequiredness:
  tok_required
    {
      util.debug_log("FieldRequiredness -> tok_required");
    }
| tok_optional
    {
      util.debug_log("FieldRequiredness -> tok_optional");
    }
|
    {
    }
  ;

FieldValue:
  '=' ConstValue
    {
    }
|
    {
    }
  ;

FunctionType:
  FieldType
    {
      util.debug_log("FunctionType -> FieldType");
    }
| tok_void
    {
      util.debug_log("FunctionType -> tok_void");
    }
  ;

FieldType:
  tok_identifier
    {
      util.debug_log("FieldType -> tok_identifier");
    }
| BaseType
    {
      util.debug_log("FieldType -> BaseType");
    }
| ContainerType
    {
      util.debug_log("FieldType -> ContainerType");
    }
  ;

BaseType:
  SimpleBaseType TypeAnnotations
    {
      util.debug_log("BaseType -> SimpleBaseType TypeAnnotations");
    }
  ;

SimpleBaseType:
  tok_string
    {
      util.debug_log("BaseType -> tok_string");
    }
| tok_binary
    {
      util.debug_log("BaseType -> tok_binary");
    }
| tok_slist
    {
      util.debug_log("BaseType -> tok_slist");
    }
| tok_bool
    {
      util.debug_log("BaseType -> tok_bool");
    }
| tok_byte
    {
      util.debug_log("BaseType -> tok_byte");
    }
| tok_i16
    {
      util.debug_log("BaseType -> tok_i16");
    }
| tok_i32
    {
      util.debug_log("BaseType -> tok_i32");
    }
    }
| tok_i64
    {
      util.debug_log("BaseType -> tok_i64");
    }
| tok_double
    {
      util.debug_log("BaseType -> tok_double");
    }
  ;

ContainerType:
  SimpleContainerType TypeAnnotations
    {
      util.debug_log("ContainerType -> SimpleContainerType TypeAnnotations");
    }
  ;

SimpleContainerType:
  MapType
    {
      util.debug_log("SimpleContainerType -> MapType");
    }
| SetType
    {
      util.debug_log("SimpleContainerType -> SetType");
    }
| ListType
    {
      util.debug_log("SimpleContainerType -> ListType");
    }
  ;

MapType:
  tok_map CppType '<' FieldType ',' FieldType '>'
    {
      util.debug_log("MapType -> tok_map <FieldType, FieldType>");
    }
  ;

SetType:
  tok_set CppType '<' FieldType '>'
    {
      util.debug_log("SetType -> tok_set<FieldType>");
    }
  ;

ListType:
  tok_list '<' FieldType '>' CppType
    {
      util.debug_log("ListType -> tok_list<FieldType>");
    }
  ;

CppType:
  tok_cpp_type tok_literal
    {
    }
|
    {
    }
  ;

TypeAnnotations:
  '(' TypeAnnotationList ')'
    {
      util.debug_log("TypeAnnotations -> ( TypeAnnotationList )");
    }
|
    {
    }
  ;

TypeAnnotationList:
  TypeAnnotationList TypeAnnotation
    {
      util.debug_log("TypeAnnotationList -> TypeAnnotationList , TypeAnnotation");
    }
|
    {
    }
  ;

TypeAnnotation:
  tok_identifier '=' tok_literal CommaOrSemicolonOptional
    {
      util.debug_log("TypeAnnotation -> tok_identifier = tok_literal");
    }
  ;

/*  misc   */

CommaOrSemicolonOptional:
  ','
    {}
| ';'
    {}
|
    {}
  ;

XsdAll:
  tok_xsd_all
|
  { }
  ;

XsdOptional:
  tok_xsd_optional
|
  { }
  ;

XsdNillable:
  tok_xsd_nillable
|
  { }
  ;

XsdAttributes:
  tok_xsd_attrs '{' FieldList '}'
|
  { }
  ;

