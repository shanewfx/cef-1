module deimos.cef3.internal.types_win;

// Copyright (c) 2009 Marshall A. Greenblatt. All rights reserved.
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


import deimos.cef3.internal.build;

version(Windows) {
    import core.sys.windows.windows;
    import deimos.cef3.internal.string;

    extern(C) {
        // Handle types.
        alias HCURSOR cef_cursor_handle_t;
        alias MSG* cef_event_handle_t;
        alias HWND cef_window_handle_t;

        ///
        // Structure representing CefExecuteProcess arguments.
        ///
        struct cef_main_args_t {
            HINSTANCE instance;
        }

        ///
        // Structure representing window information.
        ///
        struct cef_window_info_t {
            // Standard parameters required by CreateWindowEx()
            DWORD ex_style;
            cef_string_t window_name;
            DWORD style;
            int x;
            int y;
            int width;
            int height;
            cef_window_handle_t parent_window;
            HMENU menu;

            // Set to true to enable transparent painting.
            BOOL transparent_painting;

            // Handle for the new browser window.
            cef_window_handle_t window;
        }
    }
}