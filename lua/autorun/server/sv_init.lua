include("autorun/sh_init.lua")
include("autorun/server/sv_inventory.lua")

local function MA_PlayerSay(ply, text, team)
    if (string.find(text, "/get")) then
        text = string.Replace(text, "/get", "")
        ply:GetItemToPlayer(text)
    elseif (string.find(text, "/addToInventory")) then
        text = string.Replace(text, "/addToInventory", "")
        ply:AddItem(text)
    elseif (string.find(text, "/allItems")) then
        PrintAllItems()
    end
end

local function MA_PlayerSpawn(ply, transition)
    ply:AddItem({
        name = "m9k_colt1911",
        quantity = 500
    })
end

hook.Add("PlayerSay", "MA_PlayerSay", MA_PlayerSay)
hook.Add("PlayerSpawn", "MA_PlayerSpawn", MA_PlayerSpawn)