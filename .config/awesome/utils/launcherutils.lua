local mod           = require("utils.modkeys")
local awful         = require("awful")
local menubar       = require("menubar")

launcher = {}

launcher.terminal = {}
launcher.keys = awful.util.table.join(
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
    awful.key({ mod.super,          }, "Return", function () awful.spawn(launcher.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ mod.super, mod.ctrl }, "Return", function () awful.spawn(launcher.terminal .. " -e lf") end,
              {description = "open ranger", group = "launcher"})
  )

return launcher
