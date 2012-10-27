// Copyright (c) 2012 Marshall A. Greenblatt. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the name Chromium Embedded
// Framework nor the names of its contributors may be used to endorse
// or promote products derived from this software without specific prior
// written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool and should not edited
// by hand. See the translator.README.txt file in the tools directory for
// more information.
//

#ifndef CEF_INCLUDE_CAPI_CEF_VALUES_CAPI_H_
#define CEF_INCLUDE_CAPI_CEF_VALUES_CAPI_H_
#pragma once

#ifdef __cplusplus
extern(C) {
#endif

import deimos.cef3.base;


///
// Structure representing a binary value. Can be used on any process and thread.
///
struct cef_binary_value_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Returns true (1) if this object is valid. Do not call any other functions
  // if this function returns false (0).
  ///
  extern(System) int function(cef_binary_value_t* self) is_valid;

  ///
  // Returns true (1) if this object is currently owned by another object.
  ///
  extern(System) int function(cef_binary_value_t* self) is_owned;

  ///
  // Returns a copy of this object. The data in this object will also be copied.
  ///
  extern(System) cef_binary_value_t* function(cef_binary_value_t* self) copy;

  ///
  // Returns the data size.
  ///
  extern(System) size_t function(cef_binary_value_t* self) get_size;

  ///
  // Read up to |buffer_size| number of bytes into |buffer|. Reading begins at
  // the specified byte |data_offset|. Returns the number of bytes read.
  ///
  extern(System) size_t function(cef_binary_value_t* self, void* buffer, size_t buffer_size, size_t data_offset) get_data;
}


///
// Creates a new object that is not owned by any other object. The specified
// |data| will be copied.
///
cef_binary_value_t* cef_binary_value_create(const(void)* data, size_t data_size);


///
// Structure representing a dictionary value. Can be used on any process and
// thread.
///
struct cef_dictionary_value_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Returns true (1) if this object is valid. Do not call any other functions
  // if this function returns false (0).
  ///
  extern(System) int function(cef_dictionary_value_t* self) is_valid;

  ///
  // Returns true (1) if this object is currently owned by another object.
  ///
  extern(System) int function(cef_dictionary_value_t* self) is_owned;

  ///
  // Returns true (1) if the values of this object are read-only. Some APIs may
  // expose read-only objects.
  ///
  extern(System) int function(cef_dictionary_value_t* self) is_read_only;

  ///
  // Returns a writable copy of this object. If |exclude_NULL_children| is true
  // (1) any NULL dictionaries or lists will be excluded from the copy.
  ///
  extern(System) cef_dictionary_value_t* function(cef_dictionary_value_t* self, int exclude_empty_children) copy;

  ///
  // Returns the number of values.
  ///
  extern(System) size_t function(cef_dictionary_value_t* self) get_size;

  ///
  // Removes all values. Returns true (1) on success.
  ///
  extern(System) int function(cef_dictionary_value_t* self) clear;

  ///
  // Returns true (1) if the current dictionary has a value for the given key.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key) has_key;

  ///
  // Reads all keys for this dictionary into the specified vector.
  ///
  extern(System) int function(cef_dictionary_value_t* self, cef_string_list_t keys) get_keys;

  ///
  // Removes the value at the specified key. Returns true (1) is the value was
  // removed successfully.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key) remove;

  ///
  // Returns the value type for the specified key.
  ///
  extern(System)  cef_value_type_t function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_type;

  ///
  // Returns the value at the specified key as type bool.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_bool;

  ///
  // Returns the value at the specified key as type int.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_int;

  ///
  // Returns the value at the specified key as type double.
  ///
  extern(System) double function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_double;

  ///
  // Returns the value at the specified key as type string.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_string;

  ///
  // Returns the value at the specified key as type binary.
  ///
  extern(System) cef_binary_value_t* function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_binary;

  ///
  // Returns the value at the specified key as type dictionary.
  ///
  extern(System) cef_dictionary_value_t* function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_dictionary;

  ///
  // Returns the value at the specified key as type list.
  ///
  extern(System) cef_list_value_t* function(cef_dictionary_value_t* self, const(cef_string_t)* key) get_list;

  ///
  // Sets the value at the specified key as type null. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key) set_null;

  ///
  // Sets the value at the specified key as type bool. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, int value) set_bool;

  ///
  // Sets the value at the specified key as type int. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, int value) set_int;

  ///
  // Sets the value at the specified key as type double. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, double value) set_double;

  ///
  // Sets the value at the specified key as type string. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, const(cef_string_t)* value) set_string;

  ///
  // Sets the value at the specified key as type binary. Returns true (1) if the
  // value was set successfully. If |value| is currently owned by another object
  // then the value will be copied and the |value| reference will not change.
  // Otherwise, ownership will be transferred to this object and the |value|
  // reference will be invalidated.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, cef_binary_value_t* value) set_binary;

  ///
  // Sets the value at the specified key as type dict. Returns true (1) if the
  // value was set successfully. After calling this function the |value| object
  // will no longer be valid. If |value| is currently owned by another object
  // then the value will be copied and the |value| reference will not change.
  // Otherwise, ownership will be transferred to this object and the |value|
  // reference will be invalidated.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, cef_dictionary_value_t* value) set_dictionary;

  ///
  // Sets the value at the specified key as type list. Returns true (1) if the
  // value was set successfully. After calling this function the |value| object
  // will no longer be valid. If |value| is currently owned by another object
  // then the value will be copied and the |value| reference will not change.
  // Otherwise, ownership will be transferred to this object and the |value|
  // reference will be invalidated.
  ///
  extern(System) int function(cef_dictionary_value_t* self, const(cef_string_t)* key, cef_list_value_t* value) set_list;
}


///
// Creates a new object that is not owned by any other object.
///
cef_dictionary_value_t* cef_dictionary_value_create();


///
// Structure representing a list value. Can be used on any process and thread.
///
struct cef_list_value_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Returns true (1) if this object is valid. Do not call any other functions
  // if this function returns false (0).
  ///
  extern(System) int function(cef_list_value_t* self) is_valid;

  ///
  // Returns true (1) if this object is currently owned by another object.
  ///
  extern(System) int function(cef_list_value_t* self) is_owned;

  ///
  // Returns true (1) if the values of this object are read-only. Some APIs may
  // expose read-only objects.
  ///
  extern(System) int function(cef_list_value_t* self) is_read_only;

  ///
  // Returns a writable copy of this object.
  ///
  extern(System) cef_list_value_t* function(cef_list_value_t* self) copy;

  ///
  // Sets the number of values. If the number of values is expanded all new
  // value slots will default to type null. Returns true (1) on success.
  ///
  extern(System) int function(cef_list_value_t* self, size_t size) set_size;

  ///
  // Returns the number of values.
  ///
  extern(System) size_t function(cef_list_value_t* self) get_size;

  ///
  // Removes all values. Returns true (1) on success.
  ///
  extern(System) int function(cef_list_value_t* self) clear;

  ///
  // Removes the value at the specified index.
  ///
  extern(System) int function(cef_list_value_t* self, int index) remove;

  ///
  // Returns the value type at the specified index.
  ///
  extern(System)  cef_value_type_t function(cef_list_value_t* self, int index) get_type;

  ///
  // Returns the value at the specified index as type bool.
  ///
  extern(System) int function(cef_list_value_t* self, int index) get_bool;

  ///
  // Returns the value at the specified index as type int.
  ///
  extern(System) int function(cef_list_value_t* self, int index) get_int;

  ///
  // Returns the value at the specified index as type double.
  ///
  extern(System) double function(cef_list_value_t* self, int index) get_double;

  ///
  // Returns the value at the specified index as type string.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_list_value_t* self, int index) get_string;

  ///
  // Returns the value at the specified index as type binary.
  ///
  extern(System) cef_binary_value_t* function(cef_list_value_t* self, int index) get_binary;

  ///
  // Returns the value at the specified index as type dictionary.
  ///
  extern(System) cef_dictionary_value_t* function(cef_list_value_t* self, int index) get_dictionary;

  ///
  // Returns the value at the specified index as type list.
  ///
  extern(System) cef_list_value_t* function(cef_list_value_t* self, int index) get_list;

  ///
  // Sets the value at the specified index as type null. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_list_value_t* self, int index) set_null;

  ///
  // Sets the value at the specified index as type bool. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_list_value_t* self, int index, int value) set_bool;

  ///
  // Sets the value at the specified index as type int. Returns true (1) if the
  // value was set successfully.
  ///
  extern(System) int function(cef_list_value_t* self, int index, int value) set_int;

  ///
  // Sets the value at the specified index as type double. Returns true (1) if
  // the value was set successfully.
  ///
  extern(System) int function(cef_list_value_t* self, int index, double value) set_double;

  ///
  // Sets the value at the specified index as type string. Returns true (1) if
  // the value was set successfully.
  ///
  extern(System) int function(cef_list_value_t* self, int index, const(cef_string_t)* value) set_string;

  ///
  // Sets the value at the specified index as type binary. Returns true (1) if
  // the value was set successfully. After calling this function the |value|
  // object will no longer be valid. If |value| is currently owned by another
  // object then the value will be copied and the |value| reference will not
  // change. Otherwise, ownership will be transferred to this object and the
  // |value| reference will be invalidated.
  ///
  extern(System) int function(cef_list_value_t* self, int index, cef_binary_value_t* value) set_binary;

  ///
  // Sets the value at the specified index as type dict. Returns true (1) if the
  // value was set successfully. After calling this function the |value| object
  // will no longer be valid. If |value| is currently owned by another object
  // then the value will be copied and the |value| reference will not change.
  // Otherwise, ownership will be transferred to this object and the |value|
  // reference will be invalidated.
  ///
  extern(System) int function(cef_list_value_t* self, int index, cef_dictionary_value_t* value) set_dictionary;

  ///
  // Sets the value at the specified index as type list. Returns true (1) if the
  // value was set successfully. After calling this function the |value| object
  // will no longer be valid. If |value| is currently owned by another object
  // then the value will be copied and the |value| reference will not change.
  // Otherwise, ownership will be transferred to this object and the |value|
  // reference will be invalidated.
  ///
  extern(System) int function(cef_list_value_t* self, int index, cef_list_value_t* value) set_list;
}


///
// Creates a new object that is not owned by any other object.
///
cef_list_value_t* cef_list_value_create();


#ifdef __cplusplus
}
#endif

#endif  // CEF_INCLUDE_CAPI_CEF_VALUES_CAPI_H_
