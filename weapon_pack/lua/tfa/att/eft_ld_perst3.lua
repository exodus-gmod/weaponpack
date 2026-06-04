if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Zenith PERST-3"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "Makes laser dot for easier aiming"
}
ATTACHMENT.Icon = "entities/eft_perst3.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "LASR"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["perst3_laser"] = {
			["active"] = true
		},
		["laser_beam"] = {
			["active"] = false
		}
	},
	["WElements"] = {
		["perst3_laser"] = {
			["active"] = true
		},
		["laser_beam"] = {
			["active"] = false
		}
	},
	["Primary"] = {
		["Spread"] = function(wep,stat) return math.max( stat * 0.95, stat - 0.01 ) end
	},
	["LaserSightAttachment"] = function(wep,stat) return wep.LaserSightModAttachment end,
	["LaserSightAttachmentWorld"] = function(wep,stat) return wep.LaserSightModAttachmentWorld or wep.LaserSightModAttachment end
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
