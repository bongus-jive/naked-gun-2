function init()
  effect.expire()

  local entityId = entity.id()
  if entityId == effect.sourceEntity() then return end

  local entityType = world.entityType(entityId)
  local slots = effect.getParameter("clothes", {})

  if entityType == "player" then
    world.sendEntityMessage(entityId, "pat_nakedgun_player", slots)
  elseif entityType == "npc" then
    npcNaked(entityId, slots)
  end
end

function npcNaked(entityId, slots)
  local function call(...)
    return world.callScriptedEntity(entityId, ...)
  end

  local position = mcontroller.position()

  for _, slot in ipairs(slots) do
    local item = call("npc.getItemSlot", slot)
    if item then
      call("npc.setItemSlot", slot, "")
      world.spawnItem(item, position)
    end
  end
end
