loadstring(game:HttpGet"https://raw.githubusercontent.com/710200999/notification/refs/heads/main/notification-LeaveIfAdminBloxFruitsJoin.lua")()

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlaceID = game.PlaceId
local JobID = game.JobId

-- 🔥 Username cần tránh
local TargetUsername = "mygame43"
local TargetUsername = "rip_indra"
local TargetUsername = "Uzoth"
local TargetUsername = "Zioles"
local TargetUsername = "Uzi_London"
local TargetUsername = "iSekai_iSekai"
local TargetUsername = "rokillerXD123"
local TargetUsername = "vidsmurf"
local TargetUsername = "starcode_kitt"
local TargetUsername = "StarCode_fer"

-- Hàm hop sang server ít người nhất
local function HopLowServer()
    local req = request or http_request or syn.request
    
    local ServerData = req({
        Url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100",
        Method = "GET"
    })
    
    local Data = HttpService:JSONDecode(ServerData.Body)
    
    local LowestServer = nil
    local LowestCount = math.huge
    
    for _,v in pairs(Data.data) do
        if v.playing < v.maxPlayers and v.id ~= JobID then
            if v.playing < LowestCount then
                LowestCount = v.playing
                LowestServer = v.id
            end
        end
    end
    
    if LowestServer then
        TeleportService:TeleportToPlaceInstance(PlaceID, LowestServer, LocalPlayer)
    else
        TeleportService:Teleport(PlaceID, LocalPlayer)
    end
end

-- Khi có người vào server
Players.PlayerAdded:Connect(function(player)
    if player.Name == TargetUsername then
        print("Target joined → Hopping low player server")
        HopLowServer()
    end
end)