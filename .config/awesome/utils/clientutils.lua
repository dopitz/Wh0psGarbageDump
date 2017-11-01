local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag

local mod           = require("utils.modkeys")
local awful         = require("awful")
local lain          = require("lain")
local wibox         = require("wibox")

clients = {}

clients.beautiful = {}
clients.keys = awful.util.table.join(
    awful.key({ mod.super,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- focus by index
    awful.key({ mod.alt, mod.shift }, "n",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ mod.alt,           }, "n",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),

    -- focus by direction
    awful.key({ mod.alt }, "j",
      function()
        awful.client.focus.bydirection("down")
        if client.focus then client.focus:raise() end
      end,
      {description = "focus down", group = "client"}),
    awful.key({ mod.alt }, "k",
      function()
        awful.client.focus.bydirection("up")
        if client.focus then client.focus:raise() end
      end,
      {description = "focus up", group = "client"}),
    awful.key({ mod.alt }, "h",
      function()
        awful.client.focus.bydirection("left")
        if client.focus then client.focus:raise() end
      end,
      {description = "focus left", group = "client"}),
    awful.key({ mod.alt }, "l",
      function()
        awful.client.focus.bydirection("right")
        if client.focus then client.focus:raise() end
      end,
      {description = "focus right", group = "client"})
  )
clients.clientkeys = awful.util.table.join(
    awful.key({ mod.super, mod.alt }, "f",
                function (c)
                  c.fullscreen = not c.fullscreen
                  c:raise()
                end,
              {description = "toggle fullscreen", group = "client"}),
    awful.key({ mod.super, mod.alt }, "c", function (c) c:kill() end,
              {description = "close client", group = "client"}),
    awful.key({ mod.super, mod.alt }, "o", function (c) c:move_to_screen() end,
              {description = "move client to screen", group = "client"})
  )
clients.tasklist_buttons = awful.util.table.join(
    awful.button({ }, 1, function (c)
                          if c == client.focus then
                            c.minimized = true
                          else
                            -- Without this, the following
                            -- :isvisible() makes no sense
                            c.minimized = false
                            if not c:isvisible() and c.first_tag then
                                c.first_tag:view_only()
                            end
                            -- This will also un-minimize
                            -- the client, if needed
                            client.focus = c
                            c:raise()
                          end
                         end),
    awful.button({ }, 3, function()
                          local instance = nil
  
                          return function ()
                            if instance and instance.wibox.visible then
                              instance:hide()
                              instance = nil
                            else
                              instance = awful.menu.clients({ theme = { width = 250 } })
                            end
                         end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
  )

-- needs to be a function so that correct beautiful is used
function clients.make_rules ()
  return {
    -- All clients will match this rule.
    { rule = { }, properties = { border_width = clients.beautiful.border_width,
                                 border_color = clients.beautiful.border_normal,
                                 focus = awful.client.focus.filter,
                                 raise = true,
                                 keys = clients.clientkeys,
                                 buttons = clientbuttons,
                                 screen = awful.screen.preferred,
                                 placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                                 size_hints_honor = false }
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = true } },

    -- Set Firefox to always map on the first tag on screen 1.
    { rule = { class = "Firefox" },
      properties = { screen = 1, tag = awful.util.tagnames[1] } },

    { rule = { class = "Thunderbird" },
      properties = { screen = 1, tag = awful.util.tagnames[2] } },

    { rule = { name = "Banshee Media Player" },
      properties = { screen = 1, tag = awful.util.tagnames[3] } },
  }
end


-- ----------------- --
-- ---- SIGNALS ---- --
-- ----------------- --
function clients.manage (c)
  if awesome.startup and
    not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end

function clients.request_titlebar (c)
  -- Custom
  if clients.beautiful.titlebar_fun then
    clients.beautiful.titlebar_fun(c)
    return
  end

  -- Default
  -- buttons for the titlebar
  local buttons = awful.util.table.join(
    awful.button({ }, 1, 
      function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
      end),
    awful.button({ }, 3, 
      function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
      end)
  )

  awful.titlebar(c, {size = 16}) : setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton (c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton   (c),
      awful.titlebar.widget.ontopbutton    (c),
      awful.titlebar.widget.closebutton    (c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end


function clients.mouse_enter (c)
  if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
    and awful.client.focus.filter(c) then
    client.focus = c
  end
end


function clients.focus (c)
  if c.maximized then -- no borders if only 1 client visible
    c.border_width = 0
  elseif #awful.screen.focused().clients > 1 then
    c.border_width = clients.beautiful.border_width
    c.border_color = clients.beautiful.border_focus
  end
end

function clients.unfocus (c)
  c.border_color = clients.beautiful.border_normal
end

return clients
