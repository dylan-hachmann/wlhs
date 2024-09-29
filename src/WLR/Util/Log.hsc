{-# LANGUAGE PatternSynonyms #-}

module WLR.Util.Log where

#include <wlr/util/log.h>

import Foreign
import Foreign.C.Types
import Foreign.C.String

type WLR_log_importance = CInt

pattern WLR_SILENT :: (Eq a, Num a) => a
pattern WLR_SILENT = #const WLR_SILENT

pattern WLR_ERROR :: (Eq a, Num a) => a
pattern WLR_ERROR = #const WLR_ERROR

pattern WLR_INFO :: (Eq a, Num a) => a
pattern WLR_INFO = #const WLR_INFO

pattern WLR_DEBUG :: (Eq a, Num a) => a
pattern WLR_DEBUG = #const WLR_DEBUG

pattern WLR_LOG_IMPORTANCE_LAST :: (Eq a, Num a) => a
pattern WLR_LOG_IMPORTANCE_LAST = #const WLR_LOG_IMPORTANCE_LAST

-- | Note: C @wlr_log_func_t@ contains a @va_list@, so it cannot be
-- directly marshalled to Haskell.
type WLR_log_func_t = ()

foreign import capi "wlr/util/log.h wlr_log_init"
    wlr_log_init :: WLR_log_importance -> FunPtr WLR_log_func_t -> IO ()

foreign import capi "wlr/util/log.h _wlr_log"
  c_wlr_log :: WLR_log_importance -> CString -> CString -> IO ()

-- | Haskell wrapper for the C `_wlr_log` function.
--   Passes a format string ("%s") and the actual message.
--   This is a hack to get around the variadic function, it reduces the expressivness of the function
--   but its not hard to convert any values to strings before passing them to be logged
wlr_log :: WLR_log_importance -> String -> IO ()
wlr_log level message = 
    withCString "%s" $ \fmt -> 
        withCString message $ \c_message -> 
            c_wlr_log level fmt c_message
