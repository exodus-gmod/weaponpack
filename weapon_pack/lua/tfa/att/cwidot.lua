if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Irondot"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {TFA.AttachmentColors["="], "Irondot",TFA.AttachmentColors["-"],"Slower ADS Speed"}
ATTACHMENT.Icon = "entities/cwidot.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Irondot"

ATTACHMENT.WeaponTable = {
	
	["VElements"] = {
	["Iron"] = {
		["active"] = false
	},	
	["Iron Dot"] = {
		["active"] = false
	},	
	["CWIdot Dot"] = {
		["active"] = true
		},
	["CWIdot"] = {
		["active"] = true
		},
	["Rail"] = {
		["active"] = true
		}		
	},
	["IronSightsPos"] = function(wep, val) return wep.IronSightsPos_CWIdot or val, true end,
	["IronSightsAng"] = function(wep, val) return wep.IronSightsAng_CWIdot or val, true end,
	["IronSightTime"] = function(wep, val) return val * 1.1 end,
	["MoveSpeed"] = function(wep,stat) return stat * 1 end,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end