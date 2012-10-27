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

#ifndef CEF_INCLUDE_CAPI_CEF_DIALOG_HANDLER_CAPI_H_
#define CEF_INCLUDE_CAPI_CEF_DIALOG_HANDLER_CAPI_H_
#pragma once

#ifdef __cplusplus
extern(C) {
#endif

import deimos.cef3.base;


///
// Callback structure for asynchronous continuation of file dialog requests.
///
struct cef_file_dialog_callback_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Continue the file selection with the specified |file_paths|. This may be a
  // single value or a list of values depending on the dialog mode. An NULL
  // value is treated the same as calling cancel().
  ///
  extern(System) void function(cef_file_dialog_callback_t* self, cef_string_list_t file_paths) cont;

  ///
  // Cancel the file selection.
  ///
  extern(System) void function(cef_file_dialog_callback_t* self) cancel;
}


///
// Implement this structure to handle dialog events. The functions of this
// structure will be called on the browser process UI thread.
///
struct cef_dialog_handler_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Called to run a file chooser dialog. |mode| represents the type of dialog
  // to display. |title| to the title to be used for the dialog and may be NULL
  // to show the default title ("Open" or "Save" depending on the mode).
  // |default_file_name| is the default file name to select in the dialog.
  // |accept_types| is a list of valid lower-cased MIME types or file extensions
  // specified in an input element and is used to restrict selectable files to
  // such types. To display a custom dialog return true (1) and execute
  // |callback| either inline or at a later time. To display the default dialog
  // return false (0).
  ///
  extern(System) int function(cef_dialog_handler_t* self, cef_browser_t* browser,  cef_file_dialog_mode_t mode, const(cef_string_t)* title, const(cef_string_t)* default_file_name, cef_string_list_t accept_types, cef_file_dialog_callback_t* callback) on_file_dialog;
}


#ifdef __cplusplus
}
#endif

#endif  // CEF_INCLUDE_CAPI_CEF_DIALOG_HANDLER_CAPI_H_
