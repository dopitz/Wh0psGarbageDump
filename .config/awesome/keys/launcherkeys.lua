local mod           = require("keys.modkeys")

local function confirm(text, action) 
  awful.prompt.run {
    prompt       = text .. " (Y/n): ",
    textbox      = awful.screen.focused().mypromptbox.widget,
    exe_callback = function(res) if res == "" or res == "y" or res == "Y" then action() end end
  }
end


local launcherkeys = {}

function launcherkeys.keys (awful, menubar, terminal)
  return awful.util.table.join(
    awful.key({ mod.super }, "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "prompt launcher (run)", group = "launcher"}),
    awful.key({ mod.super }, "c", function() menubar.show() end,
              {description = "prompt menubar", group = "launcher"}),
    awful.key({ mod.super }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "prompt lua", group = "launcher"}),
    awful.key({ mod.super,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"})
  )
end

return launcherkeys
