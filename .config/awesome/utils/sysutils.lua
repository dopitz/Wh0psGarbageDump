local mod           = require("utils.modkeys")
local awful         = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local function confirm(text, action) 
  awful.prompt.run {
    prompt       = text .. " (Y/n): ",
    textbox      = awful.screen.focused().mypromptbox.widget,
    exe_callback = function(res) if res == "" or res == "y" or res == "Y" then action() end end
  }
end

system = {}

system.keys = awful.util.table.join(
    awful.key({ mod.super, mod.alt, mod.ctrl}, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ mod.super, mod.alt, mod.ctrl}, "h", hotkeys_popup.show_help,
              {description = "show help", group="awesome"}),
    awful.key({ mod.super, mod.alt, mod.ctrl}, "q", function() confirm("Log out?", awesome.quit) end,
              {description = "log out (quit awesome)", group = "awesome"}),
    awful.key({ mod.super, mod.alt, mod.ctrl}, "l", function() awful.spawn("xtrlock -b") end,
              {description = "lock screen", group = "awesome"}),
    awful.key({ mod.super, mod.alt, mod.ctrl}, "s", 
                function() 
                  confirm("Suspend?", function() awful.spawn("xtrlock -b") awful.spawn("systemctl hybrid-sleep") end) 
                end,
              {description = "suspend (hybernate)", group = "awesome"}),
    awful.key({ mod.super, mod.alt, mod.ctrl}, "p", function() confirm("Power off?", function() awful.spawn("systemctl poweroff") end) end,
              {description = "power off", group = "awesome"}),
    awful.key({ mod.super, mod.alt, mod.ctrl}, "w", function() awful.util.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"})
  )

return system


