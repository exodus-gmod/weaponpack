if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "SureFire X400 Laser + Flashlight"
ATTACHMENT.ShortName   = "X400"

ATTACHMENT.Icon        = "entities/eft_x400.png" 

ATTACHMENT.Description = { 
    TFA.AttachmentColors["+"], "Slightly Lowers Spread",
	TFA.AttachmentColors["+"], "Improves ADS Speed",
    TFA.AttachmentColors["-"], "Visible Laser",
    TFA.AttachmentColors["-"], "Slows Down ADS Movement",  
}

ATTACHMENT.WeaponTable = {

	["VElements"] = {
		["laser_railed"] = {
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

	["LaserDistance"]        = 12 * 250,
	["LaserDistanceVisual"]  = 12 * 6.5,
	["laserFOV"]             = 0.8,
	
	["FlashlightAttachment"] = 1,
	["FlashlightDistance"]   = 10 * 70,
	["FlashlightBrightness"] = 7.5,
	["FlashlightFOV"]        = 50,
	
	FlashlightSoundToggleOn = Sound("TFA_INS2.FlashlightOn"),
	FlashlightSoundToggleOff = Sound("TFA_INS2.FlashlightOff"),
}

function ATTACHMENT:Attach(wep)
	local owner = wep:GetOwner()

	if SERVER and IsValid(owner) and owner:IsPlayer() and owner:FlashlightIsOn() then
		owner:Flashlight(false)
	end
end

function ATTACHMENT:Detach(wep)
	if wep:GetFlashlightEnabled() then
		wep:ToggleFlashlight(false)
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end