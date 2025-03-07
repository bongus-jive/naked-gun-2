function init()
  message.setHandler("pat_nakedgun_player", function(_, isLocal, ...)
    if isLocal then naked(...) end
  end)
end

function naked(slots)
  if type(slots) ~= "table" then return end

  local position = mcontroller.position()
  local intangibleTime = root.assetJson("/itemdrop.config:throwIntangibleTime")

  for _, slot in ipairs(slots) do
    local isSlot, item = pcall(player.equippedItem, slot)

    if isSlot and item then
      player.setEquippedItem(slot, "")
      world.spawnItem(item, position, nil, nil, nil, intangibleTime)
    end
  end
end
