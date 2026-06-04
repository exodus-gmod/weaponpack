if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Silencerco Osprey Silencer"
ATTACHMENT.Description = {TFA.AttachmentColors["="], "Osprey Silencer",TFA.AttachmentColors["-"],"25% less damage",TFA.AttachmentColors["+"],"25% Less Kick Up",}
ATTACHMENT.Icon = "entities/cwosprey.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Osprey"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
			["CWOsprey"] = {
			["active"] = true
		}
	},
	
	["Bodygroups_V"] = {
		[2] = 1
	},
	["Primary"] = {
                ["Sound"] = function( wep, stat) return wep.Primary.Sound_SIL or stat end, --Silenced sound
                ["Damage"] = function( wep, stat ) return stat * 0.75 end,
                ["KickUp"] = function( wep, stat ) return stat * 0.75 end,
                ["KickDown"] = function( wep, stat ) return stat * 0.75 end,
                ["KickHorizontal"] = function( wep, stat ) return stat * 0.75 end,
        },
	["MuzzleAttachmentMod"] = 1,--Muzzle flash attachment
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced"
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end