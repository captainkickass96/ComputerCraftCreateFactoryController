-- Utilities
local items = require "items"
local processing = require "processing"


--Assumes peripherals IDs, double check for your network
local drawer = peripheral.wrap("storagedrawers:controller_0")
local monitor = peripheral.wrap("monitor_6")


local output = "cobblestone"
local prevoutput = "cobblestone"
print("Currently producing: ", prevoutput)

while true do
    if items.isBelowQuantity(items.getItem("cobblestone"), 130000) then
        output = "cobblestone"
    elseif items.isBelowQuantity(items.getItem("stone"), 65000) then
        output = "stone"
        processing.blast("cobblestone")
    elseif items.isBelowQuantity(items.getItem("gravel"), 130000) then
        output = "gravel"
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("sand"), 65000) then
        output = "sand"
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("clay"), 65000) then
        output = "clay"
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("terracotta"), 65000) then
        output = "terracotta"
        processing.blast("clay")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("red_sand"), 65000) then
        output = "red sand"
        processing.crush("terracotta")
        processing.blast("clay")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("soul_sand"), 65000) then
        output = "soul sand"
        processing.haunt("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("quartz"), 65000) then
        output = "quartz"
        processing.wash("soul_sand")
        processing.haunt("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("iron_block"), 10000) then
        output = "iron"
        processing.wash("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("iron_sheet"), 2000) then
        output = "iron sheets"
        processing.press("iron_ingot")
        processing.wash("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("gold_block"), 10000) then
        output = "gold"
        processing.wash("red_sand")
        processing.crush("red_sand")
        processing.blast("clay")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("gold_sheet"), 2000) then
        output = "gold sheets"
        processing.press("gold_ingot")
        processing.wash("red_sand")
        processing.crush("red_sand")
        processing.blast("clay")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("bricks"), 65000) then
        output = "bricks"
        processing.blast("clay_ball")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("flint"), 60000) then
        output = "flint"
        processing.wash("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("andesite"), 65000) then
        output = "andesite"
        processing.lavaCompact("gravel")
        processing.lavaCompact("flint")
        processing.crush("cobblestone")
        processing.wash("gravel")
    elseif items.isBelowQuantity(items.getItem("andesite_alloy"), 10000) then
        output = "andesite alloy"
        processing.mix("iron_nugget")
        processing.mix("andesite")
        processing.wash("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("glass"), 65000) then
        output = "glass"
        processing.blast("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("smooth_stone"), 65000) then
        output = "smooth stone"
        processing.blast("stone")
        processing.blast("cobblestone")
    elseif items.isBelowQuantity(items.getItem("granite"), 65000) then
        output = "granite"
        processing.lavaCompact("flint")
        processing.lavaCompact("red_sand")
        processing.crush("terracotta")
        processing.blast("clay")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
    elseif items.isBelowQuantity(items.getItem("blackstone"), 65000) then
        output = "blackstone"
        processing.haunt("cobblestone")
    elseif items.isBelowQuantity(items.getItem("nether_bricks"), 65000) then
        output = "nether bricks"
        processing.haunt("brick")
        processing.blast("clay_ball")
        processing.wash("sand")
        processing.crush("gravel")
        processing.crush("cobblestone")
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
        monitor.write(items.itemCount(prevoutput))
    end
    sleep(1)
end