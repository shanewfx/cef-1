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

#ifndef CEF_INCLUDE_CAPI_CEF_DOWNLOAD_ITEM_CAPI_H_
#define CEF_INCLUDE_CAPI_CEF_DOWNLOAD_ITEM_CAPI_H_
#pragma once

#ifdef __cplusplus
extern(C) {
#endif

import deimos.cef3.base;


///
// Structure used to represent a download item.
///
struct cef_download_item_t {
  ///
  // Base structure.
  ///
  cef_base_t base;

  ///
  // Returns true (1) if this object is valid. Do not call any other functions
  // if this function returns false (0).
  ///
  extern(System) int function(cef_download_item_t* self) is_valid;

  ///
  // Returns true (1) if the download is in progress.
  ///
  extern(System) int function(cef_download_item_t* self) is_in_progress;

  ///
  // Returns true (1) if the download is complete.
  ///
  extern(System) int function(cef_download_item_t* self) is_complete;

  ///
  // Returns true (1) if the download has been canceled or interrupted.
  ///
  extern(System) int function(cef_download_item_t* self) is_canceled;

  ///
  // Returns a simple speed estimate in bytes/s.
  ///
  extern(System) int64 function(cef_download_item_t* self) get_current_speed;

  ///
  // Returns the rough percent complete or -1 if the receive total size is
  // unknown.
  ///
  extern(System) int function(cef_download_item_t* self) get_percent_complete;

  ///
  // Returns the total number of bytes.
  ///
  extern(System) int64 function(cef_download_item_t* self) get_total_bytes;

  ///
  // Returns the number of received bytes.
  ///
  extern(System) int64 function(cef_download_item_t* self) get_received_bytes;

  ///
  // Returns the time that the download started.
  ///
  extern(System) cef_time_t function(cef_download_item_t* self) get_start_time;

  ///
  // Returns the time that the download ended.
  ///
  extern(System) cef_time_t function(cef_download_item_t* self) get_end_time;

  ///
  // Returns the full path to the downloaded or downloading file.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_download_item_t* self) get_full_path;

  ///
  // Returns the unique identifier for this download.
  ///
  extern(System) int32 function(cef_download_item_t* self) get_id;

  ///
  // Returns the URL.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_download_item_t* self) get_url;

  ///
  // Returns the suggested file name.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_download_item_t* self) get_suggested_file_name;

  ///
  // Returns the content disposition.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_download_item_t* self) get_content_disposition;

  ///
  // Returns the mime type.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_download_item_t* self) get_mime_type;

  ///
  // Returns the referrer character set.
  ///
  // The resulting string must be freed by calling cef_string_userfree_free().
  extern(System) cef_string_userfree_t function(cef_download_item_t* self) get_referrer_charset;
}


#ifdef __cplusplus
}
#endif

#endif  // CEF_INCLUDE_CAPI_CEF_DOWNLOAD_ITEM_CAPI_H_
