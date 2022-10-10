-- Based on Awesome WM configuration template @ github.com/lcpz

-- -------------- --
-- ---- LIBS ---- --
-- -------------- --
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
  
-- my own stuff
local mod           = require("utils.modkeys")
local sysutils      = require("utils.sysutils")
local launcherutils = require("utils.launcherutils")
local tagutils      = require("utils.tagutils")
local clientutils   = require("utils.clientutils")
local xrandr        = require("utils.xrandr")

local banshee       = require("banshee")



-- ------------------------ --
-- ---- ERROR HANDLING ---- --
-- ------------------------ --
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end



-- ---------------------------------------- --
-- ---- AUTOSTART WINDOWLESS PROCESSES ---- --
-- ---------------------------------------- --
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        findme = cmd
        firstspace = cmd:find(" ")
        if firstspace then
            findme = cmd:sub(0, firstspace-1)
        end
        awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd))
    end
end

run_once({ "unclutter -root" }) -- entries must be comma-separated



-- ------------------------------ --
-- ---- VARIABLE DEFINITIONS ---- --
-- ------------------------------ --
local terminal     = "gnome-terminal"

launcherutils.terminal = terminal


awful.util.terminal = terminal
awful.util.tagnames = tagutils.names
awful.layout.layouts = tagutils.layouts
awful.util.taglist_buttons = tagutils.buttons

-- highly modified, but the icons are based on the powerarrow theme from https://github.com/lcpz/awesome-copycats
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "awesomelaawesome")
beautiful.init(theme_path)

-- needs to be set 
clientutils.beautiful = beautiful
-- required before connect_for_each_screen
awful.util.tasklist_buttons = clientutils.tasklist_buttons



-- -------------- --
-- ---- MENU ---- --
-- -------------- --
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "restart", awesome.restart },
    { "log out (quit awesome)", function() awesome.quit() end }
}
awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or 16,
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        { "Open terminal", terminal },
    },
    after = {
    }
})
menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it



-- ---------------- --
-- ---- SCREEN ---- --
-- ---------------- --
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)


function capture(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return s
end

-- ---------------------- --
-- ---- KEY BINDINGS ---- --
-- ---------------------- --
globalkeys = awful.util.table.join(

    -- Layout 
    awful.key({ mod.super,           }, "n", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ mod.super, mod.shifn }, "n", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ mod.super,           }, ".", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ mod.super, mod.shift }, ".", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),


    -- Widgets popups
    awful.key({ mod.alt, }, "c", function () lain.widget.calendar.show(7) end,
              {description = "show calendar", group = "widgets"}),
    awful.key({ mod.alt, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
              {description = "show weather", group = "widgets"}),

    awful.key({mod.alt, mod.super, mod.shift, }, "x", function() xrandr.xrandr() end, 
              {description = "cycle through xrandr config", group = "screen"}),

    -- Brightness
    --awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 10") end,
    --          {description = "+10%", group = "hotkeys"}),
    --awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 10") end,
    --          {description = "-10%", group = "hotkeys"}),

    -- volume control
    awful.key({ mod.ctrl }, "Page_Up",
    function ()
        os.execute(string.format("pactl set-sink-volume %d +1%%", beautiful.volume.device))
        beautiful.volume.update()
    end, {description = "volume up", group = "volume"}),
    awful.key({ mod.ctrl, mod.shift, }, "Page_Up",
    function ()
        os.execute(string.format("pactl set-sink-volume %d +10%%", beautiful.volume.device))
        beautiful.volume.update()
    end, {description = "volume up", group = "volume"}),

    awful.key({ mod.ctrl }, "Page_Down",
    function ()
        os.execute(string.format("pactl set-sink-volume %d -1%%", beautiful.volume.device))
        beautiful.volume.update()
    end, {description = "volume down", group = "volume"}),
    awful.key({ mod.ctrl, mod.shift, }, "Page_Down",
    function ()
        os.execute(string.format("pactl set-sink-volume %d -10%%", beautiful.volume.device))
        beautiful.volume.update()
    end, {description = "volume down", group = "volume"}),

    awful.key({ mod.ctrl }, "Delete",
    function ()
        os.execute(string.format("pactl set-sink-mute %d toggle", beautiful.volume.device))
        beautiful.volume.update()
    end, {description = "mute / unmute", group = "volume"}),

    awful.key({ mod.ctrl }, "Insert",
    function ()
        os.execute("amixer -c 3 sset Mic toggle")
        beautiful.volume.update()
    end, {description = "mute / unmute mic", group = "volume"})
)

globalkeys = awful.util.table.join(globalkeys, sysutils.keys)
globalkeys = awful.util.table.join(globalkeys, launcherutils.keys)
globalkeys = awful.util.table.join(globalkeys, tagutils.keys)
globalkeys = awful.util.table.join(globalkeys, clientutils.keys)
globalkeys = awful.util.table.join(globalkeys, banshee.keys)



clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ mod.super }, 1, awful.mouse.client.move),
    awful.button({ mod.super }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

awful.rules.rules = clientutils.make_rules()

client.connect_signal("manage", clientutils.manage)
client.connect_signal("request::titlebars", clientutils.request_titlebar)
client.connect_signal("mouse::enter", clientutils.mouse_enter)
client.connect_signal("focus", clientutils.focus)
client.connect_signal("unfocus", clientutils.unfocus)


awful.spawn("compton")
run_once({ "chromium" })
run_once({ "thunderbird" })
run_once({ "banshee" })
