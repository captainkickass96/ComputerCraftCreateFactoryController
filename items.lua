local drawer = peripheral.wrap("storagedrawers:controller_0")

-- Define a table to map item names to their IDs
local itemIDs = {
    andesite = "minecraft:andesite",
    andesitealloy = "create:andesite_alloy",
    blackstone = "minecraft:blackstone",
    brick = "minecraft:brick",
    bricks = "minecraft:bricks",
    clay = "minecraft:clay",
    clayball = "minecraft:clay_ball",
    cobblestone = "minecraft:cobblestone",
    deadbush = "minecraft:dead_bush",
    diorite = "minecraft:diorite",
    dirt = "minecraft:dirt",
    flint = "minecraft:flint",
    glass = "minecraft:glass",
    goldnugget = "minecraft:gold_nugget",
    goldingot = "minecraft:gold_ingot",
    goldblock = "minecraft:gold_block",
    goldsheet = "create:golden_sheet",
    granite = "minecraft:granite",
    gravel = "minecraft:gravel",
    ironnugget = "minecraft:iron_nugget",
    ironingot = "minecraft:iron_ingot",
    ironblock = "minecraft:iron_block",
    ironsheet = "create:iron_sheet",
    netherbrick = "minecraft:nether_brick",
    netherbricks = "minecraft:nether_bricks",
    quartz = "minecraft:quartz",
    quartzblock = "minecraft:quartz_block",
    redsand = "minecraft:red_sand",
    sand = "minecraft:sand",
    smoothstone = "minecraft:smooth_stone",
    smoothquartzblock = "minecraft:smooth_quartz",
    soulsand = "minecraft:soul_sand",
    soulsoil = "minecraft:soul_soil",
    stone = "minecraft:stone",
    terracotta = "minecraft:terracotta"
}

-- Function to get the item ID based on the item name
function getID(itemName)
    -- Return the item ID, or nil if the item is not defined
    return itemIDs[itemName]
end


function pullFromDrawer(target, itemName, amount)
    local items = drawer.list()
    if items then
        for slot, item in pairs(items) do
            if item.name and item.name == itemName then
                drawer.pushItems(peripheral.getName(target),slot,amount)
                break
            end
        end
    end
end
--Example usage, pulls 5 diamonds from drawer and outputs to Crush
--pullFromDrawer(crush,"minecraft:diamond",5)


--Item must be already be present in drawer wall to work
function isBelowQuantity(itemName, threshold)
    itemName = getID(itemName)
    local items = drawer.list()
    if items then
        for slot, item in pairs(items) do
            if item.name == itemName and item.count < threshold then
                return true
            end
        end
    end
    return false
end

--Example usage, checks if sand is below 64, then returns true if below 64
--isBelowQuantity("minecraft,sand",64)

function itemCount(itemName)
    local count = 0
    local items = drawer.list()
    if items then
        for slot, item in pairs(items) do
            if item.name == itemName then
                count = item.count
            end
        end
    end 
    return count
end


return {
    getID = getID,
    pullFromDrawer = pullFromDrawer,
    isBelowQuantity = isBelowQuantity,
    itemCount = itemCount

}