if not ATTACHMENT then
	ATTACHMENT = {}
end
ATTACHMENT.Name = "Stock"
ATTACHMENT.Description = {TFA.AttachmentColors["="], "Increases movement speed and reduces recoil when aiming", TFA.AttachmentColors["+"], "30% Faster ADS move speed", "20% Lower recoil"}
ATTACHMENT.Icon = "entities/416_stock.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "STOCK"

ATTACHMENT.WeaponTable = {
	["IronSightsMoveSpeed"] = function(wep, val) return val / 0.7 end,
	["Primary"] = {
		["KickUp"] = function(wep, stat) return stat * 0.8 end,
		["KickDown"] = function(wep, stat) return stat * 0.8 end,
		["KickHorizontal"] = function(wep, stat) return stat * 0.8 end
	},
	["Bodygroups_V"] = {
		[2] = 1
	},
	["Bodygroups_W"] = {
		[2] = 1
	}
}
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end