-- put this in a part
local MS = game:GetService("MarketplaceService")
local Gamepasses = {
	{ id = 18857464, name = "VIP" },
	{ id = 18857399, name = "MiniVIP" }
}
local OpenTime = 1 -- The time the door is open for.
local OpenTrans = 0.5 -- The transparency of the door when it is open.
local CloseTrans = 0 -- The transparency of the door when it is closed.
local BuyGUI = true -- Set to false to stop the BuyGUI appearing.
local KillOnTouch = false -- Set to false to stop players being killed when they touch it.

local Door = script.Parent -- The door

Door.Touched:Connect(function(hit)
	if game.Players:GetPlayerFromCharacter(hit.Parent) then
		local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
		local owns_gamepass = false
		for _, gamepass in ipairs(Gamepasses) do
			if MS:UserOwnsGamePassAsync(plr.UserId, gamepass.id) then
				owns_gamepass = true
				break
			end
		end
		if owns_gamepass then
			Door.CanCollide, Door.Transparency = false, OpenTrans
			wait(OpenTime)
			Door.CanCollide, Door.Transparency = true, CloseTrans
		else
			Door.CanCollide, Door.Transparency = true, CloseTrans
			if BuyGUI == true then
				MS:PromptGamePassPurchase(plr, Gamepasses[1].id)
			end
			if KillOnTouch == true then
				plr.Character.Humanoid.Health = 0
			end
		end
	end
end)
