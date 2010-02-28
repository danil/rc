#!/usr/bin/env wsapi.cgi

require "orbit"
require "orbit.cache"
require "cosmo"
require "markdown"

-- Orbit applications are usually modules, orbit.new does the
-- necessary initialization.
module("kutkevich", package.seeall, orbit.new)

-- Loads configuration data.
require "config/environment"

-- Initializes page cache.
local cache = orbit.cache.new(kutkevich, cache_path)

-- Models for this application. Orbit calls mapper:new for each model,
-- so if you want to replace Orbit's default ORM mapper by another one
-- (file-based, for example) just redefine the mapper global variable.
--pages = kutkevich:model "page"

local data_cache = {}

function load_data(name)
   data_cache[i18n.locale] = data_cache[i18n.locale] or {}
   local data = data_cache[i18n.locale][name]
   if not data then
      local data_file = io.open("markdown/" .. name .. "." .. i18n.locale .. ".md", "rb")
      or io.open("markdown/" .. name .. ".md", "rb")
      if data_file then
         data = markdown(data_file:read("*a"))
         data_cache[i18n.locale][name] = data
         data_file:close()
      end
   end
   return data
end

-- These are the controllers, each receives a web object that is the
-- request/response, plus any extra captures from the dispatch
-- pattern. The controller sets any extra headers and/or the status if
-- it's not 200, then return the response. It's good form to delegate
-- the generation of the response to a view function.

function homepages(web, mapping_pattern, locale)
   i18n.locale = locale or i18n.default_locale
   local env = {}
   env.url_for = url_for
   env.i18n = {
      last_modified = i18n.translate[i18n.locale].layouts.homepage.last_modified,
      locale        = i18n.locale,
      title         = i18n.translate[i18n.locale].homepages.title
   }
   env.yield = {}
   env.yield.layout     = load_view("homepages/index")(env)
   env.yield.style      = ""
   env.yield.javascript = ""
   env.yield.footer     = ""
   return load_view("layouts/homepage")(env)
end

function cv(web, mapping_pattern, locale)
   i18n.locale = locale or i18n.default_locale
   local env = {}
   env.url_for = url_for
   env.render  = render
   env.i18n = {
      last_modified = i18n.translate[i18n.locale].layouts.homepage.last_modified,
      locale        = i18n.locale,
      print         = i18n.translate[i18n.locale].cv.print,
      title         = i18n.translate[i18n.locale].cv.title
   }
   env.yield = {}
   env.yield.layout     = load_data("cv")
   env.yield.style      = load_view("cv/_style")(env)
   env.yield.javascript = load_view("cv/_javascript")(env)
   env.yield.footer     = load_view("cv/_footer")(env)
   return load_view("layouts/homepage")(env)
end

function bookmarks(web, mapping_pattern, locale)
   i18n.locale = locale or i18n.default_locale
   local env = {}
   env.url_for = url_for
   env.i18n = {
      last_modified = i18n.translate[i18n.locale].layouts.homepage.last_modified,
      locale        = i18n.locale,
      title         = i18n.translate[i18n.locale].bookmarks.title,
   }
   env.yield = {}
   env.yield.layout     = load_data("bookmark")
   env.yield.style      = ""
   env.yield.javascript = ""
   env.yield.footer     = ""
   return load_view("layouts/homepage")(env)
end

-- Builds the application's dispatch table, you can pass multiple
-- patterns, and any captures get passed to the controller.
kutkevich:dispatch_get(homepages, "/",           "(/([er][nu])/?)")
kutkevich:dispatch_get(cv,        "/cv/?",       "(/([er][nu])/cv/?)")
kutkevich:dispatch_get(bookmarks, "/bookmark/?", "(/([er][nu])/bookmark/?)")

-- These are the view functions referenced by the controllers.
-- orbit.htmlify does through the functions in the table passed
-- as the first argument and tries to match their name against
-- the provided patterns (with an implicit ^ and $ surrounding
-- the pattern. Each function that matches gets an environment
-- where HTML functions are created on demand. They either take
-- nil (empty tags), a string (text between opening and
-- closing tags), or a table with attributes and a list
-- of strings that will be the text. The indexing the
-- functions adds a class attribute to the tag. Functions
-- are cached.

-- This is a convenience function for the common parts of a page.

local view_cache = {}

function load_view(name)
   view_cache[i18n.locale] = view_cache[i18n.locale] or {}
   local view = view_cache[i18n.locale][name]
   if not view then
      local view_file = io.open("app/views/" .. name .. "." .. i18n.locale .. ".html", "rb")
      or io.open("app/views/" .. name .. ".html", "rb")
      if view_file then
         view = cosmo.compile(view_file:read("*a"))
         view_cache[i18n.locale][name] = view
         view_file:close()
      end
   end
   return view
end

local partial_cache = {}

function render(arg)
   partial_cache[i18n.locale] = partial_cache[i18n.locale] or {}
   local partial = partial_cache[i18n.locale][arg.partial]
   if not partial then
      local partial_file = io.open("app/views/" .. arg.partial .. "." .. i18n.locale .. ".html", "rb")
      or io.open("app/views/" .. arg.partial .. ".html", "rb")
      if partial_file then
         partial = cosmo.fill(partial_file:read("*a"), arg)
         partial_cache[i18n.locale][arg.partial] = partial
         partial_file:close()
      end
   end
   return partial
end

local url_cache = {}

function url_for(arg)
   local url = url_cache[arg]
   if not url then

      -- Controller.
      local controller
      local controller_name
      if not arg.controller then
         controller = "/" .. routes_root.controller
         controller_name = routes_root.controller
      elseif string.find (arg.controller, "/") then
         controller = arg.controller
         controller_name = string.gsub (arg.controller, "/", "")
      else
         controller = "/" .. arg.controller
         controller_name = arg.controller
      end

      -- Action.
      local action
      if arg.action then
         action = "/" .. arg.action
      else
         action = ""
      end

      local locale = arg.locale or i18n.locale
      if controller_name == routes_root.controller then
         url = "/" .. locale
      else
         url = "/" .. locale .. controller .. action
      end

      -- Host.
      if arg.host then
         url = "http://" .. arg.host .. url
      end

      url_cache[arg] = url
   end
   return url
end
