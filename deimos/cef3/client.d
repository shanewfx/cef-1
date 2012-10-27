module deimos.cef3.client;

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

extern(C) {
    import deimos.cef3.base;


    ///
    // Implement this structure to provide handler implementations.
    ///
    struct cef_client_t {
        ///
        // Base structure.
        ///
        cef_base_t base;

        ///
        // Return the handler for context menus. If no handler is provided the default
        // implementation will be used.
        ///
        extern(System) cef_context_menu_handler_t* function(cef_client_t* self) get_context_menu_handler;
 
        ///
        // Return the handler for dialogs. If no handler is provided the default
        // implementation will be used.
        ///
        extern(System) cef_dialog_handler_t* function(cef_client_t* self) get_dialog_handler;

        ///
        // Return the handler for browser display state events.
        ///
        extern(System) cef_display_handler_t* function(cef_client_t* self) get_display_handler;

        ///
        // Return the handler for download events. If no handler is returned downloads
        // will not be allowed.
        ///
        extern(System) cef_download_handler_t* function(cef_client_t* self) get_download_handler;

        ///
        // Return the handler for focus events.
        ///
        extern(System) cef_focus_handler_t* function(cef_client_t* self) get_focus_handler;

        ///
        // Return the handler for geolocation permissions requests. If no handler is
        // provided geolocation access will be denied by default.
        ///
        extern(System) cef_geolocation_handler_t* function(cef_client_t* self) get_geolocation_handler;

        ///
        // Return the handler for JavaScript dialogs. If no handler is provided the
        // default implementation will be used.
        ///
        extern(System) cef_jsdialog_handler_t* function(cef_client_t* self) get_jsdialog_handler;

        ///
        // Return the handler for keyboard events.
        ///
        extern(System) cef_keyboard_handler_t* function(cef_client_t* self) get_keyboard_handler;

        ///
        // Return the handler for browser life span events.
        ///
        extern(System) cef_life_span_handler_t* function(cef_client_t* self) get_life_span_handler;

        ///
        // Return the handler for browser load status events.
        ///
        extern(System) cef_load_handler_t* function(cef_client_t* self) get_load_handler;

        ///
        // Return the handler for browser request events.
        ///
        extern(System) cef_request_handler_t* function(cef_client_t* self) get_request_handler;

        ///
        // Called when a new message is received from a different process. Return true
        // (1) if the message was handled or false (0) otherwise. Do not keep a
        // reference to or attempt to access the message outside of this callback.
        ///
        extern(System) int function(cef_client_t* self, cef_browser_t* browser, enum cef_process_id_t source_process,
                                    cef_process_message_t* message) on_process_message_received;
    }
}