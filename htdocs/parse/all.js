// UTIL

util = {};
util.implement = function(fn, obj, overwrite) {
    var proto = fn.prototype;
    for (var k in obj) {
	if (!proto.hasOwnProperty(k) || overwrite) {
	    proto[k] = obj[k];
	    continue;
	}
    }
};

// T_CONST_VALUE

t_const_value = function(val) {
    this._val = null;
    this._valType = null;
    this._enum = null;
    if (arguments.length) {
	if (typeof(val) == "number") { //check for INT
	    this.set_integer(val);
	} else if (typeof(val) == "string") {
	    this.set_string(val);
	}
    }
};
t_const_value.prototype.t_const_value_type = {
    CV_INTEGER    : 1,
    CV_DOUBLE     : 2,
    CV_STRING     : 3,
    CV_MAP        : 4,
    CV_LIST       : 5,
    CV_IDENTIFIER : 6
};
t_const_value.prototype.set_integer = function(val) {
    this._valType = this.t_const_value_type.CV_INTEGER;
    this._val = val;
};
t_const_value.prototype.get_integer = function() {
    return this._val;
};
t_const_value.prototype.set_string = function(val) {
    this._valType = this.t_const_value_type.CV_STRING;
    this._val = val;
};
t_const_value.get_string = function() {
    return this._val;
};
t_const_value.prototype.set_double = function(val) {
    this._valType = this.t_const_value_type.CV_DOUBLE;
    this._val = val;
};
t_const_value.prototype.get_double = function() {
    return this._val;
};
t_const_value.prototype.set_map = function() {
    this._valType = this.t_const_value_type.CV_MAP;
    this._val = {};
};
t_const_value.prototype.add_map = function(key, val) {
    this._val[key] = val; //NB only works for simple keys
};
t_const_value.prototype.get_map = function() {
    return this._val;
};
t_const_value.prototype.set_list = function() {
    this._valType = this.t_const_value_type.CV_LIST;
    this._val = [];
};
t_const_value.prototype.add_list = function(val) {
    this._val.push(val);
};
t_const_value.prototype.get_list = function() {
    return this._val;
};
t_const_value.prototype.set_identifier = function(val) {
    this._valType = this.t_const_value_type.CV_IDENTIFIER;
    this._val = val;
};
t_const_value.prototype.get_identifier = function() {
    return this._val;
};
t_const_value.prototype.get_identifier_name = function() {
    //STUB
};
t_const_value.prototype.get_identifier_with_parent = function() {
    //STUB
};
t_const_value.prototype.set_enum = function(tenum) {
    this._enum = tenum;
};
t_const_value.prototype.get_type = function() {
    return this._valType;
};

// T_DOC

t_doc = function() {
    this._doc = null;
    this._has_doc = false;
};
t_doc.prototype.set_doc = function(doc) {
    this._doc = doc;
    this._has_doc = true;
};
t_doc.prototype.get_doc = function() {
    return this._doc;
};
t_doc.prototype.has_doc = function() {
    return this._has_doc;
};

// T_SCOPE

t_scope = function() {
    this._types = {};
    this._constants = {};
    this._services = {};
};
t_scope.prototype.add_type = function(name, type) {
    this._types[name] = type;
};
t_scope.prototype.get_type = function(name) {
    return this._types[name];
};
t_scope.prototype.add_service = function(name, service) {
    this._services[name] = service;
};
t_scope.prototype.get_service = function(name) {
    return this._services[name];
};
t_scope.prototype.add_constant = function(name, constant) {
    this._constants[name] = constant;
};
t_scope.prototype.get_constant = function(name) {
    return this._constants[name];
};
t_scope.prototype.print = function() {
    console.log(this);
};
t_scope.prototype.resolve_const_value = function(const_val, ttype) {
    //STUB
};

// T_PROGRAM

t_program = function(path, name) {
    this._path = path;
    this._name = name;
    this._out_path = null;
    this._out_path_is_absolute = false;
    this._namespace = null;
    this._includes = [];
    this._include_prefix = null;
    this._scope = new t_scope();
    this._typedefs = [];
    this._enums = [];
    this._consts = [];
    this._objects = [];
    this._structs = [];
    this._xceptions = [];
    this._services = [];
    this._namespaces = [];
    this._cpp_includes = [];
    this._c_includes = [];
};
t_program.prototype.get_path = function() {
    return this._path;
};
t_program.prototype.get_out_path = function() {
    return this._out_path;
};
t_program.prototype.is_out_path_absolute = function() {
    return this._is_out_path_absolute;
};
t_program.prototype.get_name = function() {
    return this._name;
};
t_program.prototype.get_namespace = function() {
    return this._namespace;
};
t_program.prototype.get_include_prefix = function() {
    return this._include_prefix;
};
t_program.prototype.get_typedefs = function() {
    return this._typedefs;
};
t_program.prototype.get_enums = function() {
    return this._enums;
};
t_program.prototype.get_consts = function() {
    return this._consts;
};
t_program.prototype.get_structs = function() {
    return this._structs;
};
t_program.prototype.get_xceptions = function() {
    return this._xceptions;
};
t_program.prototype.get_objects = function() {
    return this._objects;
};
t_program.prototype.get_services = function() {
    return this._services;
};
t_program.prototype.add_typedef = function(td) {
    this._typedefs.push(td);
};
t_program.prototype.add_enum = function(te) {
    this._enums.push(te);
};
t_program.prototype.add_const = function(tc) {
    this._consts.push(tc);
};
t_program.prototype.add_struct = function(ts) {
    this._structs.push(ts);
};
t_program.prototype.add_xception = function(tx) {
    this._xceptions.push(tx);
};
t_program.prototype.add_service = function(ts) {
    this._services.push(ts);
};
t_program.prototype.get_includes = function() {
    return this._includes;
};
t_program.prototype.set_out_path = function(out_path, out_path_is_absolute) {
    this._out_path = out_path;
    this._out_path_is_absolute = out_path_is_absolute;
};
t_program.prototype.set_namespace = function() {
    if (arguments.length == 1) {
	this._namespace = arguments[0];
    } else {
	this._namespaces[arguments[0]] = arguments[1];
    }
};
t_program.prototype.scope = function() {
    return this._scope;
};
t_program.prototype.add_include = function(path, include_site) {
    //STUB
};
t_program.prototype.set_include_prefix = function(include_prefix) {
    this._include_prefix = include_prefix;
};
t_program.prototype.add_cpp_include = function(path) {
    this._cpp_includes.push(path);
};
t_program.prototype.get_cpp_includes = function() {
    return this._cpp_includes;
};
t_program.prototype.add_c_include = function(path) {
    this._c_includes.push(path);
};
t_program.prototype.get_c_includes = function() {
    return this._c_includes;
};
util.implement(t_program, t_doc.prototype);

// T_TYPE

t_type = function(program, name) {
    this._program = program;
    if (arguments.length > 1) {
	this._name = name;
    } else {
	this._name = null;
    };
    this._fingerprint = "";
    this._annotations = {};
};
t_type.prototype.set_name = function(name) {
    this._name = name;
};
t_type.prototype.get_name = function(name) {
    return this._name;
};
t_type.prototype.is_void = function() {
    return false;
};
t_type.prototype.is_base_type = function() {
    return false;
};
t_type.prototype.is_string = function() {
    return false;
};
t_type.prototype.is_bool = function() {
    return false;
};
t_type.prototype.is_typedef = function() {
    return false;
};
t_type.prototype.is_enum = function() {
    return false;
};
t_type.prototype.is_struct = function() {
    return false;
};
t_type.prototype.is_xception = function() {
    return false;
};
t_type.prototype.is_container = function() {
    return false;
};
t_type.prototype.is_list = function() {
    return false;
};
t_type.prototype.is_set = function() {
    return false;
};
t_type.prototype.is_map = function() {
    return false;
};
t_type.prototype.is_service = function() {
    return false;
};
t_type.prototype.get_program = function(name) {
    return this._program;
};
t_type.prototype.get_true_type = function() {};
t_type.prototype.get_fingerprint_material = function() {};
t_type.prototype.fingerprint_len = 16;
t_type.prototype.generate_fingerprint = function() {};
t_type.prototype.has_fingerprint = function() {
    return (this._fingerprint.length > 0);
};
t_type.prototype.get_binary_fingerprint = function() {
    return this._fingerprint;
};
t_type.prototype.get_ascii_fingerprint = function() {
    //FIXME
    return this._fingerprint;
};
util.implement(t_type, t_doc.prototype);

// T_FIELD

t_field = function(type, name, key) {
    this._type = type;
    this._name = name;
    if (arguments.length > 2) {
	this._key = key;
    } else {
	this._key = 0;
    }
    this._req = null;
    this._value = null;
    this._xsd_optional = false;
    this._xsd_nillable = false;
    this._xsd_attrs = {};
    this._annotations = {};

};
t_field.prototype.get_type = function() {
    return this._type;
};
t_field.prototype.get_name = function() {
    return this._name;
};
t_field.prototype.get_key = function() {
    return this._key;
};
t_field.prototype.e_req = {
    T_REQUIRED       : 1,
    T_OPTIONAL       : 2,
    T_OPT_IN_REQ_OUT : 3
};
t_field.prototype.set_req = function(req) {
    this._req = req;
};
t_field.prototype.get_req = function() {
    return this._req;
};
t_field.prototype.set_value = function(value) {
    this._value = value;
};
t_field.prototype.get_value = function() {
    return this._value;
};
t_field.prototype.set_xsd_optional = function(xsd_optional) {
    this._xsd_optional = xsd_optional;
};
t_field.prototype.get_xsd_optional = function() {
    return this._xsd_optional;
};
t_field.prototype.set_xsd_nillable = function(xsd_nillable) {
    this._xsd_nillable = xsd_nillable;
};
t_field.prototype.get_xsd_nillable = function() {
    return this._xsd_nillable;
};
t_field.prototype.set_xsd_attrs = function(xsd_attrs) {
    this._xsd_attrs = xsd_attrs;
};
t_field.prototype.get_xsd_attrs = function() {
    return this._xsd_attrs;
};
t_field.prototype.get_fingerprint_material = function() {
    //STUB
};
util.implement(t_field, t_doc.prototype);

// T_STRUCT

t_struct = function(program, name) {
    t_type.call(this, program, name);
    this._members = [];
    this._members_in_id_order = null;
    this._is_xception = false;
    this._is_union = false;
    this._xsd_all = false;
};
t_struct.prototype.append = function(elem) {
    this._members.push(elem);
};
t_struct.prototype.set_xception = function(is_xception) {
    this._is_xception = is_xception;
};
util.implement(t_struct, t_type.prototype);

// T_BASE_TYPE

t_base_type = function(name, base) {
    t_type.call(this, null, name);
    this._base = base;
    this._string_list = false;
    this._binary = false;
    this._string_enum = false;
    this._string_enum_vals = [];
};
t_base_type.prototype.t_base = {
    TYPE_VOID    : 1,
    TYPE_STRING  : 2,
    TYPE_BOOL    : 3,
    TYPE_BYTE    : 4,
    TYPE_I16     : 5,
    TYPE_I32     : 6,
    TYPE_I64     : 7,
    TYPE_DOUBLE  : 8
};
t_base_type.prototype.get_base = function() {
    return this._base;
};
t_base_type.prototype.is_void = function() {
    return (this._base == this.t_base.TYPE_VOID);
};
t_base_type.prototype.is_string = function() {
    return (this._base == this.t_base.TYPE_STRING);
};
t_base_type.prototype.is_bool = function() {
    return (this._base == this.t_base.TYPE_BOOL);
};
t_base_type.prototype.set_string_list = function(val) {
    this._string_list = val;
};
t_base_type.prototype.is_string_list = function() {
    return (this._base == this.t_base.TYPE_STRING) && this._string_list;
};
t_base_type.prototype.set_binary = function(val) {
    this._binary = val;
};
t_base_type.prototype.is_binary = function() {
    return (this._base == this.t_base.TYPE_STRING) && this._binary;
};
t_base_type.prototype.set_string_enum = function(val) {
    this._string_enum = val;
};
t_base_type.prototype.is_string_enum = function() {
    return (this._base == this.t_base.TYPE_STRING) && this._string_enum;
};
t_base_type.prototype.get_string_enum_vals = function() {
    return this._string_enum_vals;
};
t_base_type.prototype.is_base_type = function() {
    return true;
};
t_base_type.prototype.get_fingerprint_material = function() {
    var rv = this.t_base_name(this._base);
    return rv;
};
t_base_type.prototype.t_base_name = function(tbase) {
    switch (tbase) {
      case this.t_base.TYPE_VOID   : return      "void"; break;
      case this.t_base.TYPE_STRING : return    "string"; break;
      case this.t_base.TYPE_BOOL   : return      "bool"; break;
      case this.t_base.TYPE_BYTE   : return      "byte"; break;
      case this.t_base.TYPE_I16    : return       "i16"; break;
      case this.t_base.TYPE_I32    : return       "i32"; break;
      case this.t_base.TYPE_I64    : return       "i64"; break;
      case this.t_base.TYPE_DOUBLE : return    "double"; break;
      default          : return "(unknown)"; break;
    }
};
util.implement(t_base_type, t_type.prototype);

// T_ENUM

t_enum = function(program) {
    t_type.call(this, program);
    this._constants = [];
};
t_enum.prototype.set_name = function(name) {
    this._name = name;
};
t_enum.prototype.append = function(constant) {
    this._constants.push(constant);
};
t_enum.prototype.get_constant_by_name = function(name) {
    //STUB
};
t_enum.prototype.get_constant_by_value = function(value) {
    //STUB
};
t_enum.prototype.is_enum = function() {
    return true;
};
t_enum.prototype.get_fingerprint_material = function() {
    return "enum";
};
t_enum.prototype.resolve_values = function() {
    //STUB
};
util.implement(t_enum, t_type.prototype);

// T_FUNCTION

t_function = function(returntype, name, arglist) {
    this._returntype = returntype;
    this._name = name;
    this._arglist = arglist;
    if (arguments.length == 4) {
	this._oneway = arguments[3];
    } else {
	this._oneway = false;
    }
    if (arguments.length == 5) { //not quite faithful to dual constructors
	this._xceptions = arguments[4];
    } else {
	this._xceptions = null;
    }
};
t_function.prototype.get_returntype = function() {
    return this._returntype;
};
t_function.prototype.get_name = function() {
    return this._name;
};
t_function.prototype.get_arglist = function() {
    return this._arglist;
};
t_function.prototype.get_xceptions = function() {
    return this._xceptions;
};
t_function.prototype.is_oneway = function() {
    return this._oneway;
};
util.implement(t_function, t_doc.prototype);

// T_CONTAINER

t_container = function() {
    this._cpp_name = null;
    this._has_cpp_name = false;
};
t_container.prototype.set_cpp_name = function(cpp_name) {
    this._cpp_name = cpp_name;
    this._has_cpp_name = true;
};
t_container.prototype.has_cpp_name = function() {
    return this._has_cpp_name;
};
t_container.prototype.get_cpp_name = function() {
    return this._cpp_name;
};
t_container.prototype.is_container = function() {
    return true;
};
util.implement(t_function, t_type.prototype);

// T_SERVICE

t_service = function(program) {
    t_type.call(this, program);
    this._functions = [];
    this._extends = null;
};
t_service.prototype.is_service = function() {
    return true;
};
t_service.prototype.set_extends = function(xtends) {
    this._extends = xtends;
};
t_service.prototype.add_function = function(func) {
    //TODO: dupe check
    this._functions.push(func);
};
t_service.prototype.get_functions = function() {
    return this._functions;
};
t_service.prototype.get_extends = function() {
    return this._extends;
};
t_service.prototype.get_fingerprint_material = function() {
    console.log("BUG: Can't get fingerprint material for service.");
};
util.implement(t_service, t_type.prototype);

// T_TYPEDEF

t_typedef = function(program, type, symbolic) {
    t_type.call(this, program);
    this._type = type;
    this._symbolic = symbolic;
};
t_typedef.prototype.get_type = function() {
    return this._type;
};
t_typedef.prototype.get_symbolic = function() {
    return this._symbolic;
};
t_typedef.prototype.is_typedef = function() {
    return true;
};
t_typedef.prototype.get_fingerprint_material = function() {
    //STUB
};
t_typedef.prototype.generate_fingerprint = function() {
    //STUB
};
util.implement(t_typedef, t_type.prototype);

// T_ENUM_VALUE

t_enum_value = function(name, value) {
    this._name = name;
    if (arguments.length > 1) {
	this._value = value;
	this._has_value = true;
    } else {
	this._value = 0;
	this._has_value = false;
    };
};
t_enum_value.prototype.get_name = function() {
    return this._name;
};
t_enum_value.prototype.has_value = function() {
    return this._has_value;
};
t_enum_value.prototype.get_value = function() {
    return this._value;
};
t_enum_value.prototype.set_value = function(val) {
    this._value = val;
    this._has_value = true;
};
util.implement(t_enum_value, t_doc.prototype);

// T_MAP

t_map = function(key_type, val_type) {
    this._key_type = key_type;
    this._val_type = val_type;
};
t_map.prototype.get_key_type = function() {
    return this._key_type;
};
t_map.prototype.get_val_type = function() {
    return this._val_type;
};
t_map.prototype.is_map = function() {
    return true;
};
t_map.prototype.get_fingerprint_material = function() {
    //STUB
};
t_map.prototype.generate_fingerprint = function() {
    //STUB
};
util.implement(t_map, t_container.prototype);

// T_LIST

t_list = function(elem_type) {
    this._elem_type = elem_type;
};
t_list.prototype.get_elem_type = function() {
    return this._elem_type;
};
t_list.prototype.is_list = function() {
    return true;
};
t_list.prototype.get_fingerprint_material = function() {
    //STUB
};
t_list.prototype.generate_fingerprint = function() {
    //STUB
};
util.implement(t_list, t_container.prototype);

// T_SET

t_set = function(elem_type) {
    this._elem_type = elem_type;
};
t_set.prototype.get_elem_type = function() {
    return this._elem_type;
};
t_set.prototype.is_set = function() {
    return true;
};
t_set.prototype.get_fingerprint_material = function() {
    //STUB
};
t_set.prototype.generate_fingerprint = function() {
    //STUB
};
util.implement(t_set, t_container.prototype);

// T_CONST

t_const = function(type, name, value) {
    this._type = type;
    this._name = name;
    this._value = value;
};
t_const.prototype.get_type = function() {
    return this._type;
};
t_const.prototype.get_name = function() {
    return this._name;
};
t_const.prototype.get_value = function() {
    return this._value;
};
util.implement(t_const, t_doc.prototype);

// EXPORTS

module.exports = {
    util          : util,
    t_const_value : t_const_value,
    t_doc         : t_doc,
    t_program     : t_program,
    t_type        : t_type,
    t_field       : t_field,
    t_struct      : t_struct,
    t_base_type   : t_base_type,
    t_const       : t_const,
    g_program     : new t_program('/path','name'),
    g_scope       : new t_scope()
}
