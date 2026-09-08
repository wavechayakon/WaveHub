if not game:IsLoaded() then
    game.Loaded:Wait()
end

local scripts = {
    [79908803570376] = "anime-war-rng",
}

local scriptName = scripts[game.PlaceId]
if not scriptName then
    warn(("[WaveHub] Unsupported game: %s"):format(game.PlaceId))
    return
end

local url = ("https://raw.githubusercontent.com/wavechayakon/WaveHub/main/games/%s.lua"):format(scriptName)
local source = game:HttpGet(url)
local chunk, err = loadstring(source)

if not chunk then
    error(("[WaveHub] Failed to load %s: %s"):format(scriptName, tostring(err)))
end

return chunk()
