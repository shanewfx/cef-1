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

#ifndef CEF_INCLUDE_CAPI_CEF_MENU_MODEL_CAPI_H_
#define CEF_INCLUDE_CAPI_CEF_MENU_MODEL_CAPI_H_
#pragma once

#ifdef __cplusplus
extern(C) {
#endif

import deimos.cef3.base;


///
// Supports creation and modification of menus. See cef_menu_id_t for the
// command ids that have default implementations. All user-defined command ids
// should be between MENU_ID_USER_FIRST and MENU_ID_USER_LAST. The functions of
// this structure can only be accessed on the browser process the UI thread.
///
struct cef_menu_model_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Clears the menu. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self) clear;

  ///
  // Returns the number of items in this menu.
  ///
  extern(System) int function(cef_menu_model_t* self) get_count;

  //
  // Add a separator to the menu. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self) add_separator;

  //
  // Add an item to the menu. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, const(cef_string_t)* label) add_item;

  //
  // Add a check item to the menu. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, const(cef_string_t)* label) add_check_item;

  //
  // Add a radio item to the menu. Only a single item with the specified
  // |group_id| can be checked at a time. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, const(cef_string_t)* label, int group_id) add_radio_item;

  //
  // Add a sub-menu to the menu. The new sub-menu is returned.
  ///
  extern(System) cef_menu_model_t* function(cef_menu_model_t* self, int command_id, const(cef_string_t)* label) add_sub_menu;

  //
  // Insert a separator in the menu at the specified |index|. Returns true (1)
  // on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) insert_separator_at;

  //
  // Insert an item in the menu at the specified |index|. Returns true (1) on
  // success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int command_id, const(cef_string_t)* label) insert_item_at;

  //
  // Insert a check item in the menu at the specified |index|. Returns true (1)
  // on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int command_id, const(cef_string_t)* label) insert_check_item_at;

  //
  // Insert a radio item in the menu at the specified |index|. Only a single
  // item with the specified |group_id| can be checked at a time. Returns true
  // (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int command_id, const(cef_string_t)* label, int group_id) insert_radio_item_at;

  //
  // Insert a sub-menu in the menu at the specified |index|. The new sub-menu is
  // returned.
  ///
  extern(System) cef_menu_model_t* function(cef_menu_model_t* self, int index, int command_id, const(cef_string_t)* label) insert_sub_menu_at;

  ///
  // Removes the item with the specified |command_id|. Returns true (1) on
  // success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) remove;

  ///
  // Removes the item at the specified |index|. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) remove_at;

  ///
  // Returns the index associated with the specified |command_id| or -1 if not
  // found due to the command id not existing in the menu.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) get_index_of;

  ///
  // Returns the command id at the specified |index| or -1 if not found due to
  // invalid range or the index being a separator.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) get_command_id_at;

  ///
  // Sets the command id at the specified |index|. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int command_id) set_command_id_at;

  ///
  // Returns the label for the specified |command_id| or NULL if not found.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_menu_model_t* self, int command_id) get_label;

  ///
  // Returns the label at the specified |index| or NULL if not found due to
  // invalid range or the index being a separator.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_menu_model_t* self, int index) get_label_at;

  ///
  // Sets the label for the specified |command_id|. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, const(cef_string_t)* label) set_label;

  ///
  // Set the label at the specified |index|. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, const(cef_string_t)* label) set_label_at;

  ///
  // Returns the item type for the specified |command_id|.
  ///
  extern(System)  cef_menu_item_type_t function(cef_menu_model_t* self, int command_id) get_type;

  ///
  // Returns the item type at the specified |index|.
  ///
  extern(System)  cef_menu_item_type_t function(cef_menu_model_t* self, int index) get_type_at;

  ///
  // Returns the group id for the specified |command_id| or -1 if invalid.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) get_group_id;

  ///
  // Returns the group id at the specified |index| or -1 if invalid.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) get_group_id_at;

  ///
  // Sets the group id for the specified |command_id|. Returns true (1) on
  // success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, int group_id) set_group_id;

  ///
  // Sets the group id at the specified |index|. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int group_id) set_group_id_at;

  ///
  // Returns the submenu for the specified |command_id| or NULL if invalid.
  ///
  extern(System) cef_menu_model_t* function(cef_menu_model_t* self, int command_id) get_sub_menu;

  ///
  // Returns the submenu at the specified |index| or NULL if invalid.
  ///
  extern(System) cef_menu_model_t* function(cef_menu_model_t* self, int index) get_sub_menu_at;

  //
  // Returns true (1) if the specified |command_id| is visible.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) is_visible;

  //
  // Returns true (1) if the specified |index| is visible.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) is_visible_at;

  //
  // Change the visibility of the specified |command_id|. Returns true (1) on
  // success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, int visible) set_visible;

  //
  // Change the visibility at the specified |index|. Returns true (1) on
  // success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int visible) set_visible_at;

  //
  // Returns true (1) if the specified |command_id| is enabled.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) is_enabled;

  //
  // Returns true (1) if the specified |index| is enabled.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) is_enabled_at;

  //
  // Change the enabled status of the specified |command_id|. Returns true (1)
  // on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, int enabled) set_enabled;

  //
  // Change the enabled status at the specified |index|. Returns true (1) on
  // success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int enabled) set_enabled_at;

  //
  // Returns true (1) if the specified |command_id| is checked. Only applies to
  // check and radio items.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) is_checked;

  //
  // Returns true (1) if the specified |index| is checked. Only applies to check
  // and radio items.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) is_checked_at;

  //
  // Check the specified |command_id|. Only applies to check and radio items.
  // Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, int checked) set_checked;

  //
  // Check the specified |index|. Only applies to check and radio items. Returns
  // true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int checked) set_checked_at;

  //
  // Returns true (1) if the specified |command_id| has a keyboard accelerator
  // assigned.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) has_accelerator;

  //
  // Returns true (1) if the specified |index| has a keyboard accelerator
  // assigned.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) has_accelerator_at;

  //
  // Set the keyboard accelerator for the specified |command_id|. |key_code| can
  // be any virtual key or character value. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, int key_code, int shift_pressed, int ctrl_pressed, int alt_pressed) set_accelerator;

  //
  // Set the keyboard accelerator at the specified |index|. |key_code| can be
  // any virtual key or character value. Returns true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int key_code, int shift_pressed, int ctrl_pressed, int alt_pressed) set_accelerator_at;

  //
  // Remove the keyboard accelerator for the specified |command_id|. Returns
  // true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id) remove_accelerator;

  //
  // Remove the keyboard accelerator at the specified |index|. Returns true (1)
  // on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index) remove_accelerator_at;

  //
  // Retrieves the keyboard accelerator for the specified |command_id|. Returns
  // true (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int command_id, int* key_code, int* shift_pressed, int* ctrl_pressed, int* alt_pressed) get_accelerator;

  //
  // Retrieves the keyboard accelerator for the specified |index|. Returns true
  // (1) on success.
  ///
  extern(System) int function(cef_menu_model_t* self, int index, int* key_code, int* shift_pressed, int* ctrl_pressed, int* alt_pressed) get_accelerator_at;
}


#ifdef __cplusplus
}
#endif

#endif  // CEF_INCLUDE_CAPI_CEF_MENU_MODEL_CAPI_H_
