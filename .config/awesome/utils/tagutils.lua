local mod           = require("utils.modkeys")
local awful         = require("awful")


-- view tag with name
local function goto_tag_name(s)
  if not s or #s == 0 then return end
  local t = awful.tag.find_by_name(awful.screen.focused(), s)
  if t then
    t:view_only()
  end
end

local function goto_tag_name_prompt()
    awful.prompt.run {
        prompt       = "Goto tag: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = goto_tag_name
    }
end



-- view tag with name and move focused window
local function moveto_tag_name(s)
  local c = client.focus
  if not c then return end
  if not s or #s == 0 then return end

  local t = awful.tag.find_by_name(awful.screen.focused(), s)
  if t then
    c:tags({t})
    t:view_only()
  end
end

local function moveto_tag_name_prompt()
    awful.prompt.run {
        prompt       = "Moveto tag: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = moveto_tag_name
    }
end



-- view tag at relative index d
local function goto_tag(d)
  while d > 0 do
    awful.tag.viewnext()
    d = d - 1
  end
  while d < 0 do
    awful.tag.viewprev()
    d = d + 1
  end
end

-- view tag at relative index d and move focused window
local function moveto_tag(d)
  local c = client.focus
  if not c then return end

  goto_tag(d)

  local t = awful.screen.focused().selected_tag
  if t then
    c:tags({t})
    t:view_only()
  end
end



tagging = {}

tagging.names = { 
   "a",  "o",  "e",  "u", "ga", "go", "ge", "gu", "ha", "ho", "he", "hu", 
  "ta", "to", "te", "tu", "na", "no", "ne", "nu", "sa", "so", "se", "su", 
  "browse", "mail", "music", "x" }

tagging.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.magnifier,
  awful.layout.suit.tile,
  --awful.layout.suit.fair,
  --awful.layout.suit.max.fullscreen,
  --lain.layout.cascade,
  --lain.layout.centerwork,
}

tagging.keys = awful.util.table.join(
    -- browsing (4x3 grid: up, down, left, right)
    awful.key({ mod.super, mod.ctrl }, "h", function() goto_tag(-4) end,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super, mod.ctrl }, "l", function() goto_tag(4) end,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super,          }, "h",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super,          }, "l",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    -- move window
    awful.key({ mod.super, mod.ctrl, mod.shift}, "h", function() moveto_tag(-4) end,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super, mod.ctrl, mod.shift}, "l", function() moveto_tag(4) end,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super,           mod.shift}, "h", function() moveto_tag(-1) end,
              {description = "view previous", group = "tag"}),
    awful.key({ mod.super,           mod.shift}, "l", function() moveto_tag(1) end,
              {description = "view next", group = "tag"}),
  
  
  
    -- goto tag
    awful.key({ mod.super            }, "g",  goto_tag_name_prompt,
              {description = "goto tag by name", group = "tag"}),
    -- move window
    awful.key({ mod.super, mod.shift }, "g",  moveto_tag_name_prompt,
              {description = "moveto tag by name", group = "tag"}),
  
  
  
    -- goto special tag
    awful.key({ mod.super,          }, "m",  function() goto_tag_name("browse") end,
              {description = "goto tag 'browse'", group = "tag"}),
    awful.key({ mod.super,          }, "w",  function() goto_tag_name("mail") end,
              {description = "goto tag 'mail'", group = "tag"}),
    awful.key({ mod.super,          }, "v",  function() goto_tag_name("music") end,
              {description = "goto tag 'music'", group = "tag"}),
    awful.key({ mod.super,          }, "z",  function() goto_tag_name("x") end,
              {description = "goto tag 'x'", group = "tag"}),


    awful.key({ mod.super, mod.alt }, "space",  function() goto_tag_name("a") end,
              {description = "goto tag 'a'", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "g",  function() goto_tag_name("ga") end,
              {description = "goto tag 'ga'", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "h",  function() goto_tag_name("ha") end,
              {description = "goto tag 'ha'", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "t",  function() goto_tag_name("ta") end,
              {description = "goto tag 'ta'", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "n",  function() goto_tag_name("na") end,
              {description = "goto tag 'na'", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "s",  function() goto_tag_name("sa") end,
              {description = "goto tag 'sa'", group = "tag"}),

    -- move window
    awful.key({ mod.super,           mod.shift }, "z",  function() moveto_tag_name("x") end,
              {description = "moveto tag 'x'", group = "tag"}),
    awful.key({ mod.super, mod.ctrl, mod.shift }, "m",  function() moveto_tag_name("a") end,
              {description = "moveto tag 'a'", group = "tag"}),
    awful.key({ mod.super, mod.ctrl, mod.shift }, "w",  function() moveto_tag_name("o") end,
              {description = "moveto tag 'o'", group = "tag"}),
    awful.key({ mod.super, mod.ctrl, mod.shift }, "v",  function() moveto_tag_name("e") end,
              {description = "moveto tag 'e'", group = "tag"}),
    awful.key({ mod.super, mod.ctrl, mod.shift }, "z",  function() moveto_tag_name("u") end,
              {description = "moveto tag 'u'", group = "tag"})
  )
tagging.buttons = awful.util.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ mod.super }, 1, function(t)
                                     if client.focus then
                                         client.focus:move_to_tag(t)
                                     end
                                   end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ mod.super }, 3, function(t)
                                     if client.focus then
                                         client.focus:toggle_tag(t)
                                     end
                                   end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
  )

return tagging
