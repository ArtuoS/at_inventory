local logger = include("autorun/server/sv_logger.lua")
local ply = FindMetaTable("Player")
local items = {}

-- [Region] Local functions
local function getItemIndex(item)
    for k, v in ipairs(items) do
        if (string.find(item.name, v.name)) then
            return k
        end
    end

    return -1
end

local function addPlayerIdToItem(id, item)
    item.playerId = id
    return item
end
-- [End Region]

-- [Region] Public functions
function ply:AddItem(item)
    addPlayerIdToItem(self:SteamID64(), item)
    local itm = items[getItemIndex(item)]
    if (not itm) then 
        table.insert(items, item)
        logger.LogInfo(item.name .. " added")
    else
        logger.LogInfo(self:Nick() .. " already owns a " .. itm.name .. " increasing quantity.")
        
        itm.quantity = itm.quantity + item.quantity

        logger.LogInfo("Success, now " .. self:Nick() .. " owns " .. itm.quantity .. " pieces of " .. itm.name)
    end
end

function ply:RemoveItem(item)
    for k, v in ipairs(items) do
        if (string.find(item.name, v.name) and item.playerId == self:SteamID64()) then
            if (item.quantity > 1) then
                item.quantity = item.quantity - 1
            else
                table.remove(items, k)
                logger.LogInfo(v.name .. " removed from " .. self:Nick() .. " inventory.")
            end
        end
    end
end

function ply:GetItems()
    return items
end

function ply:GetItemToPlayer(item)
    for k, v in pairs(items) do
        if (string.find(item, v.name) and v.playerId == self:SteamID64()) then
            self:Give(v.name)
            self:RemoveItem(v)
            return 
        end
    end

    logger.LogInfo("You ain't got no weapons of this type.")
end
-- [End Region]