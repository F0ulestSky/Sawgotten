--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("Radio");
COMMAND.tip = "Отправьте радиосообщение другим персонажам, которые имеют рацию с той же частотой.";
COMMAND.text = "<string Текст>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
COMMAND.arguments = 1;
COMMAND.alias = {"R"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	Clockwork.player:SayRadio(player, table.concat(arguments, " "), true);
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("ProclaimRadio");
COMMAND.tip = "Покричите в рацию, чтобы другим придуркам стало неповадно.";
COMMAND.text = "<string Text>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
COMMAND.arguments = 1;
COMMAND.alias = {"RadioProclaim"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = player:GetSharedVar("kinisgerOverride") or player:GetFaction();
	
	if (Schema:GetRankTier(faction, player:GetCharacterData("rank", 1)) >= 3) or faction == "Holy Hierarchy" or player:IsAdmin() or Clockwork.player:HasFlags(player, "P") then
		Clockwork.player:SayRadio(player, table.concat(arguments, " "), true, nil, true);
	else
		Schema:EasyText(player, "peru", "Ты недостаточно благороден, чтобы сделать это!");
	end
end;

COMMAND:Register();