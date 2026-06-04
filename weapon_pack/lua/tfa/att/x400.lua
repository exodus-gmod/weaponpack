if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "X400 tactical flashlight"
ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "50% lower base spread"
}
ATTACHMENT.Icon = "entities/eft_x400.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "X400"

ATTACHMENT.WeaponTable = {
	["Bodygroups_V"] = {
        [2] =  1
    },
	["Primary"] = {
		["Spread"] = function(wep,stat) return math.max( stat * 0.5, stat - 0.01 ) end
	},
	["LaserSightAttachment"] = function(wep,stat) return wep.LaserSightModAttachment end,
	["LaserSightAttachmentWorld"] = function(wep,stat) return wep.LaserSightModAttachmentWorld or wep.LaserSightModAttachment end,
	["FlashlightAttachment"] = 1,
	["FlashlightDistance"] = 12 * 100,
	["FlashlightBrightness"] = 9.5,
	["FlashlightFOV"] = 55,

	FlashlightSoundToggleOn  = Sound("TFA_INS2.FlashlightOn"),
	FlashlightSoundToggleOff = Sound("TFA_INS2.FlashlightOff"),

}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end