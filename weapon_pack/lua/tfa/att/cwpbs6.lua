if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "PBS-6"
ATTACHMENT.Description = {TFA.AttachmentColors["="], "Suppressor",TFA.AttachmentColors["-"],"15% less damage",TFA.AttachmentColors["+"],"15% Less Kick Up",}
ATTACHMENT.Icon = "entities/cwpbs6.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "PBS6"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
			["CWPBS6"] = {
			["active"] = true
		}
	},
	
	["Bodygroups_V"] = {
		[2] = 1
	},
	["Primary"] = {
                ["Sound"] = function( wep, stat) return wep.Primary.Sound_SIL or stat end, --Silenced sound
                ["Damage"] = function( wep, stat ) return stat * 0.85 end,
                ["KickUp"] = function( wep, stat ) return stat * 0.9 end,
                ["KickDown"] = function( wep, stat ) return stat * 0.8 end,
                ["KickHorizontal"] = function( wep, stat ) return stat * 0.9 end,
        },
	["MuzzleAttachmentMod"] = 1,--Muzzle flash attachment
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced"
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end