
function init()
    effect.addStatModifierGroup({{stat = "nude", amount = 1}})
	local eid = entity.id()
	if world.isNpc(eid) then
		world.sendEntityMessage(eid, "removeClothes2")
	end

    script.setUpdateDelta(0)
end

function update(dt)

end

function uninit()
  
end
