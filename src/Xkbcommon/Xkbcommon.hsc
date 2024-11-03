{{ struct
    xkbcommon/xkbcommon.h,
    xkb_context,

}}

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_keymap,

}}

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_state,

}}

{{ struct
    xkbcommon/xkbcommon.h,
    xkb_rule_names,
    rules, Ptr (CChar),
    model, Ptr (CChar),
    layout, Ptr (CChar),
    variant, Ptr (CChar),
    options, Ptr (CChar),
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_get_name"
    xkb_keysym_get_name :: CUInt -> Ptr (CChar) -> CSize -> IO (CInt)

{{ enum
    xkb_keysym_flags,
    XKB_KEYSYM_NO_FLAGS,
    XKB_KEYSYM_CASE_INSENSITIVE,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keysym_from_name"
    xkb_keysym_from_name :: Ptr (CChar) -> Xkb_keysym_flags -> IO (CUInt)

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
    xkb_context_flags,
    XKB_CONTEXT_NO_FLAGS,
    XKB_CONTEXT_NO_DEFAULT_INCLUDES,
    XKB_CONTEXT_NO_ENVIRONMENT_NAMES,
    XKB_CONTEXT_NO_SECURE_GETENV,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_context_new"
    xkb_context_new :: Xkb_context_flags -> IO (Ptr (Xkb_context))

foreign import capi "xkbcommon/xkbcommon.h xkb_context_ref"
    xkb_context_ref :: Ptr (Xkb_context) -> IO (Ptr (Xkb_context))

foreign import capi "xkbcommon/xkbcommon.h xkb_context_unref"
    xkb_context_unref :: Ptr (Xkb_context) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_user_data"
    xkb_context_set_user_data :: Ptr (Xkb_context) -> Ptr (()) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_get_user_data"
    xkb_context_get_user_data :: Ptr (Xkb_context) -> IO (Ptr (()))

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_append"
    xkb_context_include_path_append :: Ptr (Xkb_context) -> Ptr (CChar) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_append_default"
    xkb_context_include_path_append_default :: Ptr (Xkb_context) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_reset_defaults"
    xkb_context_include_path_reset_defaults :: Ptr (Xkb_context) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_clear"
    xkb_context_include_path_clear :: Ptr (Xkb_context) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_num_include_paths"
    xkb_context_num_include_paths :: Ptr (Xkb_context) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_include_path_get"
    xkb_context_include_path_get :: Ptr (Xkb_context) -> CUInt -> IO (Ptr (CChar))

{{ enum
    xkb_log_level,
    XKB_LOG_LEVEL_CRITICAL,
    XKB_LOG_LEVEL_ERROR,
    XKB_LOG_LEVEL_WARNING,
    XKB_LOG_LEVEL_INFO,
    XKB_LOG_LEVEL_DEBUG,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_log_level"
    xkb_context_set_log_level :: Ptr (Xkb_context) -> Xkb_log_level -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_get_log_level"
    xkb_context_get_log_level :: Ptr (Xkb_context) -> IO (Xkb_log_level)

foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_log_verbosity"
    xkb_context_set_log_verbosity :: Ptr (Xkb_context) -> CInt -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_context_get_log_verbosity"
    xkb_context_get_log_verbosity :: Ptr (Xkb_context) -> IO (CInt)

-- foreign import capi "xkbcommon/xkbcommon.h xkb_context_set_log_fn"
--     xkb_context_set_log_fn :: Ptr (Xkb_context) -> !!Unimplemented: void (*)(struct xkb_context *, enum xkb_log_level, const char *, struct __va_list_tag *)!! -> IO (())

{{ enum
    xkb_keymap_compile_flags,
    XKB_KEYMAP_COMPILE_NO_FLAGS,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_names"
    xkb_keymap_new_from_names :: Ptr (Xkb_context) -> Ptr (Xkb_rule_names) -> Xkb_keymap_compile_flags -> IO (Ptr (Xkb_keymap))

{{ enum
    xkb_keymap_format,
    XKB_KEYMAP_FORMAT_TEXT_V1,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_file"
    xkb_keymap_new_from_file :: Ptr (Xkb_context) -> Ptr (_IO_FILE) -> Xkb_keymap_format -> Xkb_keymap_compile_flags -> IO (Ptr (Xkb_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_string"
    xkb_keymap_new_from_string :: Ptr (Xkb_context) -> Ptr (CChar) -> Xkb_keymap_format -> Xkb_keymap_compile_flags -> IO (Ptr (Xkb_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_new_from_buffer"
    xkb_keymap_new_from_buffer :: Ptr (Xkb_context) -> Ptr (CChar) -> CSize -> Xkb_keymap_format -> Xkb_keymap_compile_flags -> IO (Ptr (Xkb_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_ref"
    xkb_keymap_ref :: Ptr (Xkb_keymap) -> IO (Ptr (Xkb_keymap))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_unref"
    xkb_keymap_unref :: Ptr (Xkb_keymap) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_get_as_string"
    xkb_keymap_get_as_string :: Ptr (Xkb_keymap) -> Xkb_keymap_format -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_min_keycode"
    xkb_keymap_min_keycode :: Ptr (Xkb_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_max_keycode"
    xkb_keymap_max_keycode :: Ptr (Xkb_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_for_each"
    xkb_keymap_key_for_each :: Ptr (Xkb_keymap) -> void (*)(struct xkb_keymap *, xkb_keycode_t, void *) -> Ptr (()) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_get_name"
    xkb_keymap_key_get_name :: Ptr (Xkb_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_by_name"
    xkb_keymap_key_by_name :: Ptr (Xkb_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_mods"
    xkb_keymap_num_mods :: Ptr (Xkb_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_mod_get_name"
    xkb_keymap_mod_get_name :: Ptr (Xkb_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_mod_get_index"
    xkb_keymap_mod_get_index :: Ptr (Xkb_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_layouts"
    xkb_keymap_num_layouts :: Ptr (Xkb_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_layout_get_name"
    xkb_keymap_layout_get_name :: Ptr (Xkb_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_layout_get_index"
    xkb_keymap_layout_get_index :: Ptr (Xkb_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_leds"
    xkb_keymap_num_leds :: Ptr (Xkb_keymap) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_led_get_name"
    xkb_keymap_led_get_name :: Ptr (Xkb_keymap) -> CUInt -> IO (Ptr (CChar))

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_led_get_index"
    xkb_keymap_led_get_index :: Ptr (Xkb_keymap) -> Ptr (CChar) -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_layouts_for_key"
    xkb_keymap_num_layouts_for_key :: Ptr (Xkb_keymap) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_num_levels_for_key"
    xkb_keymap_num_levels_for_key :: Ptr (Xkb_keymap) -> CUInt -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_get_mods_for_level"
    xkb_keymap_key_get_mods_for_level :: Ptr (Xkb_keymap) -> CUInt -> CUInt -> CUInt -> Ptr (CUInt) -> CSize -> IO (CSize)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_get_syms_by_level"
    xkb_keymap_key_get_syms_by_level :: Ptr (Xkb_keymap) -> CUInt -> CUInt -> CUInt -> Ptr (Ptr (CUInt)) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_keymap_key_repeats"
    xkb_keymap_key_repeats :: Ptr (Xkb_keymap) -> CUInt -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_new"
    xkb_state_new :: Ptr (Xkb_keymap) -> IO (Ptr (Xkb_state))

foreign import capi "xkbcommon/xkbcommon.h xkb_state_ref"
    xkb_state_ref :: Ptr (Xkb_state) -> IO (Ptr (Xkb_state))

foreign import capi "xkbcommon/xkbcommon.h xkb_state_unref"
    xkb_state_unref :: Ptr (Xkb_state) -> IO (())

foreign import capi "xkbcommon/xkbcommon.h xkb_state_get_keymap"
    xkb_state_get_keymap :: Ptr (Xkb_state) -> IO (Ptr (Xkb_keymap))

{{ enum
    xkb_key_direction,
    XKB_KEY_UP,
    XKB_KEY_DOWN,
}}

{{ enum
    xkb_state_component,
    XKB_STATE_MODS_DEPRESSED,
    XKB_STATE_MODS_LATCHED,
    XKB_STATE_MODS_LOCKED,
    XKB_STATE_MODS_EFFECTIVE,
    XKB_STATE_LAYOUT_DEPRESSED,
    XKB_STATE_LAYOUT_LATCHED,
    XKB_STATE_LAYOUT_LOCKED,
    XKB_STATE_LAYOUT_EFFECTIVE,
    XKB_STATE_LEDS,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_state_update_key"
    xkb_state_update_key :: Ptr (Xkb_state) -> CUInt -> Xkb_key_direction -> IO (Xkb_state_component)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_update_mask"
    xkb_state_update_mask :: Ptr (Xkb_state) -> CUInt -> CUInt -> CUInt -> CUInt -> CUInt -> CUInt -> IO (Xkb_state_component)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_syms"
    xkb_state_key_get_syms :: Ptr (Xkb_state) -> CUInt -> Ptr (Ptr (CUInt)) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_utf8"
    xkb_state_key_get_utf8 :: Ptr (Xkb_state) -> CUInt -> Ptr (CChar) -> CSize -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_utf32"
    xkb_state_key_get_utf32 :: Ptr (Xkb_state) -> CUInt -> IO (Word32)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_one_sym"
    xkb_state_key_get_one_sym :: Ptr (Xkb_state) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_layout"
    xkb_state_key_get_layout :: Ptr (Xkb_state) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_level"
    xkb_state_key_get_level :: Ptr (Xkb_state) -> CUInt -> CUInt -> IO (CUInt)

{{ enum
    xkb_state_match,
    XKB_STATE_MATCH_ANY,
    XKB_STATE_MATCH_ALL,
    XKB_STATE_MATCH_NON_EXCLUSIVE,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_state_serialize_mods"
    xkb_state_serialize_mods :: Ptr (Xkb_state) -> Xkb_state_component -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_serialize_layout"
    xkb_state_serialize_layout :: Ptr (Xkb_state) -> Xkb_state_component -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_name_is_active"
    xkb_state_mod_name_is_active :: Ptr (Xkb_state) -> Ptr (CChar) -> Xkb_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_names_are_active"
    xkb_state_mod_names_are_active :: Ptr (Xkb_state) -> Xkb_state_component -> Xkb_state_match -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_index_is_active"
    xkb_state_mod_index_is_active :: Ptr (Xkb_state) -> CUInt -> Xkb_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_indices_are_active"
    xkb_state_mod_indices_are_active :: Ptr (Xkb_state) -> Xkb_state_component -> Xkb_state_match -> IO (CInt)

{{ enum
    xkb_consumed_mode,
    XKB_CONSUMED_MODE_XKB,
    XKB_CONSUMED_MODE_GTK,
}}

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_consumed_mods2"
    xkb_state_key_get_consumed_mods2 :: Ptr (Xkb_state) -> CUInt -> Xkb_consumed_mode -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_key_get_consumed_mods"
    xkb_state_key_get_consumed_mods :: Ptr (Xkb_state) -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_index_is_consumed2"
    xkb_state_mod_index_is_consumed2 :: Ptr (Xkb_state) -> CUInt -> CUInt -> Xkb_consumed_mode -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_index_is_consumed"
    xkb_state_mod_index_is_consumed :: Ptr (Xkb_state) -> CUInt -> CUInt -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_mod_mask_remove_consumed"
    xkb_state_mod_mask_remove_consumed :: Ptr (Xkb_state) -> CUInt -> CUInt -> IO (CUInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_layout_name_is_active"
    xkb_state_layout_name_is_active :: Ptr (Xkb_state) -> Ptr (CChar) -> Xkb_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_layout_index_is_active"
    xkb_state_layout_index_is_active :: Ptr (Xkb_state) -> CUInt -> Xkb_state_component -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_led_name_is_active"
    xkb_state_led_name_is_active :: Ptr (Xkb_state) -> Ptr (CChar) -> IO (CInt)

foreign import capi "xkbcommon/xkbcommon.h xkb_state_led_index_is_active"
    xkb_state_led_index_is_active :: Ptr (Xkb_state) -> CUInt -> IO (CInt)
