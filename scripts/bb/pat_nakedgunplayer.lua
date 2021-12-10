function init()
	message.setHandler("pat_nakedgun_player", function(_,isLocal,clothes)
		if isLocal and type(clothes) == "table" then
			for _,c in ipairs(clothes) do
				if c ~= "primary" and c ~= "alt" then
					local item = player.equippedItem(c)
					if item then
						player.setEquippedItem(c, "")
						world.spawnItem(item, mcontroller.position(), nil,nil,nil, root.assetJson("/itemdrop.config:throwIntangibleTime"))
					end
				end
			end
		end
	end)
end
