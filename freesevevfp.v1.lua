loadstring(game:HttpGet"https://raw.githubusercontent.com/710200999/FreeSeverVip.All/refs/heads/main/notification.v1.lua")() -- notification

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local PlaceID = game.PlaceId
local JobID = game.JobId

local function HopLowPlayerServer()
    local Servers = {}
    local req = request or http_request or syn.request
    
    local ServerData = req({
        Url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100",
        Method = "GET"
    })
    
    local Data = HttpService:JSONDecode(ServerData.Body)
    
    for i,v in pairs(Data.data) do
        if v.playing < v.maxPlayers and v.id ~= JobID then
            table.insert(Servers, v.id)
        end
    end
    
    if #Servers > 0 then
        TeleportService:TeleportToPlaceInstance(PlaceID, Servers[math.random(1,#Servers)], Players.LocalPlayer)
    end
end

HopLowPlayerServer()