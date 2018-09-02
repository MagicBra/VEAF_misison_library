mist = {}
veaf = {}
math.randomseed(os.time())

function veaf.logInfo(text)
  print("INFO VEAF - " .. text)
end

function veaf.logDebug(text)
  print("DEBUG VEAF - " .. text)
end

function veaf.logTrace(text)
  print("TRACE VEAF - " .. text)
end

dofile("dcsUnits.lua")
dofile("veafUnits.lua")
dofile("veafSpawn.lua")

veafCasMission = {}

--- Generates an infantry group along with its manpad units and tranport vehicles
function veafCasMission.generateInfantryGroup(groupId, spawnSpot, defense, armor, skill)
    local group = {}
    group.units = {}
    group.disposition = { h = 4, w = 3}
    group.description = "Random Infantry Group #" .. groupId
    
    -- generate an infantry group
    local groupCount = math.random(3, 7)
    local dispersion = (groupCount+1) * 5 + 25
    for i = 1, groupCount do
        group.units[i] = veafUnits.findUnit("INF Soldier AK")
    end

    -- add a transport vehicle
    if armor > 0 then
        group.units[groupCount+1] =  veafUnits.findUnit("IFV BTR-80")
    else
        group.units[groupCount+1] =  veafUnits.findUnit("Truck GAZ-3308")
    end
    group.units[groupCount+1].cell = 11

    -- add manpads if needed
    if defense > 3 then
        -- for defense = 4-5, spawn a full Igla-S team
        group.units[groupCount+2] =  veafUnits.findUnit("SA-18 Igla-S comm")
        group.units[groupCount+3] =  veafUnits.findUnit("SA-18 Igla-S manpad")
    elseif defense > 0 then
        -- for defense = 1-3, spawn a single Igla soldier
        group.units[groupCount+2] =  veafUnits.findUnit("SA-18 Igla manpad")
    else
        -- for defense = 0, don't spawn any manpad
    end

    return group
end

--- Generates an infantry group along with its manpad units and tranport vehicles
function veafCasMission.generateInfantryGroup2(groupId, spawnSpot, defense, armor, skill)
    local group = {}
    group.units = {}
    group.disposition = { h = 5, w = 5}
    group.description = "Random Infantry Group #" .. groupId
    
    -- generate an infantry group
    local groupCount = math.random(15, 22)
    local dispersion = (groupCount+1) * 5 + 25
    for i = 1, groupCount do
        group.units[i] = veafUnits.findUnit("INF Soldier AK")
    end

    return group
end


function veafUnits.checkPositionForUnit(spawnPosition, unit)
    return true
end

local spawnPosition = {x=-321835.9, y=562.0, z=888712.0}
local spacing = 10
--local group = veafUnits.findGroup("infsec")
--local group = veafCasMission.generateInfantryGroup(1, spawnPosition, 4, 1, "Random")
--local group, cells = veafUnits.placeGroup(group, spawnPosition, spacing)
--veafUnits.debugGroup(group, cells)
veafSpawn.spawnUnit(spawnPosition, "sa9")
--local unit = veafUnits.findUnit("sa9")
--spawnPoint = veafUnits.correctPositionForUnit(spawnPosition, unit)

        local toInsert = {
                ["x"] = spawnPosition.x,
                ["y"] = spawnPosition.z,
                ["alt"] = spawnPosition.y,
                ["type"] = unit.unitType,
                ["name"] = unitName,
                ["heading"] = 0,
                ["skill"] = "Random"
            }

        veafSpawn.logDebug(string.format("spawnUnit: toInsert x=%.1f y=%.1f, alt=%.1f, type=%s, name=%s, heading=%d, skill=%s", toInsert.x, toInsert.y, toInsert.alt, toInsert.type, toInsert.name, toInsert.heading, toInsert.skill ))
