if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "SWR Spectre Silencer"
ATTACHMENT.Description = {TFA.AttachmentColors["+"], "Reduced Firing Noise", "Slightly Reduced Spread",TFA.AttachmentColors["-"],"15% less range", "Slower ADS Speed",}
ATTACHMENT.Icon = "entities/cwspectre.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Spectre"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
			["CWSpectre"] = {
			["active"] = true
		}
	},
	
	["Bodygroups_V"] = {
		[2] = 1
	},
	["Primary"] = {
                ["Sound"] = function( wep, stat) return wep.Primary.Sound_SIL or stat end, --Silenced sound
                ["MinRangeStartFalloff"] = function( wep, stat ) return stat * 0.85 end,
                ["Spread"] = function( wep, stat ) return stat * 0.9 end,
		["IronSightTime"] = function( wep, stat ) return stat * 1.3 end,
                ["KickHorizontal"] = function( wep, stat ) return stat * 0.95 end,
        },
	["MuzzleAttachmentMod"] = 1,--Muzzle flash attachment
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced"
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end