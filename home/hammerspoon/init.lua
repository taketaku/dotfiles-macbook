-- cmd+space で Ghostty をトグル
hs.hotkey.bind({"cmd"}, "space", function()
  local app = hs.application.find("Ghostty")
  if app then
    if app:isFrontmost() then
      app:hide()
    else
      app:activate()
    end
  else
    hs.application.launchOrFocus("Ghostty")
  end
end)
