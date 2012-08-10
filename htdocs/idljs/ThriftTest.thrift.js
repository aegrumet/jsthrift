thriftTest = '/*\n'+
' * Licensed to the Apache Software Foundation (ASF) under one\n'+
' * or more contributor license agreements. See the NOTICE file\n'+
' * distributed with this work for additional information\n'+
' * regarding copyright ownership. The ASF licenses this file\n'+
' * to you under the Apache License, Version 2.0 (the\n'+
' * "License"); you may not use this file except in compliance\n'+
' * with the License. You may obtain a copy of the License at\n'+
' *\n'+
' *   http://www.apache.org/licenses/LICENSE-2.0\n'+
' *\n'+
' * Unless required by applicable law or agreed to in writing,\n'+
' * software distributed under the License is distributed on an\n'+
' * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY\n'+
' * KIND, either express or implied. See the License for the\n'+
' * specific language governing permissions and limitations\n'+
' * under the License.\n'+
' *\n'+
' * Contains some contributions under the Thrift Software License.\n'+
' * Please see doc/old-thrift-license.txt in the Thrift distribution for\n'+
' * details.\n'+
' */\n'+
'\n'+
'namespace c_glib TTest\n'+
'namespace java thrift.test\n'+
'namespace cpp thrift.test\n'+
'namespace rb Thrift.Test\n'+
'namespace perl ThriftTest\n'+
'namespace csharp Thrift.Test\n'+
'namespace js ThriftTest\n'+
'namespace st ThriftTest\n'+
'namespace py ThriftTest\n'+
'namespace py.twisted ThriftTest\n'+
'namespace go ThriftTest\n'+
'namespace php ThriftTest\n'+
'namespace delphi Thrift.Test\n'+
'namespace cocoa ThriftTest\n'+
'namespace * thrift.test\n'+
'\n'+
'/**\n'+
' * Docstring!\n'+
' */\n'+
'enum Numberz\n'+
'{\n'+
'  ONE = 1,\n'+
'  TWO,\n'+
'  THREE,\n'+
'  FIVE = 5,\n'+
'  SIX,\n'+
'  EIGHT = 8\n'+
'}\n'+
'\n'+
'const Numberz myNumberz = Numberz.ONE;\n'+
'// the following is expected to fail:\n'+
'// const Numberz urNumberz = ONE;\n'+
'\n'+
'typedef i64 UserId\n'+
'\n'+
'struct Bonk\n'+
'{\n'+
'  1: string message,\n'+
'  2: i32 type\n'+
'}\n'+
'\n'+
'struct Bools {\n'+
'  1: bool im_true,\n'+
'  2: bool im_false,\n'+
'}\n'+
'\n'+
'struct Xtruct\n'+
'{\n'+
'  1:  string string_thing,\n'+
'  4:  byte   byte_thing,\n'+
'  9:  i32    i32_thing,\n'+
'  11: i64    i64_thing\n'+
'}\n'+
'\n'+
'struct Xtruct2\n'+
'{\n'+
'  1: byte   byte_thing,\n'+
'  2: Xtruct struct_thing,\n'+
'  3: i32    i32_thing\n'+
'}\n'+
'\n'+
'struct Xtruct3\n'+
'{\n'+
'  1:  string string_thing,\n'+
'  4:  i32    changed,\n'+
'  9:  i32    i32_thing,\n'+
'  11: i64    i64_thing\n'+
'}\n'+
'\n'+
'\n'+
'struct Insanity\n'+
'{\n'+
'  1: map<Numberz, UserId> userMap,\n'+
'  2: list<Xtruct> xtructs\n'+
'}\n'+
'\n'+
'struct CrazyNesting {\n'+
'  1: string string_field,\n'+
'  2: optional set<Insanity> set_field,\n'+
'  3: required list< map<set<i32>,map<i32,set<list<map<Insanity,string>>>>>> list_field,\n'+
'  4: binary binary_field\n'+
'}\n'+
'\n'+
'exception Xception {\n'+
'  1: i32 errorCode,\n'+
'  2: string message\n'+
'}\n'+
'\n'+
'exception Xception2 {\n'+
'  1: i32 errorCode,\n'+
'  2: Xtruct struct_thing\n'+
'}\n'+
'\n'+
'struct EmptyStruct {}\n'+
'\n'+
'struct OneField {\n'+
'  1: EmptyStruct field\n'+
'}\n'+
'\n'+
'service ThriftTest\n'+
'{\n'+
'  /**\n'+
'   * Prints "testVoid()" and returns nothing.\n'+
'   */\n'+
'  void         testVoid(),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testString("%s")\' with thing as \'%s\'\n'+
'   * @param string thing - the string to print\n'+
'   * @return string - returns the string \'thing\'\n'+
'   */\n'+
'  string       testString(1: string thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testByte("%d")\' with thing as \'%d\'\n'+
'   * @param byte thing - the byte to print\n'+
'   * @return byte - returns the byte \'thing\'\n'+
'   */\n'+
'  byte         testByte(1: byte thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testI32("%d")\' with thing as \'%d\'\n'+
'   * @param i32 thing - the i32 to print\n'+
'   * @return i32 - returns the i32 \'thing\'\n'+
'   */\n'+
'  i32          testI32(1: i32 thing),\n'+
' \n'+
'  /**\n'+
'   * Prints \'testI64("%d")\' with thing as \'%d\'\n'+
'   * @param i64 thing - the i64 to print\n'+
'   * @return i64 - returns the i64 \'thing\'\n'+
'   */\n'+
'  i64          testI64(1: i64 thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testDouble("%f")\' with thing as \'%f\'\n'+
'   * @param double thing - the double to print\n'+
'   * @return double - returns the double \'thing\'\n'+
'   */\n'+
'  double       testDouble(1: double thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testStruct("{%s}")\' where thing has been formatted into a string of comma seperated values\n'+
'   * @param Xtruct thing - the Xtruct to print\n'+
'   * @return Xtruct - returns the Xtruct \'thing\'\n'+
'   */\n'+
'  Xtruct       testStruct(1: Xtruct thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testNest("{%s}")\' where thing has been formatted into a string of the nested struct\n'+
'   * @param Xtruct2 thing - the Xtruct2 to print\n'+
'   * @return Xtruct2 - returns the Xtruct2 \'thing\'\n'+
'   */\n'+
'  Xtruct2      testNest(1: Xtruct2 thing),\n'+
' \n'+
'  /**\n'+
'   * Prints \'testMap("{%s")\' where thing has been formatted into a string of  \'key => value\' pairs\n'+
'   *  seperated by commas and new lines\n'+
'   * @param map<i32,i32> thing - the map<i32,i32> to print\n'+
'   * @return map<i32,i32> - returns the map<i32,i32> \'thing\'\n'+
'   */\n'+
'  map<i32,i32> testMap(1: map<i32,i32> thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testStringMap("{%s}")\' where thing has been formatted into a string of  \'key => value\' pairs\n'+
'   *  seperated by commas and new lines\n'+
'   * @param map<string,string> thing - the map<string,string> to print\n'+
'   * @return map<string,string> - returns the map<string,string> \'thing\'\n'+
'   */\n'+
'  map<string,string> testStringMap(1: map<string,string> thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testSet("{%s}")\' where thing has been formatted into a string of  values\n'+
'   *  seperated by commas and new lines\n'+
'   * @param set<i32> thing - the set<i32> to print\n'+
'   * @return set<i32> - returns the set<i32> \'thing\'\n'+
'   */\n'+
'  set<i32>     testSet(1: set<i32> thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testList("{%s}")\' where thing has been formatted into a string of  values\n'+
'   *  seperated by commas and new lines\n'+
'   * @param list<i32> thing - the list<i32> to print\n'+
'   * @return list<i32> - returns the list<i32> \'thing\'\n'+
'   */\n'+
'  list<i32>    testList(1: list<i32> thing),\n'+
'  \n'+
'  /**\n'+
'   * Prints \'testEnum("%d")\' where thing has been formatted into it\'s numeric value\n'+
'   * @param Numberz thing - the Numberz to print\n'+
'   * @return Numberz - returns the Numberz \'thing\'\n'+
'   */\n'+
'  Numberz      testEnum(1: Numberz thing),\n'+
'\n'+
'  /**\n'+
'   * Prints \'testTypedef("%d")\' with thing as \'%d\'\n'+
'   * @param UserId thing - the UserId to print\n'+
'   * @return UserId - returns the UserId \'thing\'\n'+
'   */\n'+
'  UserId       testTypedef(1: UserId thing),\n'+
'\n'+
'  /**\n'+
'   * Prints \'testMapMap("%d")\' with hello as \'%d\'\n'+
'   * @param i32 hello - the i32 to print\n'+
'   * @return map<i32,map<i32,i32>> - returns a dictionary with these values:\n'+
'   *   {-4 => {-4 => -4, -3 => -3, -2 => -2, -1 => -1, }, 4 => {1 => 1, 2 => 2, 3 => 3, 4 => 4, }, }\n'+
'   */\n'+
'  map<i32,map<i32,i32>> testMapMap(1: i32 hello),\n'+
'\n'+
'  /**\n'+
'   * So you think you\'ve got this all worked, out eh?\n'+
'   *\n'+
'   * Creates a the returned map with these values and prints it out:\n'+
'   *   { 1 => { 2 => argument, \n'+
'   *            3 => argument, \n'+
'   *          },\n'+
'   *     2 => { 6 => <empty Insanity struct>, },\n'+
'   *   }\n'+
'   * @return map<UserId, map<Numberz,Insanity>> - a map with the above values \n'+
'   */\n'+
'  map<UserId, map<Numberz,Insanity>> testInsanity(1: Insanity argument),\n'+
'\n'+
'  /**\n'+
'   * Prints \'testMulti()\'\n'+
'   * @param byte arg0 - \n'+
'   * @param i32 arg1 - \n'+
'   * @param i64 arg2 - \n'+
'   * @param map<i16, string> arg3 - \n'+
'   * @param Numberz arg4 - \n'+
'   * @param UserId arg5 - \n'+
'   * @return Xtruct - returns an Xtruct with string_thing = "Hello2, byte_thing = arg0, i32_thing = arg1\n'+
'   *    and i64_thing = arg2\n'+
'   */\n'+
'  Xtruct testMulti(1: byte arg0, 2: i32 arg1, 3: i64 arg2, 4: map<i16, string> arg3, 5: Numberz arg4, 6: UserId arg5),\n'+
'\n'+
'  /**\n'+
'   * Print \'testException(%s)\' with arg as \'%s\'\n'+
'   * @param string arg - a string indication what type of exception to throw\n'+
'   * if arg == "Xception" throw Xception with errorCode = 1001 and message = arg\n'+
'   * elsen if arg == "TException" throw TException\n'+
'   * else do not throw anything\n'+
'   */\n'+
'  void testException(1: string arg) throws(1: Xception err1),\n'+
'\n'+
'  /**\n'+
'   * Print \'testMultiException(%s, %s)\' with arg0 as \'%s\' and arg1 as \'%s\'\n'+
'   * @param string arg - a string indication what type of exception to throw\n'+
'   * if arg0 == "Xception" throw Xception with errorCode = 1001 and message = "This is an Xception"\n'+
'   * elsen if arg0 == "Xception2" throw Xception2 with errorCode = 2002 and message = "This is an Xception2"\n'+
'   * else do not throw anything\n'+
'   * @return Xtruct - an Xtruct with string_thing = arg1\n'+
'   */\n'+
'  Xtruct testMultiException(1: string arg0, 2: string arg1) throws(1: Xception err1, 2: Xception2 err2)\n'+
'\n'+
'  /**\n'+
'   * Print \'testOneway(%d): Sleeping...\' with secondsToSleep as \'%d\'\n'+
'   * sleep \'secondsToSleep\'\n'+
'   * Print \'testOneway(%d): done sleeping!\' with secondsToSleep as \'%d\'\n'+
'   * @param i32 secondsToSleep - the number of seconds to sleep\n'+
'   */\n'+
'  oneway void testOneway(1:i32 secondsToSleep)\n'+
'}\n'+
'\n'+
'service SecondService\n'+
'{\n'+
'  void blahBlah()\n'+
'}\n'+
'\n'+
'struct VersioningTestV1 {\n'+
'       1: i32 begin_in_both,\n'+
'       3: string old_string,\n'+
'       12: i32 end_in_both\n'+
'}\n'+
'\n'+
'struct VersioningTestV2 {\n'+
'       1: i32 begin_in_both,\n'+
'\n'+
'       2: i32 newint,\n'+
'       3: byte newbyte,\n'+
'       4: i16 newshort,\n'+
'       5: i64 newlong,\n'+
'       6: double newdouble\n'+
'       7: Bonk newstruct,\n'+
'       8: list<i32> newlist,\n'+
'       9: set<i32> newset,\n'+
'       10: map<i32, i32> newmap,\n'+
'       11: string newstring,\n'+
'       12: i32 end_in_both\n'+
'}\n'+
'\n'+
'struct ListTypeVersioningV1 {\n'+
'       1: list<i32> myints;\n'+
'       2: string hello;\n'+
'}\n'+
'\n'+
'struct ListTypeVersioningV2 {\n'+
'       1: list<string> strings;\n'+
'       2: string hello;\n'+
'}\n'+
'\n'+
'struct GuessProtocolStruct {\n'+
'  7: map<string,string> map_field,\n'+
'}\n'+
'\n'+
'struct LargeDeltas {\n'+
'  1: Bools b1,\n'+
'  10: Bools b10,\n'+
'  100: Bools b100,\n'+
'  500: bool check_true,\n'+
'  1000: Bools b1000,\n'+
'  1500: bool check_false,\n'+
'  2000: VersioningTestV2 vertwo2000,\n'+
'  2500: set<string> a_set2500,\n'+
'  3000: VersioningTestV2 vertwo3000,\n'+
'  4000: list<i32> big_numbers\n'+
'}\n'+
'\n'+
'struct NestedListsI32x2 {\n'+
'  1: list<list<i32>> integerlist\n'+
'}\n'+
'struct NestedListsI32x3 {\n'+
'  1: list<list<list<i32>>> integerlist\n'+
'}\n'+
'struct NestedMixedx2 {\n'+
'  1: list<set<i32>> int_set_list\n'+
'  2: map<i32,set<string>> map_int_strset\n'+
'  3: list<map<i32,set<string>>> map_int_strset_list\n'+
'}\n'+
'struct ListBonks {\n'+
'  1: list<Bonk> bonk\n'+
'}\n'+
'struct NestedListsBonk {\n'+
'  1: list<list<list<Bonk>>> bonk\n'+
'}\n'+
'\n'+
'struct BoolTest {\n'+
'  1: optional bool b = true;\n'+
'  2: optional string s = "true";\n'+
'}\n'+
'\n'+
'struct StructA {\n'+
'  1: required string s;\n'+
'}\n'+
'\n'+
'struct StructB {\n'+
'  1: optional StructA aa;\n'+
'  2: required StructA ab;\n'+
'}\n'+
'';
