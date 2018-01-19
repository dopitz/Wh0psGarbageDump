local mod           = require("utils.modkeys")
local awful         = require("awful")

tagging = {}

tagging.current_tag = "a"
tagging.current_group = " "


-- -------------------------------------- --
--  Casting tagname to/from group + name
-- -------------------------------------- --
local function make_tag_name(gn, tn) 
  if gn == "x" or gn == "z" then
    if tn == "a" then return "browse" end
    if tn == "o" then return "mail" end
    if tn == "e" then return "music" end
    if tn == "u" then return "x" end
  elseif gn == " " then
    if not tn then return " a" end
    return tn 
  else
    if not tn then return gn .. "a" end
    return gn .. tn
  end 
end
local function get_tag_group(s) 
  if s == "browse" then return "x" 
  elseif s == "mail" then return "x" 
  elseif s == "music" then return "x" 
  elseif #s >= 1 then return string.sub(s, 1, 1)
  else return nil
  end
end
local function get_tag_name(s) 
  if s == "browse" then return "a" 
  elseif s == "mail" then return "o" 
  elseif s == "music" then return "e"
  elseif #s == 2 then return string.sub(s, 2, 2)
  else return nil
  end
end




-- ---------------- --
--  Switching tags
-- ---------------- --
function tagging.goto_tag(gn, tn)
  local t = awful.tag.find_by_name(awful.screen.focused(), make_tag_name(gn, tn))
  if t then
    t:view_only()

    tagging.current_tag = tn
    tagging.current_group = gn 
  end
end
function tagging.moveto_tag(gn, tn)
  local c = client.focus
  if not c then return end

  tagging.goto_tag(gn, tn)

  local t = awful.screen.focused().selected_tag
  if t then
    c:tags({t})
  end
end


-- ------------------------------ --
--  Calculate next/previous tags
-- ------------------------------ --
function tagging.get_next_group()
  if tagging.current_group == " " then return "g" end
  if tagging.current_group == "g" then return "h" end
  if tagging.current_group == "h" then return "t" end
  if tagging.current_group == "t" then return "n" end
  if tagging.current_group == "n" then return "s" end
  if tagging.current_group == "s" then return "x" end
  if tagging.current_group == "x" then return " " end
end
function tagging.get_prev_group()
  if tagging.current_group == " " then return "x" end
  if tagging.current_group == "g" then return " " end
  if tagging.current_group == "h" then return "g" end
  if tagging.current_group == "t" then return "h" end
  if tagging.current_group == "n" then return "t" end
  if tagging.current_group == "s" then return "n" end
  if tagging.current_group == "x" then return "s" end
end
function tagging.get_next(modgroup)
  gn = tagging.current_group
  if tagging.current_tag == "a" then tn = "o"
  elseif tagging.current_tag == "o" then tn = "e" 
  elseif tagging.current_tag == "e" then tn = "u" 
  elseif tagging.current_tag == "u" then 
    tn = "a" 
    if not modgroup then gn = tagging.get_next_group() end
  end

  return { group = gn, name = tn }
end
function tagging.get_prev(modgroup)
  gn = tagging.current_group
  if tagging.current_tag == "a" then 
    tn = "u"
    if not modgroup then gn = tagging.get_prev_group() end
  elseif tagging.current_tag == "o" then tn = "a" 
  elseif tagging.current_tag == "e" then tn = "o" 
  elseif tagging.current_tag == "u" then tn = "e" end

  return { group = gn, name = tn }
end


-- ------------------------------ --
--  Switch to next/previous tags
-- ------------------------------ --
function tagging.goto_next(modgroup)
  t = tagging.get_next(modgroup)
  tagging.goto_tag(t.group, t.name)
end
function tagging.goto_prev(modgroup)
  t = tagging.get_prev(modgroup)
  tagging.goto_tag(t.group, t.name)
end
function tagging.moveto_next(modgroup)
  t = tagging.get_next(modgroup)
  tagging.moveto_tag(t.group, t.name)
end
function tagging.moveto_prev(modgroup)
  t = tagging.get_prev(modgroup)
  tagging.moveto_tag(t.group, t.name)
end


-- ---------------------- --
--  Switch to tags group
-- ---------------------- --
function tagging.goto_tag_group(gn)
  if not gn or #gn == 0 then return end

  if tagging.current_group == gn then 
    tagging.goto_next(true)
  else
    tagging.goto_tag(gn, "a")
  end
end
function tagging.moveto_tag_group(gn)
  if not gn or #gn == 0 then return end

  if tagging.current_group == gn then 
    tagging.moveto_next(true)
  else
    tagging.moveto_tag(gn, "a")
  end
end



-- -------------------------- --
--  Switch to tags by prompt
-- -------------------------- --
function tagging.goto_tag_prompt()
    awful.prompt.run {
        prompt       = "Goto tag: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = function(s)
          gn = get_tag_group(s)
          tn = get_tag_name(s)
          tagging.goto_tag(gn, tn)
        end
    }
end
function tagging.moveto_tag_prompt()
    awful.prompt.run {
        prompt       = "Moveto tag: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = function(s)
          gn = get_tag_group(s)
          tn = get_tag_name(s)
          tagging.moveto_tag(gn, tn)
        end
    }
end


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
    ---- browsing (left / right)
    awful.key({ mod.super }, "h", function() tagging.goto_prev(false) end,
              {description = "goto previous tag", group = "tag"}),
    awful.key({ mod.super }, "l", function() tagging.goto_next(false) end,
              {description = "view next tag", group = "tag"}),
    ---- move window
    awful.key({ mod.super, mod.shift }, "h", function() tagging.moveto_prev(false) end,
              {description = "move window to previous tag", group = "tag"}),
    awful.key({ mod.super, mod.shift }, "l", function() tagging.moveto_next(false) end,
              {description = "move window to next tag", group = "tag"}),
  
  
    ---- browsing (prompt)
    awful.key({ mod.super            }, "g", tagging.goto_tag_prompt,
              {description = "goto tag by prompt", group = "tag"}),
    ---- move window
    awful.key({ mod.super, mod.shift }, "g",  moveto_tag_prompt,
              {description = "moveto tag by prompt", group = "tag"}),
  


    ---- browsing (by group)
    awful.key({ mod.super, mod.alt }, "space",  function() tagging.goto_tag_group(" ") end,
              {description = "cycle tags in ' '-group", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "g",  function() tagging.goto_tag_group("g") end,
              {description = "cycle tags in 'g'-group", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "h",  function() tagging.goto_tag_group("h") end,
              {description = "cycle tags in 'h'-group", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "t",  function() tagging.goto_tag_group("t") end,
              {description = "cycle tags in 't'-group", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "n",  function() tagging.goto_tag_group("n") end,
              {description = "cycle tags in 'n'-group", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "s",  function() tagging.goto_tag_group("s") end,
              {description = "cycle tags in 's'-group", group = "tag"}),
    awful.key({ mod.super, mod.alt }, "z",  function() tagging.goto_tag_group("x") end,
              {description = "cycle tags in 'x'-group", group = "tag"}),

    ---- move window
    awful.key({ mod.super, mod.alt, mod.shift }, "space",  function() tagging.moveto_tag_group(" ") end,
              {description = "cycle tags in ' '-group + move window", group = "tag"}),
    awful.key({ mod.super, mod.alt, mod.shift }, "g",  function() tagging.moveto_tag_group("g") end,
              {description = "cycle tags in 'g'-group + move window", group = "tag"}),
    awful.key({ mod.super, mod.alt, mod.shift }, "h",  function() tagging.moveto_tag_group("h") end,
              {description = "cycle tags in 'h'-group + move window", group = "tag"}),
    awful.key({ mod.super, mod.alt, mod.shift }, "t",  function() tagging.moveto_tag_group("t") end,
              {description = "cycle tags in 't'-group + move window", group = "tag"}),
    awful.key({ mod.super, mod.alt, mod.shift }, "n",  function() tagging.moveto_tag_group("n") end,
              {description = "cycle tags in 'n'-group + move window", group = "tag"}),
    awful.key({ mod.super, mod.alt, mod.shift }, "s",  function() tagging.moveto_tag_group("s") end,
              {description = "cycle tags in 's'-group + move window", group = "tag"}),
    awful.key({ mod.super, mod.alt, mod.shift }, "z",  function() tagging.moveto_tag_group("x") end,
              {description = "cycle tags in 'x'-group + move window", group = "tag"}),



    ---- browsing (special group)
    awful.key({ mod.super }, "m",  function() tagging.goto_tag("x", "a") end,
              {description = "goto tag 'browse'", group = "tag"}),
    awful.key({ mod.super }, "w",  function() tagging.goto_tag("x", "o") end,
              {description = "goto tag 'mail'", group = "tag"}),
    awful.key({ mod.super }, "v",  function() tagging.goto_tag("x", "e") end,
              {description = "goto tag 'music'", group = "tag"}),
    awful.key({ mod.super }, "z",  function() tagging.goto_tag("x", "u") end,
              {description = "goto tag 'x'", group = "tag"})
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
