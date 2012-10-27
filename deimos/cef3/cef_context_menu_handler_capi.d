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

#ifndef CEF_INCLUDE_CAPI_CEF_CONTEXT_MENU_HANDLER_CAPI_H_
#define CEF_INCLUDE_CAPI_CEF_CONTEXT_MENU_HANDLER_CAPI_H_
#pragma once

#ifdef __cplusplus
extern(C) {
#endif

import deimos.cef3.base;


///
// Implement this structure to handle context menu events. The functions of this
// structure will be called on the UI thread.
///
struct cef_context_menu_handler_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called before a context menu is displayed. |params| provides information
  // about the context menu state. |model| initially contains the default
  // context menu. The |model| can be cleared to show no context menu or
  // modified to show a custom menu. Do not keep references to |params| or
  // |model| outside of this callback.
  ///
  extern(System) void function(cef_context_menu_handler_t* self, cef_browser_t* browser, cef_frame_t* frame, cef_context_menu_params_t* params, cef_menu_model_t* model) on_before_context_menu;

  ///
  // Called to execute a command selected from the context menu. Return true (1)
  // if the command was handled or false (0) for the default implementation. See
  // cef_menu_id_t for the command ids that have default implementations. All
  // user-defined command ids should be between MENU_ID_USER_FIRST and
  // MENU_ID_USER_LAST. |params| will have the same values as what was passed to
  // on_before_context_menu(). Do not keep a reference to |params| outside of
  // this callback.
  ///
  extern(System) int function(cef_context_menu_handler_t* self, cef_browser_t* browser, cef_frame_t* frame, cef_context_menu_params_t* params, int command_id,  cef_event_flags_t event_flags) on_context_menu_command;

  ///
  // Called when the context menu is dismissed irregardless of whether the menu
  // was NULL or a command was selected.
  ///
  extern(System) void function(cef_context_menu_handler_t* self, cef_browser_t* browser, cef_frame_t* frame) on_context_menu_dismissed;
}


///
// Provides information about the context menu state. The ethods of this
// structure can only be accessed on browser process the UI thread.
///
struct cef_context_menu_params_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Returns the X coordinate of the mouse where the context menu was invoked.
  // Coords are relative to the associated RenderView's origin.
  ///
  extern(System) int function(cef_context_menu_params_t* self) get_xcoord;

  ///
  // Returns the Y coordinate of the mouse where the context menu was invoked.
  // Coords are relative to the associated RenderView's origin.
  ///
  extern(System) int function(cef_context_menu_params_t* self) get_ycoord;

  ///
  // Returns flags representing the type of node that the context menu was
  // invoked on.
  ///
  extern(System)  cef_context_menu_type_flags_t function(cef_context_menu_params_t* self) get_type_flags;

  ///
  // Returns the URL of the link, if any, that encloses the node that the
  // context menu was invoked on.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_link_url;

  ///
  // Returns the link URL, if any, to be used ONLY for "copy link address". We
  // don't validate this field in the frontend process.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_unfiltered_link_url;

  ///
  // Returns the source URL, if any, for the element that the context menu was
  // invoked on. Example of elements with source URLs are img, audio, and video.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_source_url;

  ///
  // Returns true (1) if the context menu was invoked on a blocked image.
  ///
  extern(System) int function(cef_context_menu_params_t* self) is_image_blocked;

  ///
  // Returns the URL of the top level page that the context menu was invoked on.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_page_url;

  ///
  // Returns the URL of the subframe that the context menu was invoked on.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_frame_url;

  ///
  // Returns the character encoding of the subframe that the context menu was
  // invoked on.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_frame_charset;

  ///
  // Returns the type of context node that the context menu was invoked on.
  ///
  extern(System)  cef_context_menu_media_type_t function(cef_context_menu_params_t* self) get_media_type;

  ///
  // Returns flags representing the actions supported by the media element, if
  // any, that the context menu was invoked on.
  ///
  enum cef_context_menu_media_state_flags_t (
      CEF_CALLBACK *get_media_state_flags)(
      struct _cef_context_menu_params_t* self);

  ///
  // Returns the text of the selection, if any, that the context menu was
  // invoked on.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_context_menu_params_t* self) get_selection_text;

  ///
  // Returns true (1) if the context menu was invoked on an editable node.
  ///
  extern(System) int function(cef_context_menu_params_t* self) is_editable;

  ///
  // Returns true (1) if the context menu was invoked on an editable node where
  // speech-input is enabled.
  ///
  extern(System) int function(cef_context_menu_params_t* self) is_speech_input_enabled;

  ///
  // Returns flags representing the actions supported by the editable node, if
  // any, that the context menu was invoked on.
  ///
  extern(System)  cef_context_menu_edit_state_flags_t function(cef_context_menu_params_t* self) get_edit_state_flags;
}


#ifdef __cplusplus
}
#endif

#endif  // CEF_INCLUDE_CAPI_CEF_CONTEXT_MENU_HANDLER_CAPI_H_
