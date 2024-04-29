local crush = peripheral.wrap("create:item_vault_7")
local blast = peripheral.wrap("create:item_vault_6")
local wash = peripheral.wrap("create:item_vault_5")
local haunt = peripheral.wrap("create:item_vault_4")
local lavaCompact = peripheral.wrap("create:item_vault_1")
local mix = peripheral.wrap("create:item_vault_2")
local press = peripheral.wrap("create:item_vault_3")

-- Import item functions
local items = require("items")


-- Crush
function crush(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(crush, itemID, 64)
end

-- Blast
function blast(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(blast, itemID, 64)
end

-- Wash
function wash(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(wash, itemID, 64)
end

-- Haunt
function haunt(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(haunt, itemID, 64)
end

-- lavaCompact
function lavaCompact(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(lavaCompact, itemID, 64)
end

-- mix
function mix(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(mix, itemID, 64)
end

-- press
function press(itemName)
    local itemID = items.getID(itemName)
    items.pullFromDrawer(press, itemID, 64)
end

return {
    crush = crush,
    blast = blast,
    wash = wash,
    haunt = haunt,
    lavaCompact = lavaCompact,
    mix = mix,
    press = press
}
