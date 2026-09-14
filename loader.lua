if not game:IsLoaded() then
    game.Loaded:Wait()
end

local scripts = {
    [79908803570376] = "anime-war-rng",
    [10503838245] = "PopBubbles",
}

local gameId = game.GameId
local scriptName = scripts[gameId]

if not scriptName then
    warn(("[WaveHub] Unsupported game\nGameId: %s\nPlaceId: %s")
        :format(gameId, game.PlaceId))
    return
end

local url = ("https://raw.githubusercontent.com/wavechayakon/WaveHub/main/games/%s.lua")
    :format(scriptName)

local ok, source = pcall(function()
    return game:HttpGet(url)
end)

if not ok then
    error(("[WaveHub] Failed to download %s: %s")
        :format(scriptName, tostring(source)))
end

local chunk, err = loadstring(source)

if not chunk then
    error(("[WaveHub] Failed to compile %s: %s")
        :format(scriptName, tostring(err)))
end

return chunk()
