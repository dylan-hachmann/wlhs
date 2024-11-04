{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE EmptyDataDeriving #-}
module Xkbcommon.Xkbcommon where

import Foreign
import Foreign.C.Types

#include <xkbcommon/xkbcommon.h>

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_context
}}

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_keymap
}}

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_state
}}

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_rule_names,
    rules, Ptr (CChar),
    model, Ptr (CChar),
    layout, Ptr (CChar),
    variant, Ptr (CChar),
    options, Ptr (CChar)
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_get_name"
    xkb_keysym_get_name :: CUInt -> Ptr (CChar) -> CSize -> IO (CInt)

{{ enum
    XKB_keysym_flags,
    XKB_KEYSYM_NO_FLAGS,
    XKB_KEYSYM_CASE_INSENSITIVE
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_from_name"
    xkb_keysym_from_name :: Ptr (CChar) -> XKB_keysym_flags -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_to_utf8"
    xkb_keysym_to_utf8 :: CUInt -> Ptr (CChar) -> CSize -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_to_utf32"
    xkb_keysym_to_utf32 :: CUInt -> IO (Word32)

foreign import capi "xkbcommon/xkbcommon.h xkb_utf32_to_keysym"
    xkb_utf32_to_keysym :: Word32 -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_to_upper"
    xkb_keysym_to_upper :: CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_to_lower"
    xkb_keysym_to_lower :: CUInt -> IO (CUInt)

{{ enum
    XKB_context_flags,
    XKB_CONTEXT_NO_FLAGS,
    XKB_CONTEXT_NO_DEFAULT_INCLUDES,
    XKB_CONTEXT_NO_ENVIRONMENT_NAMES,
    XKB_CONTEXT_NO_SECURE_GETENV
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_context_new"
    xkb_context_new :: XKB_context_flags -> IO (Ptr (XKB_context))

foreign import capi "xkbcommon/xkbcommon.h xkb_context_ref"
    xkb_context_ref :: Ptr (XKB_context) -> IO (Ptr (XKB_context))

foreign import capi "xkbcommon/xkbcommon.h xkb_context_unref"
    xkb_context_unref :: Ptr (XKB_context) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_user_data"
    xkb_context_set_user_data :: Ptr (XKB_context) -> Ptr (()) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_get_user_data"
    xkb_context_get_user_data :: Ptr (XKB_context) -> IO (Ptr (()))

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_append"
    xkb_context_include_path_append :: Ptr (XKB_context) -> Ptr (CChar) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_append_default"
    xkb_context_include_path_append_default :: Ptr (XKB_context) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_reset_defaults"
    xkb_context_include_path_reset_defaults :: Ptr (XKB_context) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_clear"
    xkb_context_include_path_clear :: Ptr (XKB_context) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_num_include_paths"
    xkb_context_num_include_paths :: Ptr (XKB_context) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_get"
    xkb_context_include_path_get :: Ptr (XKB_context) -> CUInt -> IO (Ptr (CChar))

{{ enum
    XKB_log_level,
    XKB_LOG_LEVEL_CRITICAL,
    XKB_LOG_LEVEL_ERROR,
    XKB_LOG_LEVEL_WARNING,
    XKB_LOG_LEVEL_INFO,
    XKB_LOG_LEVEL_DEBUG
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_log_level"
    xkb_context_set_log_level :: Ptr (XKB_context) -> XKB_log_level -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_get_log_level"
    xkb_context_get_log_level :: Ptr (XKB_context) -> IO (XKB_log_level)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_log_verbosity"
    xkb_context_set_log_verbosity :: Ptr (XKB_context) -> CInt -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_get_log_verbosity"
    xkb_context_get_log_verbosity :: Ptr (XKB_context) -> IO (CInt)

-- foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_log_fn"
--     xkb_context_set_log_fn :: Ptr (XKB_context) -> !!Unimplemented: void (*)(struct xkb_context *, enum XKB_log_level, const char *, struct __va_list_tag *)!! -> IO (())

{{ enum
    XKB_keymap_compile_flags,
    XKB_KEYMAP_COMPILE_NO_FLAGS
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_names"
    xkb_keymap_new_from_names :: Ptr (XKB_context) -> Ptr (XKB_rule_names) -> XKB_keymap_compile_flags -> IO (Ptr (XKB_keymap))

{{ enum
    XKB_keymap_format,
    XKB_KEYMAP_FORMAT_TEXT_V1
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_file"
    xkb_keymap_new_from_file :: Ptr (XKB_context) -> Ptr (_IO_FILE) -> XKB_keymap_format -> XKB_keymap_compile_flags -> IO (Ptr (XKB_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_string"
    xkb_keymap_new_from_string :: Ptr (XKB_context) -> Ptr (CChar) -> XKB_keymap_format -> XKB_keymap_compile_flags -> IO (Ptr (XKB_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_buffer"
    xkb_keymap_new_from_buffer :: Ptr (XKB_context) -> Ptr (CChar) -> CSize -> XKB_keymap_format -> XKB_keymap_compile_flags -> IO (Ptr (XKB_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_ref"
    xkb_keymap_ref :: Ptr (XKB_keymap) -> IO (Ptr (XKB_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_unref"
    xkb_keymap_unref :: Ptr (XKB_keymap) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_get_as_string"
    xkb_keymap_get_as_string :: Ptr (XKB_keymap) -> XKB_keymap_format -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_min_keycode"
    xkb_keymap_min_keycode :: Ptr (XKB_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_max_keycode"
    xkb_keymap_max_keycode :: Ptr (XKB_keymap) -> IO (CUInt)

-- foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_for_each"
--     xkb_keymap_key_for_each :: Ptr (XKB_keymap) -> void (*)(struct xkb_keymap *, xkb_keycode_t, void *) -> Ptr (()) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_get_name"
    xkb_keymap_key_get_name :: Ptr (XKB_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_by_name"
    xkb_keymap_key_by_name :: Ptr (XKB_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_mods"
    xkb_keymap_num_mods :: Ptr (XKB_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_mod_get_name"
    xkb_keymap_mod_get_name :: Ptr (XKB_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_mod_get_index"
    xkb_keymap_mod_get_index :: Ptr (XKB_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_layouts"
    xkb_keymap_num_layouts :: Ptr (XKB_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_layout_get_name"
    xkb_keymap_layout_get_name :: Ptr (XKB_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_layout_get_index"
    xkb_keymap_layout_get_index :: Ptr (XKB_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_leds"
    xkb_keymap_num_leds :: Ptr (XKB_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_led_get_name"
    xkb_keymap_led_get_name :: Ptr (XKB_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_led_get_index"
    xkb_keymap_led_get_index :: Ptr (XKB_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_layouts_for_key"
    xkb_keymap_num_layouts_for_key :: Ptr (XKB_keymap) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_levels_for_key"
    xkb_keymap_num_levels_for_key :: Ptr (XKB_keymap) -> CUInt -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_get_mods_for_level"
    xkb_keymap_key_get_mods_for_level :: Ptr (XKB_keymap) -> CUInt -> CUInt -> CUInt -> Ptr (CUInt) -> CSize -> IO (CSize)

-- foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_get_syms_by_level"
--     xkb_keymap_key_get_syms_by_level :: Ptr (XKB_keymap) -> CUInt -> CUInt -> CUInt -> Ptr (Ptr (CUInt)) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_repeats"
    xkb_keymap_key_repeats :: Ptr (XKB_keymap) -> CUInt -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_new"
    xkb_state_new :: Ptr (XKB_keymap) -> IO (Ptr (XKB_state))

foreign import capi "xkbcommon/xkbcommon.h xkb_state_ref"
    xkb_state_ref :: Ptr (XKB_state) -> IO (Ptr (XKB_state))

foreign import capi "xkbcommon/xkbcommon.h xkb_state_unref"
    xkb_state_unref :: Ptr (XKB_state) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_state_get_keymap"
    xkb_state_get_keymap :: Ptr (XKB_state) -> IO (Ptr (XKB_keymap))

{{ enum
    XKB_key_direction,
    XKB_KEY_UP,
    XKB_KEY_DOWN
}}

{{ enum
    XKB_state_component,
    XKB_STATE_MODS_DEPRESSED,
    XKB_STATE_MODS_LATCHED,
    XKB_STATE_MODS_LOCKED,
    XKB_STATE_MODS_EFFECTIVE,
    XKB_STATE_LAYOUT_DEPRESSED,
    XKB_STATE_LAYOUT_LATCHED,
    XKB_STATE_LAYOUT_LOCKED,
    XKB_STATE_LAYOUT_EFFECTIVE,
    XKB_STATE_LEDS
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_state_update_key"
    xkb_state_update_key :: Ptr (XKB_state) -> CUInt -> XKB_key_direction -> IO (XKB_state_component)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_update_mask"
    xkb_state_update_mask :: Ptr (XKB_state) -> CUInt -> CUInt -> CUInt -> CUInt -> CUInt -> CUInt -> IO (XKB_state_component)

-- foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_syms"
--     xkb_state_key_get_syms :: Ptr (XKB_state) -> CUInt -> Ptr (Ptr (CUInt)) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_utf8"
    xkb_state_key_get_utf8 :: Ptr (XKB_state) -> CUInt -> Ptr (CChar) -> CSize -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_utf32"
    xkb_state_key_get_utf32 :: Ptr (XKB_state) -> CUInt -> IO (Word32)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_one_sym"
    xkb_state_key_get_one_sym :: Ptr (XKB_state) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_layout"
    xkb_state_key_get_layout :: Ptr (XKB_state) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_level"
    xkb_state_key_get_level :: Ptr (XKB_state) -> CUInt -> CUInt -> IO (CUInt)

{{ enum
    XKB_state_match,
    XKB_STATE_MATCH_ANY,
    XKB_STATE_MATCH_ALL,
    XKB_STATE_MATCH_NON_EXCLUSIVE
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_state_serialize_mods"
    xkb_state_serialize_mods :: Ptr (XKB_state) -> XKB_state_component -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_serialize_layout"
    xkb_state_serialize_layout :: Ptr (XKB_state) -> XKB_state_component -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_name_is_active"
    xkb_state_mod_name_is_active :: Ptr (XKB_state) -> Ptr (CChar) -> XKB_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_names_are_active"
    xkb_state_mod_names_are_active :: Ptr (XKB_state) -> XKB_state_component -> XKB_state_match -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_index_is_active"
    xkb_state_mod_index_is_active :: Ptr (XKB_state) -> CUInt -> XKB_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_indices_are_active"
    xkb_state_mod_indices_are_active :: Ptr (XKB_state) -> XKB_state_component -> XKB_state_match -> IO (CInt)

{{ enum
    XKB_consumed_mode,
    XKB_CONSUMED_MODE_XKB,
    XKB_CONSUMED_MODE_GTK
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_consumed_mods2"
    xkb_state_key_get_consumed_mods2 :: Ptr (XKB_state) -> CUInt -> XKB_consumed_mode -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_consumed_mods"
    xkb_state_key_get_consumed_mods :: Ptr (XKB_state) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_index_is_consumed2"
    xkb_state_mod_index_is_consumed2 :: Ptr (XKB_state) -> CUInt -> CUInt -> XKB_consumed_mode -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_index_is_consumed"
    xkb_state_mod_index_is_consumed :: Ptr (XKB_state) -> CUInt -> CUInt -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_mask_remove_consumed"
    xkb_state_mod_mask_remove_consumed :: Ptr (XKB_state) -> CUInt -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_layout_name_is_active"
    xkb_state_layout_name_is_active :: Ptr (XKB_state) -> Ptr (CChar) -> XKB_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_layout_index_is_active"
    xkb_state_layout_index_is_active :: Ptr (XKB_state) -> CUInt -> XKB_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_led_name_is_active"
    xkb_state_led_name_is_active :: Ptr (XKB_state) -> Ptr (CChar) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_led_index_is_active"
    xkb_state_led_index_is_active :: Ptr (XKB_state) -> CUInt -> IO (CInt)
