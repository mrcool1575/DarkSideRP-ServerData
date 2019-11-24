local outfits = {
     ['Kortærmet skjorte (Betjent+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 1, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 1, 1 },
            { 8, 59, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 95, 3 },
        },
    },
    ['Kortærmet skjorte (elever+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 1, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 1, 1 },
            { 8, 59, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 95, 2 },
        },
    },
    ['Langærmet trøje (betjent+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 2, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 1, 1 },
            { 8, 59, 1 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 51, 1 },
        },
    },
    ['Vinterjakke (elever+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 2, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 1, 1 },
            { 8, 11, 4 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 74, 1 },
        },
    },
    ['Regnjakke (Betjent+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 2, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 39, 1 },
            { 8, 11, 4 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 70, 1 },
        },
    },
    ['Jakke (Betjent+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 2, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 39, 1 },
            { 8, 11, 4 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 164, 1 },
        },
    },
    ['Jakke (ledelse+)'] = {
        category = 'Politi',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 8, 0 },
            { 1, 0, 0 },
            { 2, 33, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 0, 1 },
            { 3, 2, 1 },
            { 4, 32, 1 },
            { 5, 1, 1 },
            { 6, 25, 1 },
            { 7, 39, 1 },
            { 8, 32, 4 },
            { 9, 1, 1 },
            { 10, 1, 1 },
            { 11, 169, 1 },
        },
    },
    
    
}

local function setOutfit(outfit)
    local ped = PlayerPedId()

    RequestModel(outfit.ped)

    while not HasModelLoaded(outfit.ped) do
        Wait(0)
    end

    if GetEntityModel(ped) ~= GetHashKey(outfit.ped) then
        SetPlayerModel(PlayerId(), outfit.ped)
    end

    ped = PlayerPedId()

    for _, comp in ipairs(outfit.components) do
       SetPedComponentVariation(ped, comp[1], comp[2] - 1, comp[3] - 1, 0)
    end

    for _, comp in ipairs(outfit.props) do
        if comp[2] == 0 then
            ClearPedProp(ped, comp[1])
        else
            SetPedPropIndex(ped, comp[1], comp[2] - 1, comp[3] - 1, true)
        end
    end
end

local categoryOutfits = {}

for name, outfit in pairs(outfits) do
    if not categoryOutfits[outfit.category] then
        categoryOutfits[outfit.category] = {}
    end

    categoryOutfits[outfit.category][name] = outfit
end

local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('OriginEUP', 'Vælg dit outfit!')

for name, list in pairs(categoryOutfits) do
    local subMenu = menuPool:AddSubMenu(mainMenu, name)

    for id, outfit in pairs(list) do
        outfit.item = NativeUI.CreateItem(id, 'Vælg dette outfit')
        subMenu:AddItem(outfit.item)
    end

    subMenu.OnItemSelect = function(sender, item, index)
        -- find the outfit
        for _, outfit in pairs(list) do
            if outfit.item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end
end

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

RegisterCommand('eup', function()
    mainMenu:Visible(not mainMenu:Visible())
end, false)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)