local crush = peripheral.wrap("create:item_vault_7")
local blast = peripheral.wrap("create:item_vault_6")
local wash = peripheral.wrap("create:item_vault_5")
local haunt = peripheral.wrap("create:item_vault_4")
local lavaCompact = peripheral.wrap("create:item_vault_1")
local mix = peripheral.wrap("create:item_vault_2")
local press = peripheral.wrap("create:item_vault_3")

local items = require "items"


-- Crush
local function crush(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(crush, itemID, 64)
end

-- Blast
local function blast(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(blast, itemID, 64)
end

-- Wash
local function wash(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(wash, itemID, 64)
end

-- Haunt
local function haunt(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(haunt, itemID, 64)
end

-- lavaCompact
local function lavaCompact(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(lavaCompact, itemID, 64)
end

-- mix
local function mix(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(mix, itemID, 64)
end

-- press
local function press(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(press, itemID, 64)
end
