if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Kobra"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {TFA.AttachmentColors["="], "Kobra",TFA.AttachmentColors["-"],"Slower ADS Speed"}
ATTACHMENT.Icon = "entities/cwkobra.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Kobra"

ATTACHMENT.WeaponTable = {
	
	["VElements"] = {
	["Iron"] = {
		["active"] = false
	},	
	["Iron Dot"] = {
		["active"] = false
	},	
	["CWKobra Dot"] = {
		["active"] = true
		},
	["CWKobra"] = {
		["active"] = true
		},
	["Rail"] = {
		["active"] = true
		}		
	},
	["IronSightsPos"] = function(wep, val) return wep.IronSightsPos_CWKobra or val, true end,
	["IronSightsAng"] = function(wep, val) return wep.IronSightsAng_CWKobra or val, true end,
	["IronSightTime"] = function(wep, val) return val * 1.1 end,
	["MoveSpeed"] = function(wep,stat) return stat * 1 end,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end