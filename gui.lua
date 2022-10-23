--Colors
_G.ButtonColor = Color3.fromRGB(88,101,242);
_G.ArrowColor = Color3.fromRGB(153, 170, 181)
_G.PointerColor = Color3.fromRGB(64, 78, 237)
_G.MainColor = Color3.fromRGB(35, 39, 42)
_G.SecondaryColor = Color3.fromRGB(44, 47, 51)
_G.TertiaryColor = Color3.fromRGB(35,39,42)
_G.TertiaryColor = Color3.fromRGB(35,39,42)
_G.ButtonTextColor = Color3.fromRGB(255,255,255)
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Refinery Caves")
local tp = w:CreateFolder("Teleports")
local terr = w:CreateFolder("Terrain")
local svr = w:CreateFolder("Server")
local pl = w:CreateFolder("Player")
local guis = w:CreateFolder("Other Guis")
local cred = w:CreateFolder("Credits")

--Teleports
tp:Button("Sellary",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-456.0484924316406, 5.749998569488525, -63.9598388671875)
end)

tp:Button("UCS",function()
    
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-982.7343139648438, 4.250003814697266, -625.3618774414062)
end)

tp:Button("Land",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1007.2172241210938, 4.250003814697266, -706.519287109375)
end)

tp:Button("Antsishop",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-102.39867401123047, 239.74998474121094, 1111.51220703125)
end)

tp:Button("Pickaxe Shop",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(724.8688354492188, 2.25, 67.02054595947266)
end)

tp:Button("M's Dealership",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(695.4474487304688, 7.749998569488525, -1016.9757080078125)
end)

tp:Button("Furniture Shop",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1018.7679443359375, 3.7499992847442627, 715.6312255859375)
end)

tp:Button("Meteor Rug",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3480.01904296875, 17.24998664855957, 1045.142578125)
end)

tp:Button("Secret Shack",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-516.3101196289062, 4.250003814697266, -664.3888549804688)
end)

tp:Button("Sunstone",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1033.216064453125, 254.0724639892578, 50.361515045166016)
end)

tp:Button("Purple Cave",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1818.052734375, -5.250001430511475, -120.2309799194336)
end)

tp:Button("Crystal Cave",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1200.492919921875, -197.7500457763672, 1129.785400390625)
end)

tp:Button("Fiery",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2930.301513671875, -750.8269653320312, 2541.494873046875)
end)

tp:Button("Trusty",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.85374450683594, 88.7499771118164, 1050.7041015625)
end)

tp:Button("Cloudnite",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(562.3346557617188, 431.7497253417969, 1031.13720703125)
end)

--Terrain
terr:Button("Delete Water",function()
    print("Water deleted")
	game:GetService("Workspace").Map.Water:Destroy()
end)

terr:Button("No Water Blur",function()
    print("Water deleted")
	game:GetService("Lighting").WaterBlur:Destroy()
end)

terr:Button("Delete Death Pit",function()
	print("Death Pit deleted.")
	game:GetService("Workspace").Map.Terrain.DeathPit:Destroy()
end)

--Server
svr:Button("Esp purple tree",function()
    game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "HeinnzHub", 
		Text = "If there is a purple tree in server, it will esp."
	})
	loadstring(game:HttpGet("https://raw.githubusercontent.com/HEINHARDT/HeinnzHub/main/EspPurpleTree.lua"))()
end)

svr:Button("Esp rare ores",function()
    game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "HeinnzHub", 
		Text = "If there is any rare ore in server, it will esp.",
	})
	loadstring(game:HttpGet("https://raw.githubusercontent.com/HEINHARDT/HeinnzHub/main/RareOreEsp.lua"))()
end)

svr:Button("Rejoin server",function()
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:Teleport(game.PlaceId, p)
end)

svr:Button("Server hop",function()
    local Player = game.Players.LocalPlayer
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"
	local _place,_id = game.PlaceId, game.JobId
	local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
	
	function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Next; repeat
		local Servers = ListServers(Next)
		for i,v in next, Servers.data do
			if v.playing < v.maxPlayers and v.id ~= _id then
				local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
				if s then break end
			end
		end

		Next = Servers.nextPageCursor
	until not Next
end)

--Player
pl:Slider("Walk Speed",{
    min = 16; -- min value of the slider
    max = 500; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

pl:Slider("Jump Power",{
    min = 16; -- min value of the slider
    max = 500; -- max value of the slider
    precise = false; -- max 2 decimals
},function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

pl:Button("No Damage",function()
    game.Players.LocalPlayer.PlayerGui.ClientScreenScript.Disabled = true
    game:GetService("Workspace").Map.Terrain.DeathPit:Destroy()
end)

guis:Button("Infinite Yield",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

guis:Button("Auto Farm/Sell Ore",function()
loadstring(game:HttpGet('https://scripts.luawl.com/13008/RefineryCaves.lua'))()
end)

cred:Label("Heinnz#7894",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); 
    BgColor = Color3.fromRGB(44, 47, 51)
	}) 
cred:DestroyGui()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HEINHARDT/refinery_gui/main/check.lua",true))()
