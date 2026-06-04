if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Muzzle Brake"
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "15% less recoil",
	TFA.AttachmentColors["-"], "Sigificantly reduced ADS Speed",
}
ATTACHMENT.Icon = "entities/tfa_ins2_deagle_br_comp.png"
ATTACHMENT.ShortName = "COMP"

ATTACHMENT.WeaponTable = {
	["Bodygroups_V"] = {
		["Barrel_Ext"] = 1
	},
	["Bodygroups_W"] = {
		["Barrel_Ext"] = 1
	},
	["Primary"] = {
		["KickUp"] = function(wep, stat) return stat * 0.85 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.85 end,

	},
	["IronSightTime"] = function(wep, stat) return stat * 1.35 end,
	["MuzzleFlashEffect"] = "tfa_muzzleflash_revolver",
	["MuzzleAttachmentMod"] = function(wep, stat) return wep.MuzzleAttachmentComp or stat end,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
