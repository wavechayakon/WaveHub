if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE = "https://raw.githubusercontent.com/wavechayakon/WaveHub/main/games/"

local games = {
    [10494501626] = "anime-war-rng.lua",
    [10503838245] = "PopBubbles.lua",
}

local file = games[game.GameId]

if not file then
    warn(("[WaveHub] Unsupported game\nGameId: %s\nPlaceId: %s")
        :format(tostring(game.GameId), tostring(game.PlaceId)))
    return
end

local ok, source = pcall(function()
    return game:HttpGet(BASE .. file)
end)

if not ok then
    error(("[WaveHub] Failed to download %s: %s")
        :format(file, tostring(source)))
end

local chunk, err = loadstring(source)

if not chunk then
    error(("[WaveHub] Failed to compile %s: %s")
        :format(file, tostring(err)))
end

return chunk()
