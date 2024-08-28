--[[
	Begotten III: Jesus Wept
--]]

-- A function to get the battery text.
function cwPowerArmor:GetBatteryText()
	local battery = Clockwork.Client:GetNetVar("battery", 0);
	local text = "No Information";

	if (battery) then
		if (battery <= 100 and battery >= 90) then
			text = "Полностью Заряжен";
		elseif (battery < 90 and battery >= 30) then
			text = "Заряжен";
		elseif (battery < 30 and battery >= 1) then
			text = "Мало Заряда";
		elseif (battery <= 0) then
			text = "Пуст";
		end;
	end;
	
	return text;
end;

-- Called when the bars are needed.
function cwPowerArmor:GetBars(bars)
	if Clockwork.Client:IsWearingPowerArmor() then
		local battery = Clockwork.Client:GetNetVar("battery", 0);
		
		--if (battery < 100) then
			local color = Color(0, 200, 255);
			local batteryText = self:GetBatteryText();
			
			if (battery) then
				if (!self.battery) then
					self.battery = battery;
				else
					self.battery = math.Approach(self.battery, battery, 1);
				end;
				
				bars:Add("БАТАРЕЯ", color, batteryText, self.battery, 100, self.battery < 10);
			end;
		--end;
	end;
end;