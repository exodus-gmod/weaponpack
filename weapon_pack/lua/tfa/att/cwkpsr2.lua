if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "KP SR-2"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {TFA.AttachmentColors["="], "KP SR-2",TFA.AttachmentColors["-"],"Slower ADS Speed"}
ATTACHMENT.Icon = "entities/cwkpsr2.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "KP SR-2"

ATTACHMENT.WeaponTable = {
	
	["VElements"] = {
	["Iron"] = {
		["active"] = false
	},	
	["Iron Dot"] = {
		["active"] = false
	},	
	["CWKPSR2 Dot"] = {
		["active"] = true
		},
	["CWKPSR2"] = {
		["active"] = true
		},
	["Rail"] = {
		["active"] = true
		}		
	},
	["IronSightsPos"] = function(wep, val) return wep.IronSightsPos_CWKPSR2 or val, true end,
	["IronSightsAng"] = function(wep, val) return wep.IronSightsAng_CWKPSR2 or val, true end,
	["IronSightTime"] = function(wep, val) return val * 1.1 end,
	["MoveSpeed"] = function(wep,stat) return stat * 1 end,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end