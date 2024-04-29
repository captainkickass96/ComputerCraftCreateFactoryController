--Assumes peripherals IDs, double check for your network
local drawer = peripheral.wrap("storagedrawers:controller_0")
local monitor = peripheral.wrap("monitor_6")
-- Targets:
local crush = peripheral.wrap("create:item_vault_7")
local blast = peripheral.wrap("create:item_vault_6")
local wash = peripheral.wrap("create:item_vault_5")
local haunt = peripheral.wrap("create:item_vault_4")
local lavaCompact = peripheral.wrap("create:item_vault_1")
local mix = peripheral.wrap("create:item_vault_2")
local press = peripheral.wrap("create:item_vault_3")

--Item must be already be present in drawer wall to work
local function isBelowQuantity(itemName, threshold)
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

local function itemCount(itemName)
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

--Example usage, checks if sand is below 64, then returns true if below 64
--isBelowQuantity("minecraft,sand",64)

local function pullFromDrawer(target, itemName, amount)
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



--Item ID Definitions-- Not all are used, but are still part of storage network
local andesite = "minecraft:andesite"
local andesitealloy = "create:andesite_alloy"
local blackstone = "minecraft:blackstone"
local brick = "minecraft:brick"
local bricks = "minecraft:bricks"
local clay = "minecraft:clay"
local clayball = "minecraft:clay_ball"
local cobblestone = "minecraft:cobblestone"
local deadbush = "minecraft:dead_bush"
local diorite = "minecraft:diorite"
local dirt = "minecraft:dirt"
local flint = "minecraft:flint"
local glass = "minecraft:glass"
local goldnugget = "minecraft:gold_nugget"
local goldingot = "minecraft:gold_ingot"
local goldblock = "minecraft:gold_block"
local goldsheet = "create:golden_sheet"
local granite = "minecraft:granite"
local gravel = "minecraft:gravel"
local ironnugget = "minecraft:iron_nugget"
local ironingot = "minecraft:iron_ingot"
local ironblock = "minecraft:iron_block"
local ironsheet = "create:iron_sheet"
local netherbrick = "minecraft:nether_brick"
local netherbricks = "minecraft:nether_bricks"
local quartz = "minecraft:quartz"
local quartzblock = "minecraft:quartz_block"
local redsand = "minecraft:red_sand"
local sand = "minecraft:sand"
local smoothstone = "minecraft:smooth_stone"
local smoothquartzblock = "minecraft:smooth_quartz"
local soulsand = "minecraft:soul_sand"
local soulsoil = "minecraft:soul_soil"
local stone = "minecraft:stone"
local terracotta = "minecraft:terracotta"

local output = "cobblestone"
local prevoutput = "cobblestone"
print("Currently producing: ", prevoutput)

while true do
    if(isBelowQuantity(cobblestone, 130000)) then
        output = "cobblestone"
    elseif(isBelowQuantity(stone,65000)) then
        output = "stone"
        pullFromDrawer(blast,cobblestone,64)
    elseif(isBelowQuantity(gravel,130000)) then
        output = "gravel"
        pullFromDrawer(crush,cobblestone,64)
    elseif(isBelowQuantity(sand,65000)) then
        output = "sand"
        pullFromDrawer(crush,gravel,64)
        pullFromDrawer(crush,cobblestone,64)
    elseif(isBelowQuantity(clay, 65000)) then
        output = "clay"
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(terracotta,65000)) then
        output = "terracotta"
        pullFromDrawer(blast,clay,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(redsand, 65000)) then
        output = "redsand"
        pullFromDrawer(crush,terracotta,48)
        pullFromDrawer(blast,clay,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(soulsand, 65000)) then
        output = "soul sand"
        pullFromDrawer(haunt,sand, 48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(quartz,65000)) then
        output = "quartz"
        pullFromDrawer(wash,soulsand,48)
        pullFromDrawer(haunt,sand, 48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(ironblock,10000)) then
        output = "iron"
        pullFromDrawer(wash,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(ironsheet, 2000)) then
        output = "iron sheets"
        pullFromDrawer(press,ironingot,64)
        pullFromDrawer(wash,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(goldblock,10000)) then
        output = "gold"
        pullFromDrawer(wash,redsand,48)
        pullFromDrawer(crush,redsand,48)
        pullFromDrawer(blast,clay,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(goldsheet,2000)) then
        output = "gold sheets"
        pullFromDrawer(press,goldingot,64)
        pullFromDrawer(wash,redsand,48)
        pullFromDrawer(crush,redsand,48)
        pullFromDrawer(blast,clay,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(bricks, 65000)) then
        output = "bricks"
        pullFromDrawer(blast,clayball,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(flint,60000)) then
        output = "flint"
        pullFromDrawer(wash,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(andesite,65000)) then
        output = "andesite"
        pullFromDrawer(lavaCompact,gravel,32)
        pullFromDrawer(lavaCompact,flint,64)
        pullFromDrawer(crush,cobblestone,64)
        pullFromDrawer(wash,gravel,32)
    elseif(isBelowQuantity(andesitealloy,10000)) then
        output = "andesite alloy"
        pullFromDrawer(mix,ironnugget,32)
        pullFromDrawer(mix,andesite,32)
        pullFromDrawer(wash,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(glass,65000)) then
        output = "glass"
        pullFromDrawer(blast,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(smoothstone,65000)) then
        output = "smooth stone"
        pullFromDrawer(blast,stone,48)
        pullFromDrawer(blast,cobblestone,48)
    elseif(isBelowQuantity(granite,65000)) then
        output = "granite" 
        pullFromDrawer(lavaCompact,flint,64)
        pullFromDrawer(lavaCompact,redsand,32)
        pullFromDrawer(crush,terracotta,48)
        pullFromDrawer(blast,clay,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    elseif(isBelowQuantity(blackstone,65000)) then
        output = "blackstone"
        pullFromDrawer(haunt,cobblestone,48)
    elseif(isBelowQuantity(netherbricks,65000)) then
        output = "nether bricks"
        pullFromDrawer(haunt,brick,48)
        pullFromDrawer(blast,clayball,48)
        pullFromDrawer(wash,sand,48)
        pullFromDrawer(crush,gravel,48)
        pullFromDrawer(crush,cobblestone,48)
    end

    if prevoutput ~= output then
        prevoutput = output

        term.clear()
        monitor.clear()
        monitor.setCursorPos(1,1)
        term.setCursorPos(1,1)

        print("Currently producing: ", prevoutput)
        monitor.write("Currently producing: ")
        monitor.setCursorPos(1,2)
        monitor.write(prevoutput)
        monitor.setCursorPos(1,3)
        monitor.write("Total: ")
        monitor.write(itemCount(prevoutput))
    end
    sleep(1)
end