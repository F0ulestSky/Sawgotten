--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local ITEM = Clockwork.item:New();
	ITEM.name = "Большой Бутылек с Маслом";
	ITEM.model = "models/weapons/w_oil.mdl";
	ITEM.weight = 0.2;
	ITEM.useText = "Залить";
	ITEM.category = "Fuel"
	ITEM.description = "Большой бутылек с маслом.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/small_oil.png";
	ITEM.useSound = "begotten/ui/use_oil.mp3";
	ITEM.uniqueID = "large_oil";
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local activeWeapon = player:GetActiveWeapon();
		
		if (activeWeapon:GetClass() == "cw_lantern") then
			local weaponItemTable = item.GetByWeapon(activeWeapon);
			
			if weaponItemTable then
				local currentOil = weaponItemTable:GetData("oil");
				
				weaponItemTable:SetData("oil", math.Clamp(currentOil + 60, 0, 100));
				player:SetSharedVar("oil", math.Round(weaponItemTable:GetData("oil"), 0));
				
				if (currentOil + 60) > 100 then
					Schema:EasyText(player, "olive", "Часть масла не попала в лампу, по всей видимости она полна.");
				end;
				
				return;
			end
		end
		
		Schema:EasyText(player, "firebrick", "Вам нужно держать лампу в руках, чтобы наполнить ее.");
		
		return false;
	end;
	
	ITEM.itemSpawnerInfo = {category = "Industrial Junk", rarity = 200, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();