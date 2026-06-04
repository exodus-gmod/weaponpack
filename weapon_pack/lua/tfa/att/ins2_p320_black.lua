if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Black Cover"
ATTACHMENT.Description = {
	Color(80, 160, 153), "- Black Painting",
}
ATTACHMENT.Icon = "entities/wyvern.png"
ATTACHMENT.ShortName = "Black"

ATTACHMENT.WeaponTable = {
	["MaterialTable_V"] = {
		[1] = "models/weapons/p320/toko/weapon_m9_dm",
	},
	["MaterialTable_W"] = {
		[1] = "models/weapons/p320/toko/weapon_m9_dm",
	},
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
