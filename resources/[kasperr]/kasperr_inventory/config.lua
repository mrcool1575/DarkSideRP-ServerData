Config = {}

Config.OpenMenu = 303 -- Key: U
Config.AntiSpamCooldown = 2
Config.Language = {
    Title = "Inventar",
    PleaseWait = "Vent venligst...",
    Error = "Der opstod et problem.",
    WarningTitle = "Advarsel",
    WeaponNotEquipped = "Du har ikke taget våbnet i brug endnu.",
    CannotBeUsed = "Denne genstand kan ikke benyttes fra dit inventar",
    NotEnoughtSpace = "Personen har ikke plads i sin taske",
    NoNearby = "Ingen personer i nærheden"
}

items = {}
-- Random shit
items["weed"] = {"none", 0, "weed.png"}
-- Heal
items["pills"] = {"heal", 0, "pills.png"}
-- Drinks
items["water"] = {"drink", -25, "water.png"}
-- Food
items["bread"] = {"food", -10, "bread.png"}
-- Weapons
items["wbody|WEAPON_COMBATPISTOL"] = {"weapon", 0, "combatpistol.png"}
-- Ammo
items["wammo|WEAPON_COMBATPISTOL"] = {"ammo", 0, "pistol_ammo.png"}