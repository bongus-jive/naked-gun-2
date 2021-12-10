function init()
	local clothes = effect.getParameter("clothes", {})
	
	local eid = entity.id()
	local etype = world.entityType(eid)
	
	if eid ~= effect.sourceEntity() then
		if etype == "npc" then
			for _,c in ipairs(clothes) do
				local item = world.callScriptedEntity(eid, "npc.getItemSlot", c)
				if item then
					world.callScriptedEntity(eid, "npc.setItemSlot", c, "")
					world.spawnItem(item, mcontroller.position())
				end
			end
		elseif etype == "player" then
			world.sendEntityMessage(eid, "pat_nakedgun_player", clothes)
		end
	end
	
	effect.expire()
end
