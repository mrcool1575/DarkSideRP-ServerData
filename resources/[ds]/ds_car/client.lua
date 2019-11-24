local vehicles = {
    -- Fotovogne
    {Model= "burrito3", X= -453.00729370117, Y= -144.88781738281, Z= 37.048791503906, A= 27.267488479614},
    {Model= "burrito3", X= 343.28149414063, Y= -741.33166503906, Z= 28.22426376343, A= 341.26953125},
    {Model= "burrito3", X= 583.68109130859, Y= -1038.8240966797, Z= 35.892339324951, A= 276.79147338867},
    {Model= "burrito3", X= 1159.4560546875, Y= 603.40740966797, Z= 97.600476074219, A= 143.62663269043},
    {Model= "burrito3", X= 2419.0642089844, Y= 3944.5319824219, Z= 35.251952362061, A= 315.15115356445},
    {Model= "burrito3", X= -196.72119140625, Y= 6163.0190429688, Z= 30.325545883179, A= 314.62280273438},
    {Model= "burrito3", X= 1667.8442382813, Y= 1360.7210693359, Z= 86.216006469727, A= 169.68803405762},
    {Model= "burrito3", X= 2234.185546875, Y= 2738.4643554688, Z= 44.230134735107, A= 297.9485168457},
    -- Bilshoppen
    {Model= "p1", X= -43.417591094971, Y= -1094.283203125, Z= 25.122351837158, A= 245.74610900879},
    {Model= "vader", X= -47.269626617432, Y= -1104.3172607422, Z= 25.402332763672, A= 289.3078918457},
    {Model= "pcj", X= -48.859111785889, Y= -1103.8341064453, Z= 25.402332763672, A= 289.3078918457},
    {Model= "sanchez", X= -50.264755249023, Y= -1103.2235107422, Z= 25.402332763672, A= 297.94033813477},
}
RegisterNetEvent("hp_carplacer:place")
AddEventHandler("hp_carplacer:place", function()
    for _, item in pairs(vehicles) do
        RequestModel(GetHashKey(item.Model));
        while not HasModelLoaded(GetHashKey(item.Model)) do
            RequestModel(GetHashKey(item.Model));
            Wait(50)
        end
        local vehicle = CreateVehicle(GetHashKey(item.Model), item.X, item.Y, item.Z, item.A, false, false)
        FreezeEntityPosition(vehicle,true)
    end
end)