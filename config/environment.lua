-- Puts all the definitions below in blog's namespace.
module("kutkevich", package.seeall)
routes_root = { controller = "homepage" }
-- Comment this for in-memory caching.
cache_path = "page_cache"

-- Localization.
-- Default locale.
i18n = { default_locale = "en" }
i18n.locale = i18n.default_locale

-- Locales.
i18n.translate = {}
require "config/locales/ru"
require "config/locales/en"
