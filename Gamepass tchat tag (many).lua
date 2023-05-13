
local gamepassIdVIP = 0 -- Gamepass1 ID
local gamepassIdMiniVIP = 0 -- Gamepass2 ID

local service = game:GetService("MarketplaceService")

game.Players.PlayerAdded:Connect(function(player)
	if service:UserOwnsGamePassAsync(player.UserId, gamepassIdVIP) then
		local tags = {
			{
				TagText = "VIP", -- Tag -- first to be give
				TagColor = Color3.fromRGB(255, 255, 0) -- Gamepass1 Color
			}
		}
		local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
		local speaker = nil
		while speaker == nil do
			speaker = ChatService:GetSpeaker(player.Name)
			if speaker ~= nil then break end
			wait(0.01)
		end
		speaker:SetExtraData("Tags", tags)
		speaker:SetExtraData("ChatColor", Color3.fromRGB(255, 255, 0)) -- Text Color
	elseif service:UserOwnsGamePassAsync(player.UserId, gamepassIdMiniVIP) then
		local tags = {
			{
				TagText = "Mini VIP", -- Tag -- second to be give if he dont have fist one
				TagColor = Color3.fromRGB(0, 255, 0) -- Gamepass2 Color
			}
		}
		local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner").ChatService)
		local speaker = nil
		while speaker == nil do
			speaker = ChatService:GetSpeaker(player.Name)
			if speaker ~= nil then break end
			wait(0.01)
		end
		speaker:SetExtraData("Tags", tags)
		speaker:SetExtraData("ChatColor", Color3.fromRGB(0, 255, 0)) -- Text Color
	end
end)
