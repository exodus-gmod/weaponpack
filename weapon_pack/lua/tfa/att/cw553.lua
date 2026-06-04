if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "EOTech 553"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {TFA.AttachmentColors["="], "EOTech 553",TFA.AttachmentColors["-"],"Slower ADS Speed"}
ATTACHMENT.Icon = "entities/cw553.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "553"

ATTACHMENT.WeaponTable = {
	
	["VElements"] = {
	["Iron"] = {
		["active"] = false
	},	
	["Iron Dot"] = {
		["active"] = false
	},	
	["CW553 Dot"] = {
		["active"] = true
		},
	["CW553"] = {
		["active"] = true
		},
	["Rail"] = {
		["active"] = true
		}		
	},
	["IronSightsPos"] = function(wep, val) return wep.IronSightsPos_CW553 or val, true end,
	["IronSightsAng"] = function(wep, val) return wep.IronSightsAng_CW553 or val, true end,
	["IronSightTime"] = function(wep, val) return val * 1.1 end,
	["MoveSpeed"] = function(wep,stat) return stat * 1 end,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end