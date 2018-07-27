
local og_init = init

local CLOTHES = {"head", "headCosmetic", "chest", "chestCosmetic", "legs", "legsCosmetic", "back", "backCosmetic", "primary", "alt"}

function init()
	og_init()
	message.setHandler("removeClothes2", removeClothes2)
end

function removeClothes2()
	for _,c in ipairs(CLOTHES) do
		local item = npc.getItemSlot(c)
		if item then
			npc.setItemSlot(c, "")
			world.spawnItem(item, mcontroller.position())
		end 
	end
end
