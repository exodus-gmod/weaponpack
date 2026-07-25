if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "Laser Railed"
ATTACHMENT.ShortName   = "LASRR"
ATTACHMENT.Icon        = "entities/ins2_att_ub_laser.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.Description = { 
    TFA.AttachmentColors["+"], "Slightly Lowered Spread", 
    TFA.AttachmentColors["+"], "Improves ADS Speed", 
    TFA.AttachmentColors["-"], "Visible Laser",
    TFA.AttachmentColors["-"], "Slows down ADS Movement", 
}

ATTACHMENT.WeaponTable = {

	["VElements"] = {
		["laser"] = {
			["active"] = true
		},
		
		["laser_modkit"] = {
			["active"] = true
		},
		
		["laser_beam"] = {
			["active"] = true
		}
	},
	
	["WElements"] = {
		["laser"] = {
			["active"] = true
		},
		
		["laser_beam"] = {
			["active"] = true
		}
	},
	
	["Primary"] = {
		["Spread"] = function(wep,stat) return stat - 0.01 end,
	},

	["IronSightTime"] = function(wep, stat) return stat * 0.85 end,
		["IronSightsMoveSpeed"] = function (wep, stat) return stat * 0.95 end,
	
	["LaserSightAttachment"]      = function(wep,stat) return wep.LaserSightModAttachment end,
	["LaserSightAttachmentWorld"] = function(wep,stat) return wep.LaserSightModAttachmentWorld or wep.LaserSightModAttachment end,

	["LaserDistance"]        = 12 * 150,
--	["LaserDistanceVisual"]  = 12 * 4,
	["laserFOV"]             = 0.8,

	["FlashlightAttachment"] = 1,
	["FlashlightDistance"]   = 12 * 140,
	["FlashlightBrightness"] = 9.5,
	["FlashlightFOV"]        = 55,
	
	FlashlightSoundToggleOn  = Sound("TFA_INS2.FlashlightOn"),
	FlashlightSoundToggleOff = Sound("TFA_INS2.FlashlightOff"),
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end