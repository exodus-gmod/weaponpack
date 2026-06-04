if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Long Barrel"
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "20% Increased Range", "5% Reduced Recoil",
	TFA.AttachmentColors["-"], "Slightly Reduced ADS Speed", "5% Slower Movement Speed"
}
ATTACHMENT.Icon = "entities/tfa_ins2_deagle_br_ext.png"
ATTACHMENT.ShortName = "LONG"

ATTACHMENT.WeaponTable = {
	["Bodygroups_V"] = {
		["Barrel"] = 1
	},
	["Bodygroups_W"] = {
		["Barrel"] = 1
	},
	["Primary"] = {
		["KickUp"] = function(wep, stat) return stat * 0.95 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.95 end,

		["MoveSpeed"] = function(wep, stat) return stat * 0.95 end,
		["IronSightsMoveSpeed"] = function(wep, stat) return stat * 0.95 end,

		["Range"] = function(wep, stat) return stat * 1.2 end,
	},
	["IronSightTime"] = function(wep, stat) return stat * 1.2 end,
	["MuzzleAttachmentMod"] = function(wep, stat) return wep.MuzzleAttachmentExt or stat end,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
